# MCscripts
Quiero crear muestras MC usando el modelo PHSP sin correcciones radiativas del decaimiento
B+ -> K+ mu- mu+

En `fragment.py` esta indicado explicitamente tanto PHSP como noPhotos. Ademas agrege un filtro llamado `oneBmeson`

Este filtro se encuentra definido en `OnlyOneParticleFilter` 

En el script `prepare.sh` estan todos los comandos `cmsDriver.py` para cada uno de los pasos, adaptados del MC que se encuentra aqui:

https://cms-pdmv.cern.ch/mcm/requests?prepid=BPH-RunIIAutumn18MiniAOD-00273&page=0&shown=127