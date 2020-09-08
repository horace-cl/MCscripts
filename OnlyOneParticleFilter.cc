#include "OnlyOneParticleFilter.h"
#include "SimDataFormats/GeneratorProducts/interface/HepMCProduct.h"
#include <iostream>
#include <vector>

using namespace edm;
using namespace std;
using namespace Pythia8;


OnlyOneParticleFilter::OnlyOneParticleFilter(const edm::ParameterSet& iConfig) :
  fVerbose(iConfig.getUntrackedParameter("verbose",0)),
  token_(consumes<edm::HepMCProduct>(edm::InputTag(iConfig.getUntrackedParameter("moduleLabel",std::string("generator")),"unsmeared"))),
  particleID(iConfig.getUntrackedParameter("ParticleID", 0)),
  chargeconju(iConfig.getUntrackedParameter("ChargeConjugation", true))
{
  edm::LogInfo("OnlyOneParticleFilter") << "----------------------------------------------------------------------" << endl;
  edm::LogInfo("OnlyOneParticleFilter") << "--- OnlyOneParticleFilter" << endl;
  edm::LogInfo("OnlyOneParticleFilter") << "Creating pythia8 instance for particle properties" << endl;
  if(!fLookupGen.get()) fLookupGen.reset(new Pythia());
}


OnlyOneParticleFilter::~OnlyOneParticleFilter()
{
   // do anything here that needs to be done at desctruction time
   // (e.g. close files, deallocate resources etc.)
}


//
// member functions
//

// ------------ method called to produce the data  ------------
bool OnlyOneParticleFilter::filter(edm::StreamID,edm::Event& iEvent, const edm::EventSetup& iSetup) const {
  using namespace edm;
  bool accepted = false;
  Handle<HepMCProduct> evt;
  iEvent.getByToken(token_, evt);

  int nParticles(0); 

  
  HepMC::GenEvent *myGenEvent = new HepMC::GenEvent(*(evt->GetEvent()));
  
  
  if (fVerbose > 5) {
    edm::LogInfo("OnlyOneParticleFilter") << "looking for " << particleID << endl;
  }
  
  
  for (HepMC::GenEvent::particle_iterator p = myGenEvent->particles_begin(); p != myGenEvent->particles_end(); ++p) {
    
    if ( abs((*p)->pdg_id()) == particleID) {
      nParticles++;
      accepted = true;
    }

    if (nParticles>1){
      accepted = false;
      break;
    }

  }



  delete myGenEvent; 
  return accepted;
}


//define this as a plug-in
DEFINE_FWK_MODULE(OnlyOneParticleFilter);