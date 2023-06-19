#!/bin/bash
# $1=path to your subjects dir
# $2=path to .fsgd file with study
# $3=path to folder to save results
# $4=target subject (must be in SUBJECTS_DIR)
# name of .fsgd file == study_name

export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR
smoothing=10

save_dir=$3
target_subject=$4

study_file="$(basename $2)"
study_name="${study_file%.*}"

echo $study_name

for hemi in lh rh
do
    for meas in volume thickness
    do  
        mris_preproc --fsgd $study_name.fsgd \
            --meas $meas \
            --target $target_subject \
            --hemi $hemi \
            --out $save_dir/$hemi.$meas.$study_name.00.mgh \
            --surfreg sphere.reg
    done

    for meas in volume thickness
    do
        mri_surf2surf --hemi $hemi \
            --s $target_subject \
            --sval $save_dir/$hemi.$meas.$study_name.00.mgh \
            --fwhm $smoothing \
            --cortex \
            --tval $save_dir/$hemi.$meas.$study_name.$smoothing.mgh
    done
done
