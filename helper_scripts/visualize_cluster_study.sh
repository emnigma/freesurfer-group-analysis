#!/bin/bash
# $1=path to your subjects dir
# $2=target subject
# $3=path to cache.th{thresh_value*10}.sig.cluster.mgh file
export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR

freeview -f $SUBJECTS_DIR/$2/surf/lh.inflated:overlay=$3
