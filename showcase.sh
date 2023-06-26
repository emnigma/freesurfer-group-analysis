subject=$1

freeview \
    -f "$subject"/surf/lh.white:edgecolor=blue \
    "$subject"/surf/lh.pial:edgecolor=red \
    "$subject"/surf/rh.white:edgecolor=blue \
    "$subject"/surf/rh.pial:edgecolor=red
