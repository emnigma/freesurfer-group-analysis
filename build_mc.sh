# $1=target_subject to build sim for

subject=$1

for hemi in lh rh
do
    mri_mcsim --o ./temp/average/mult-comp-cor/$subject/$hemi/cortex --base mc-z --surface $subject $hemi --nreps 10000
done
