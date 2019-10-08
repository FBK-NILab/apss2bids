#!/bin/bash

subject=$1
TAG=$2
sub=${subject:8:2} #if 10 < subject ID < 100

SRC_DIR=$(realpath ../../../APSS_Sarubbo_all_patients/original/trk_nifti)
T1w_DIR=$(realpath ../../input/anat)
DMRI_DIR=$(realpath ../../input/dwi)
FA_DIR=$(realpath ../../derivatives/FA_${TAG})
TRK_DIR=$(realpath ../../derivatives/tractography_${TAG})

echo "Processing ${subject}..."

# -----------------------------------------------------------------------#

echo "Creating T1w directory..."
if [ ! -d ${T1w_DIR} ]; then mkdir ${T1w_DIR}; fi
if [ ! -d ${T1w_DIR}/sub-${sub} ]; then mkdir ${T1w_DIR}/sub-${sub}; fi
t1_file=${SRC_DIR}/${subject}/Niftii/Structural/*.nii
echo "renaming $t1_file"
ln -sf $t1_file ${T1w_DIR}/sub-${sub}/sub-${sub}_t1.nii.gz

# -----------------------------------------------------------------------#

echo "Creating dmri directory..."
if [ ! -d ${DMRI_DIR} ]; then mkdir ${DMRI_DIR}; fi
if [ ! -d ${DMRI_DIR}/sub-${sub} ]; then mkdir ${DMRI_DIR}/sub-${sub}; fi
dmri_file=${SRC_DIR}/${subject}/Niftii/Diffusion/*_dmri.nii
bval=${SRC_DIR}/${subject}/Niftii/Diffusion/*bval
bvec=${SRC_DIR}/${subject}/Niftii/Diffusion/*bvec
iso_file=${SRC_DIR}/${subject}/Niftii/Diffusion/*_iso.nii.gz
echo "renaming $dmri_file"
ln -sf $dmri_file ${DMRI_DIR}/sub-${sub}/sub-${sub}_dmri.nii.gz
ln -sf $bval ${DMRI_DIR}/sub-${sub}/sub-${sub}_bval
ln -sf $bvec ${DMRI_DIR}/sub-${sub}/sub-${sub}_bvec
#ln -sf $iso_file ${DMRI_DIR}/sub-${sub}/sub-${sub}_iso.nii.gz

# -----------------------------------------------------------------------#

echo "Creating FA directory..."
if [ ! -d ${FA_DIR} ]; then mkdir ${FA_DIR}; fi
if [ ! -d ${FA_DIR}/sub-${sub} ]; then mkdir ${FA_DIR}/sub-${sub}; fi
fa_file=${SRC_DIR}/${subject}/Niftii/Diffusion/*_FA.nii.gz
echo "renaming $fa_file"
ln -sf $fa_file ${FA_DIR}/sub-${sub}/sub-${sub}_FA.nii.gz

# -----------------------------------------------------------------------#

echo "Creating tractography directory..."
if [ ! -d ${TRK_DIR} ]; then mkdir ${TRK_DIR}; fi
if [ ! -d ${TRK_DIR}/sub-${sub} ]; then mkdir ${TRK_DIR}/sub-${sub}; fi
trk_file=${SRC_DIR}/${subject}/TRK/Tractography/*1M_apss.trk
echo "renaming $trk_file"
cp $trk_file ${TRK_DIR}/sub-${sub}/sub-${sub}_var-${TAG}_tract.trk

# -----------------------------------------------------------------------#

echo "Done."
