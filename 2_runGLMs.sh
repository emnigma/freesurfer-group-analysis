#!/bin/bash
# $1=path to .fsgd file with study
# $2=path to contrasts file
# $3=path with preproc results
# $4=path to folder to save results

smoothness=10

study_file="$(basename $1)"
study_name="${study_file%.*}"

contrast_file=$2
preproc_dir=$3
glm_results_dir=$4

for hemi in lh rh
do
    for meas in volume thickness
    do
        mri_glmfit \
            --y $preproc_dir/$hemi.$meas.$study_name.$smoothness.mgh \
            --fsgd $study_name.fsgd \
            --C $contrast_file \
            --surf fsaverage $hemi \
            --cortex \
            --glmdir $glm_results_dir/$hemi.$meas.$study_name.$smoothness.glmdir
    done
done
