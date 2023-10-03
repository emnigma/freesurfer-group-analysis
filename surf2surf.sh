export SUBJECTS_DIR=$1
echo $SUBJECTS_DIR


for hemi in lh rh
do
    data=2_glm_studies_results/$hemi.thickness.degradation_study.10.glmdir/control_vs_msa-c/cache.th30.pos.sig.cluster.mgh
    save_name="$hemi"_thickness_10_control_msac_cluster_registered.mgh

    mri_surf2surf \
        --srcsubject fsaverage \
        --srcsurfval $data \
        --trgsubject mni_icbm152 \
        --trgsurfval $save_name \
        --hemi $hemi
    
    freeview -f $SUBJECTS_DIR/mni_icbm152/surf/"$hemi".white:overlay=$save_name
done

