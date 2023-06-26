#!/bin/bash
# $1=path to .fsgd file with study
# $2=path to glm studies results
# $3=smoothing value

export LC_NUMERIC="en_US.UTF-8"

smoothness=$3

study_file="$(basename $1)"
study_name="${study_file%.*}"

glm_results_dir=$2

for hemi in lh rh
do
    for meas in thickness volume
    do
        for dir in $glm_results_dir/$hemi.$meas.$study_name.$smoothness.glmdir
        do
            mri_glmfit-sim \
                --glmdir {$dir} \
                --cache 3.0 pos \
                --cwp 0.05  \
                --2spaces
        done
    done
done