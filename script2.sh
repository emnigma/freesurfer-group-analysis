good_output=$1


freeview -f  "$good_output"/surf/lh.pial:annot=aparc.annot:name=pial_aparc:visible=0 \
"$good_output"/surf/lh.pial:annot=aparc.a2009s.annot:name=pial_aparc_des:visible=0 \
"$good_output"/surf/lh.white:overlay=lh.thickness:overlay_threshold=0.1,3::name=inflated_thickness:visible=0 \
"$good_output"/surf/lh.pial:overlay=lh.thickness:overlay_threshold=0.1,3::name=inflated_thickness:visible=0 \
"$good_output"/surf/lh.inflated:visible=0 \
"$good_output"/surf/lh.white:visible=0 \
"$good_output"/surf/lh.pial \
--viewport 3d