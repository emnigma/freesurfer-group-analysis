#!/bin/bash
# $1=path to your subjects dir
# $2=path to .fsgd file with study
# $3=path to folder to save results
# name of .fsgd file == study_name

export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR
smoothing=10

study_file="$(basename $2)"
study_name="${study_file%.*}"

echo $study_name

for hemi in lh rh
do
    for meas in volume thickness
    do
        mris_preproc --fsgd $study_name.fsgd \
            --cache-in $meas.fwhm$smoothing.fsaverage \
            --target fsaverage \
            --hemi $hemi \
            --out $3/$hemi.$meas.$study_name.$smoothing.mgh
    done
done
