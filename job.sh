#!/bin/bash
SCRAM="slc7_amd64_gcc700"
GEN_REL="CMSSW_10_2_20_UL"
RECO_REL="CMSSW_10_2_13_patch1"
MINI_REL="CMSSW_10_2_14"
CHANNEL_DECAY="b_kmumu_PHSPS"

echo "================= cmssw environment prepration Gen step ===================="
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=$SCRAM

if [ -r $GEN_REL/src ] ; then
  echo release $GEN_REL already exists
else
  scram p CMSSW $GEN_REL
fi
cd $GEN_REL/src
eval `scram runtime -sh`
scram b
cd ../../


echo "================= PB: CMSRUN starting Gen step ===================="
#cmsRun -j ${CHANNEL_DECAY}_step0.log  -p PSet.py
cmsRun -j ${CHANNEL_DECAY}_step0.log -p step0-GS-${CHANNEL_DECAY}_cfg.py



echo "================= cmssw environment prepration Reco step ===================="

if [ -r $RECO_REL/src ] ; then
  echo release $RECO_REL already exists
else
  scram p CMSSW $RECO_REL
fi
cd $RECO_REL/src
eval `scram runtime -sh`
scram b
cd ../../




echo "================= PB: CMSRUN starting Reco step ===================="
cmsRun -e -j ${CHANNEL_DECAY}_step1.log step1-DR-${CHANNEL_DECAY}_cfg.py
#cleaning
#rm -rfv step0-GS-${CHANNEL_DECAY}.root

echo "================= PB: CMSRUN starting Reco step 2 ===================="
cmsRun -e -j ${CHANNEL_DECAY}_step2.log  step2-DR-${CHANNEL_DECAY}_cfg.py
#cleaning
#rm -rfv step1-DR-${CHANNEL_DECAY}.root