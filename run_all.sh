#!/bin/bash

# $1=path to subjects dir
# $2=path to .fsgd file with study
# $3, $4=paths to .mtx contrasts files

subjects_dir=$1
fsgd_file=$2
contrasts_file_1=$3
contrasts_file_2=$4

study_filename="$(basename $fsgd_file)"
study_name="${study_filename%.*}"

contrasts_file_1_filename="$(basename $contrasts_file_1)"
contrasts_file_1_name="${contrasts_file_1_filename%.*}"

contrasts_file_2_filename="$(basename $contrasts_file_2)"
contrasts_file_2_name="${contrasts_file_2_filename%.*}"

preproc_dir=./1_preproc_results/
glm_dir=./2_glm_studies_results/

smoothing=10

mkdir $preproc_dir
mkdir $glm_dir

export SUBJECTS_DIR=$subjects_dir

echo running preprocessing

bash 1_runMrisPreproc.sh \
    $subjects_dir \
    $fsgd_file \
    $preproc_dir \
    $smoothing

echo running glms

for contrast_file in $contrasts_file_1 $contrasts_file_2
do
    bash 2_runGLMs.sh \
    $fsgd_file \
    $contrast_file \
    $preproc_dir \
    $glm_dir \
    $smoothing
done

echo running cluster sims

bash 3_runClusterSims.sh \
    $fsgd_file \
    $glm_dir \
    $smoothing

# normalize surfaces and check results
for contrast in $contrasts_file_1_name $contrasts_file_2_name
do
    for hemi in lh rh
    do
        data=$glm_dir/lh.thickness.$study_name.$smoothing.glmdir/$contrast/cache.th30.pos.sig.cluster.mgh
        save_name="$hemi".thickness.$smoothing.$contrast.normalized2conn_reference.mgh

        # normalization
        mri_surf2surf \
            --srcsubject fsaverage \
            --srcsurfval $data \
            --trgsubject referenceT1_fs \
            --trgsurfval $save_name \
            --hemi $hemi
    done
    freeview -f \
        $subjects_dir/referenceT1_fs/surf/lh.white:overlay=lh.thickness.$smoothing.$contrast.normalized2conn_reference.mgh \
        $subjects_dir/referenceT1_fs/surf/rh.white:overlay=rh.thickness.$smoothing.$contrast.normalized2conn_reference.mgh 
done

