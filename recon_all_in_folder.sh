#!/bin/bash
# $1=path to your subjects dir (here subjects will be saved)
# $2=path to source folder with patients data

export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR

for mprage_dir in $2*
do
    for file in $mprage_dir/*
    do
        if [[ $file == *.nii ]]
            then
                subj_name="$(basename $mprage_dir)_fs"
                echo $subj_name

                recon-all -i $file -subject $subj_name -all -parallel -openmp 6 -qcache
        fi
    done
done
