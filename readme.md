# Scripts for freesurfer group analysis

## Reconstruction

before group analysis start you need to reconstruct all study subjects by running [run_all.sh](/run_all.sh) in subjects folder

## Set up

before before group analysis start you need to supply .fsgd file ([example](/degradation_study.fsgd)) with your reconstructed subjects separated into two classes and two .mtx contrast files with "1 -1", "-1 1" in them ([1](/control_vs_msa-c.mtx), [2](/msa-c_vs_control.mtx))

## Run

bash command example:
```sh
bash run_all.sh ./msa-c_vs_gamers_control/subjects/ ./degradation_study.fsgd control_vs_msa-c.mtx msa-c_vs_control.mtx 
```

## Remarks

- recon_all_in_folder.sh assumes that every subject has its own folder, in each subj folder there is a single MPRAGE file which freesurfer will user for reconstruction

- run_all.sh generates two analysis results, one for negative contrast, one for positive contrast. we need to visualize the one with correct clusters, for example:

good output:
![image](/resources/good_output.png)

with existing cluster info:
```
...
# ClusterNo  Max   VtxMax   Size(mm^2)  MNIX   MNIY   MNIZ    CWP    CWPLow    CWPHi   NVtxs    WghtVtx   Annot
   1        4.4127  135350    446.85    -50.3  -54.3    5.3  0.00020  0.00000  0.00040    798     2679.53  bankssts
   2        5.1951   74452    257.17    -12.5  -90.7   25.6  0.00539  0.00400  0.00679    310     1037.82  superiorparietal
   3        4.8151   46866    204.00     -8.0  -65.7   55.5  0.01772  0.01534  0.02010    443     1593.59  superiorparietal
```

bad output:
![image](/resources/bad_output.png)

with empty cluster info:
```
...
# ClusterNo  Max   VtxMax   Size(mm^2)  MNIX   MNIY   MNIZ    CWP    CWPLow    CWPHi   NVtxs    WghtVtx   Annot
```
