ifeq ($(strip $(FWCore/Version)),)
FWCoreVersion := self/FWCore/Version
FWCore/Version := FWCoreVersion
FWCoreVersion_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreVersion_EX_USE := $(foreach d, self cmssw ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreVersion_EX_LIB   := FWCoreVersion
ALL_EXTERNAL_PRODS += FWCoreVersion
FWCoreVersion_CLASS := LIBRARY
FWCore/Version_relbigobj+=FWCoreVersion
endif
ifeq ($(strip $(GeneratorInterface/GenFilters)),)
GeneratorInterfaceGenFilters := self/GeneratorInterface/GenFilters
GeneratorInterface/GenFilters := GeneratorInterfaceGenFilters
GeneratorInterfaceGenFilters_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceGenFilters_EX_USE := $(foreach d, self cmssw boost FWCore/PluginManager FWCore/ParameterSet FWCore/Framework FWCore/Utilities SimDataFormats/GeneratorProducts heppdt clhep root GeneratorInterface/Pythia6Interface GeneratorInterface/Core pythia8 SimGeneral/HepPDTRecord DataFormats/GeometryVector DataFormats/GeometrySurface TrackPropagation/SteppingHelixPropagator MagneticField/Records TrackingTools/TrajectoryState TrackingTools/TrajectoryParametrization TrackingTools/Records CommonTools/UtilAlgos FWCore/ServiceRegistry FastSimulation/Particle FastSimulation/BaseParticlePropagator TrackingTools/GeomPropagators DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/EgammaReco DataFormats/Math,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += GeneratorInterfaceGenFilters
GeneratorInterfaceGenFilters_CLASS := LIBRARY
GeneratorInterface/GenFilters_relbigobj+=GeneratorInterfaceGenFilters
endif
ifeq ($(strip $(PhysicsToolsPatAlgos_plugins)),)
PhysicsToolsPatAlgos_plugins := self/src/PhysicsTools/PatAlgos/plugins
PhysicsToolsPatAlgos_plugins_LOC_USE := self cmssw PhysicsTools/PatAlgos PhysicsTools/TensorFlow FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/MessageService L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore DataFormats/PatCandidates DataFormats/BTauReco DataFormats/JetReco DataFormats/MuonReco DataFormats/TrackReco DataFormats/Candidate DataFormats/HeavyIonEvent DataFormats/HepMCCandidate PhysicsTools/PatUtils CondFormats/JetMETObjects CommonTools/CandAlgos JetMETCorrections/Objects JetMETCorrections/JetCorrector TrackingTools/TransientTrack SimDataFormats/Track SimDataFormats/Vertex SimDataFormats/JetMatching SimGeneral/HepPDTRecord RecoMET/METAlgorithms RecoEgamma/EgammaTools TrackingTools/IPTools root
ALL_EXTERNAL_PLUGIN_PRODS += PhysicsToolsPatAlgos_plugins
PhysicsTools/PatAlgos_relbigobj+=PhysicsToolsPatAlgos_plugins
endif
ifeq ($(strip $(PhysicsTools/PatAlgos)),)
PhysicsToolsPatAlgos := self/PhysicsTools/PatAlgos
PhysicsTools/PatAlgos := PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsPatAlgos_EX_USE := $(foreach d, self cmssw DataFormats/Candidate DataFormats/Common DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/JetReco DataFormats/Math DataFormats/METReco DataFormats/MuonReco DataFormats/PatCandidates DataFormats/TauReco DataFormats/TrackReco DataFormats/VertexReco FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities PhysicsTools/PatUtils PhysicsTools/Utilities PhysicsTools/IsolationAlgos Geometry/CaloTopology RecoEgamma/EgammaTools RecoTracker/DeDx CondFormats/HcalObjects CondFormats/EcalObjects clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatAlgos_EX_LIB   := PhysicsToolsPatAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_CLASS := LIBRARY
PhysicsTools/PatAlgos_relbigobj+=PhysicsToolsPatAlgos
endif
