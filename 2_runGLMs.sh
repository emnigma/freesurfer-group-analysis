#!/bin/bash
# $1=path to your subjects dir
# $2=path to .fsgd file with study
# $3=path to contrasts file
# $4=path with preproc results
# $5=path to folder to save results
# $6=target subject (must be in SUBJECTS_DIR)

smoothness=10

export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR

study_file="$(basename $2)"
study_name="${study_file%.*}"

contrast_file=$3
preproc_dir=$4
glm_results_dir=$5
target_subject=$6

for hemi in lh rh
do
    for meas in volume thickness
    do
        mri_glmfit \
            --y $preproc_dir/$hemi.$meas.$study_name.$smoothness.mgh \
            --fsgd $study_name.fsgd \
            --C $contrast_file \
            --cortex \
            --glmdir $glm_results_dir/$hemi.$meas.$study_name.$smoothness.glmdir
    done
done
