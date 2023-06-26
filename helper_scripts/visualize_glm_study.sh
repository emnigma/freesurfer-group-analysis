#!/bin/bash
# $1=path to your subjects dir
# $2=target subject
# $3=path to .sig file
export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR

contrasts_file="$(basename $3)"
contrasts_name="${contrasts_file%.*}"

freeview -f $SUBJECTS_DIR/$2/surf/lh.inflated:annot=aparc.annot:annot_outline=1:overlay=$3:overlay_threshold=3,5 -viewport 3d -layout 1