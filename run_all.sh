#!/bin/bash

# $1=path to subjects dir
# $2=path to .fsgd file with study
# $3, $4=paths to .mtx contrasts files
# $5=target subject (must be in SUBJECTS_DIR)

subjects_dir=$1
fsgd_file=$2
contrasts_file_1=$3
contrasts_file_2=$4
target_subject=$5

study_filename="$(basename $fsgd_file)"
study_name="${study_filename%.*}"

contrasts_file_1_filename="$(basename $contrasts_file_1)"
contrasts_file_1_name="${contrasts_file_1_filename%.*}"

contrasts_file_2_filename="$(basename $contrasts_file_2)"
contrasts_file_2_name="${contrasts_file_2_filename%.*}"

preproc_dir=./1_preproc_results/
glm_dir=./2_glm_studies_results/

mkdir $preproc_dir
mkdir $glm_dir

echo running preprocessing

bash 1_runMrisPreproc.sh \
    $subjects_dir \
    $fsgd_file \
    $preproc_dir \
    $target_subject

echo running glms

for contrast_file in $contrasts_file_1 $contrasts_file_2
do
    bash 2_runGLMs.sh \
        $subjects_dir \
        $fsgd_file \
        $contrast_file \
        $preproc_dir \
        $glm_dir \
        $target_subject
done

echo running cluster sims

bash 3_runClusterSims.sh \
    $fsgd_file \
    $glm_dir

# to check results
for contrast in $contrasts_file_1_name $contrasts_file_2_name
do
    bash helper_scripts/visualize_glm_study.sh \
        $subjects_dir \
        $target_subject \
        $glm_dir/lh.thickness.$study_name.10.glmdir/$contrast/sig.mgh &

    bash helper_scripts/visualize_cluster_study.sh \
        $subjects_dir \
        $target_subject \
        $glm_dir/lh.thickness.$study_name.10.glmdir/$contrast/cache.th30.pos.sig.cluster.mgh &

    cat $glm_dir/lh.thickness.$study_name.10.glmdir/$contrast/cache.th30.pos.sig.cluster.summary
done
