#!/bin/bash

rm ../xsd/*
# Auto-generate XSD from MYNG RNC
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_min.xsd

# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_min.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_min.xsd

# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_min_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_min_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid.xsd

# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid.xsd

# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/nafhornlog.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3ef&implies=x7&terms=xf0f&quant=x7&expr=x3&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafhornlog.xsd

# http://deliberation.ruleml.org/1.01/xsd/nafneghornlogeq.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7&terms=xf1f&quant=x7&expr=x3&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafneghornlogeq.xsd

# http://deliberation.ruleml.org/1.01/xsd/nafnegdishornlogplus.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1f&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xf&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdishornlogplus.xsd

# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xe&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/naffologeq.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xe&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq.xsd

rm ../relaxng/tmp-web2xsd.rnc