#!/bin/bash
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_2_20_UL/src ] ; then
 echo release CMSSW_10_2_20_UL already exists
else
scram p CMSSW CMSSW_10_2_20_UL
fi
cd CMSSW_10_2_20_UL/src
eval `scram runtime -sh`

pyfile="fragment.py"
filter="OnlyOneParticleFilter"

mkdir Configuration
mkdir Configuration/GenProduction
mkdir Configuration/GenProduction/python/
mkdir Configuration/GenProduction/plugins/

cp ../../$pyfile ./Configuration/GenProduction/python/
cp ../../$filter* ./Configuration/GenProduction/plugins/
cp ../../BuildFile.xml ./Configuration/GenProduction/plugins/


scram b
cd ../../

cmsDriver.py Configuration/GenProduction/python/$pyfile --fileout file:step0-GS-b_kmumu_PHSPS.root --mc --eventcontent RAWSIM --datatier GEN-SIM --conditions 102X_upgrade2018_realistic_v11 --beamspot Realistic25ns13TeVEarly2018Collision --step GEN,SIM --nThreads 1 --geometry DB:Extended --era Run2_2018 --customise Configuration/DataProcessing/Utils.addMonitoring --python_filename step0-GS-b_kmumu_PHSPS_cfg.py --no_exec -n 100;
sed -i "20 a from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper \nrandSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)\nrandSvc.populate()" step0-GS-b_kmumu_PHSPS_cfg.py



export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_2_13_patch1/src ] ; then
 echo release CMSSW_10_2_13_patch1 already exists
else
scram p CMSSW CMSSW_10_2_13_patch1
fi
cd CMSSW_10_2_13_patch1/src
eval `scram runtime -sh`

scram b
cd ../../

cmsDriver.py step1 --filein file:step0-GS-b_kmumu_PHSPS.root --fileout file:step1-DR-b_kmumu_PHSPS.root --pileup_input "dbs:/MinBias_TuneCP5_13TeV-pythia8/RunIIFall18GS-102X_upgrade2018_realistic_v9-v1/GEN-SIM" --mc --eventcontent FEVTDEBUGHLT --pileup "AVE_25_BX_25ns,{'N': 20}" --datatier GEN-SIM-DIGI-RAW --conditions 102X_upgrade2018_realistic_v15 --step DIGI,L1,DIGI2RAW,HLT:@relval2018 --nThreads 8 --geometry DB:Extended --era Run2_2018 --python_filename step1-DR-b_kmumu_PHSPS_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n -1;
sed -i "20 a from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper\nrandSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)\nrandSvc.populate() " step1-DR-b_kmumu_PHSPS_cfg.py

cmsDriver.py step2 --filein file:step1-DR-b_kmumu_PHSPS.root --fileout file:step2-DR-b_kmumu_PHSPS.root --mc --eventcontent AODSIM --runUnscheduled --datatier AODSIM --conditions 102X_upgrade2018_realistic_v15 --step RAW2DIGI,L1Reco,RECO,RECOSIM,EI --nThreads 8 --geometry DB:Extended --era Run2_2018 --python_filename step2-DR-b_kmumu_PHSPS_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n -1;
sed -i "20 a from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper\nrandSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)\nrandSvc.populate()" step2-DR-b_kmumu_PHSPS_cfg.py



export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_2_14/src ] ; then
 echo release CMSSW_10_2_14 already exists
else
scram p CMSSW CMSSW_10_2_14
fi
cd CMSSW_10_2_14/src

scram b
cd ../../
cmsDriver.py step1 --filein file:step2-DR-b_kmumu_PHSPS.root --fileout file:step3-MiniAOD-b_kmumu_PHSPS.root --mc --eventcontent MINIAODSIM --runUnscheduled --datatier MINIAODSIM --conditions 102X_upgrade2018_realistic_v15 --step PAT --nThreads 8 --geometry DB:Extended --era Run2_2018,bParking --python_filename step3-MiniAOD-b_kmumu_PHSPS_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n -1;

