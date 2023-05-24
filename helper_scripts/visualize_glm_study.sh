#!/bin/bash
# $1=path to your subjects dir
# $2=path to .sig file
export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR

contrasts_file="$(basename $2)"
contrasts_name="${contrasts_file%.*}"

freeview -f $SUBJECTS_DIR/fsaverage/surf/lh.inflated:annot=aparc.annot:annot_outline=1:overlay=$2:overlay_threshold=3,5 -viewport 3d -layout 1