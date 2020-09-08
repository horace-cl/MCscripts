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

cmsDriver.py Configuration/GenProduction/python/$pyfile --fileout file:step0-GS-b_kmumu_PHSPS.root --mc --eventcontent RAWSIM --datatier GEN-SIM --conditions 102X_upgrade2018_realistic_v11 --beamspot Realistic25ns13TeVEarly2018Collision --step GEN,SIM --nThreads 1 --geometry DB:Extended --era Run2_2018 --customise Configuration/DataProcessing/Utils.addMonitoring --python_filename step0-GS-b_kmumu_PHSPS_cfg.py --no_exec -n 1000;
sed -i "20 a from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper \nrandSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)\nrandSvc.populate()" step0-GS-b_kmumu_PHSPS_cfg.py