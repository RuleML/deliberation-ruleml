#!/bin/bash

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
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf10&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid.xsd

# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf10&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid.xsd

# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf10&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf10&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid_normal.xsd


# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf10&quant=x0&expr=x0&serial=x0"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq_normal.xsd

rm ../relaxng/tmp-web2xsd.rnc