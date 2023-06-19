export SUBJECTS_DIR=msa-c_vs_gamers_control/subjects/
echo $SUBJECTS_DIR

bash run_all.sh \
    msa-c_vs_gamers_control/subjects/ \
    degradation_study.fsgd \
    control_vs_msa-c.mtx \
    msa-c_vs_control.mtx \
    ICBM2009c_asym_nlin
