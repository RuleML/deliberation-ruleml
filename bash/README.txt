This directory contains the following scripts:

* aux_rnc2rng.sh: auxiliary script used for converting a single RNC schema into RNG
  used by batch_rnc2rng.sh

* aux_valdesign.sh: auxiliary script that validads an RNG schema against the design
  used by batch_rnc2rng.sh
   
aux_web2rnc.sh: implements call to the MYNG engine, storing the result at the second argument
  used by batch_web2rnc4xsd.sh and batch_web2rnc4xsd.sh 
 
aux_web2simp.sh: implements call to the MYNG engine followed by application of Jing simplifier (rnc2simp)
  used by batch_web2simp.sh,  

aux_web2xsd.sh: can be used batch or standalone for calling the MYNG REST interface and converting to XSD. XSLT post-processing is required.

* batch_rnc2rng.sh: batch conversion of the RNC modules to RNG for pre-release verification of the schema design.
  used by build1.sh
  
batch_web2rnc.sh: batch download of the RNC schema drivers for local pre-release testing.
  used by build1.sh

batch_web2rnc4xsd.sh: used by batch_web2xsd, batch download of the RNC schema drivers for conversion to XSD.

batch_web2xsd.sh: batch conversion of RNC to XSD for the anchor languages.   XSLT post-processing is required.

batch_xsd2doc.sh: batch schema docs generation.
