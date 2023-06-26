subject=$1

freeview -v \
    "$subject"/mri/T1.mgz \
    "$subject"/mri/wm.mgz \
    "$subject"/mri/brainmask.mgz \
    "$subject"/mri/aseg.mgz:colormap=lut:opacity=0.2 \
    -f "$subject"/surf/lh.white:edgecolor=blue \
    "$subject"/surf/lh.pial:edgecolor=red \
    "$subject"/surf/rh.white:edgecolor=blue \
    "$subject"/surf/rh.pial:edgecolor=red \
    "$subject"/surf/lh.pial:overlay=lh.thickness:overlay_threshold=0.1,3::name=inflated_thickness:visible=0
