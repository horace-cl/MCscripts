from CRABClient.UserUtilities import config
import datetime
import time

config = config()

ts = time.time()
st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d-%H-%M')

channel = 'b_kmumu_PHSPS'
year = '2020'
step = 'PrivateMC-'+year
nEvents = 1000
NJOBS = 10
myrun = "step0-GS-"+channel+"_cfg.py"
#myrun = 'step0-GS-ups2s2ups1spipi_cfg.py'
myname = step+'-'+channel

config.General.requestName = step+'-'+channel+'-'+st
config.General.transferOutputs = True
config.General.transferLogs = False
config.General.workArea = 'crab_'+step+'-'+channel

config.JobType.allowUndistributedCMSSW = True
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = myrun
config.JobType.inputFiles = ['step1-DR-'+channel+'_cfg.py',
                             'step2-DR-'+channel+'_cfg.py',
                             'step3-MiniAOD-'+channel+'_cfg.py',
                             'step4-NanoAOD-'+channel+'_cfg.py']
config.JobType.disableAutomaticOutputCollection = True
config.JobType.eventsPerLumi = 10000
config.JobType.numCores = 1
config.JobType.maxMemoryMB = 3300
config.JobType.scriptExe = 'job.sh'
#config.JobType.scriptArgs = ["0"]
config.JobType.outputFiles = ['step0-GS-b_kmumu_PHSPS.root', 'step3-MiniAOD-b_kmumu_PHSPS.root', 'step4-NanoAOD-b_kmumu_PHSPS.root']
config.Data.outputPrimaryDataset = myname
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = nEvents
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
#config.Data.outLFNDirBase = '/store/user/cmondrag/'
config.Data.publication = False

config.Site.storageSite = 'T2_CH_CERNBOX'