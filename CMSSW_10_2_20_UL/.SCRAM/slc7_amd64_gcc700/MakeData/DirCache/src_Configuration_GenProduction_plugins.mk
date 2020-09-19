ifeq ($(strip $(ConfigurationGenProductionAuto)),)
ConfigurationGenProductionAuto := self/src/Configuration/GenProduction/plugins
PLUGINS:=yes
ConfigurationGenProductionAuto_files := $(patsubst src/Configuration/GenProduction/plugins/%,%,$(wildcard $(foreach dir,src/Configuration/GenProduction/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ConfigurationGenProductionAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/Configuration/GenProduction/plugins/BuildFile
ConfigurationGenProductionAuto_LOC_USE := self  FWCore/ParameterSet FWCore/Framework SimDataFormats/GeneratorProducts pythia8
ConfigurationGenProductionAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,ConfigurationGenProductionAuto,ConfigurationGenProductionAuto,$(SCRAMSTORENAME_LIB),src/Configuration/GenProduction/plugins))
ConfigurationGenProductionAuto_PACKAGE := self/src/Configuration/GenProduction/plugins
ALL_PRODS += ConfigurationGenProductionAuto
Configuration/GenProduction_forbigobj+=ConfigurationGenProductionAuto
ConfigurationGenProductionAuto_INIT_FUNC        += $$(eval $$(call Library,ConfigurationGenProductionAuto,src/Configuration/GenProduction/plugins,src_Configuration_GenProduction_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
ConfigurationGenProductionAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,ConfigurationGenProductionAuto,src/Configuration/GenProduction/plugins))
endif
ALL_COMMONRULES += src_Configuration_GenProduction_plugins
src_Configuration_GenProduction_plugins_parent := Configuration/GenProduction
src_Configuration_GenProduction_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Configuration_GenProduction_plugins,src/Configuration/GenProduction/plugins,PLUGINS))
