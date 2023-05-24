#!/bin/bash
# $1=path to your subjects dir
# $2=path to cache.th{thresh_value*10}.sig.cluster.mgh file
export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR

freeview -f $SUBJECTS_DIR/fsaverage/surf/lh.inflated:overlay=$2