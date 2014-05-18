#!/bin/bash
# Auto-generate XSD from MYNG RNC
# clear the /xsd directory
rm ../xsd/*

# datalogplus_min
# b7-d6-a7-l1-p1-i58-t210-q0-e0-s0 (normal)
# b7-d7-a7-l1-p1-i58-t210-q0-e0-s0
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_min_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_min.xsd

# disdatalogplus_min
# b7-d6-a7-l1-p1-i78-t210-q0-e0-s0 (normal)
# b7-d7-a7-l1-p1-i78-t210-q0-e0-s0
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_min_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_min.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_min.xsd



# datalogplus_mid
# b7-d6-a7-l1-p3c1-i5e-tf30-q0-e0-s0 (normal)
# b7-d7-a7-l1-p3c1-i5e-tf30-q0-e0-s0
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid.xsd

# disdatalogplus_mid
# b7-d6-a7-l1-p3c1-i7e-tf30-q0-e0-s0 (normal)
# b7-d7-a7-l1-p3c1-i7e-tf30-q0-e0-s0
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid.xsd

# nafnegdisdatalogplus
# bf-d6-a7-l1-p3ff-i7f-tf3f-q7-e0-s0 (normal)
# bf-d7-a7-l1-p3ff-i7f-tf3f-q7-e0-s0
# http://deliberation.ruleml.org/1.01/xsd/nafnegdisdatalogplus_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdisdatalogplus_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/nafnegdisdatalogplus.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdisdatalogplus.xsd


# nafhornlog
# bf-d7-a7-l1-p3ef-i7-tf0f-q7-e3-s0
# http://deliberation.ruleml.org/1.01/xsd/nafhornlog.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3ef&implies=x7&terms=xf0f&quant=x7&expr=x3&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafhornlog.xsd

# nafneghornlogeq
# bf-d7-a7-l1-p3ff-i7-tf3f-q7-e3-s0
# http://deliberation.ruleml.org/1.01/xsd/nafneghornlogeq.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7&terms=xf3f&quant=x7&expr=x3&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafneghornlogeq.xsd

# nafnegdishornlogplus
# b1f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s0
# http://deliberation.ruleml.org/1.01/xsd/nafnegdishornlogplus.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1f&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xf&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdishornlogplus.xsd

# naffologeq
# b3f-d2-a7-l1-p3ff-i7f-tf3f-q7-ee-s0 (normal)
# b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s0
# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xe&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq_normal.xsd

# http://deliberation.ruleml.org/1.01/xsd/naffologeq.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xf&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq.xsd

rm ../relaxng/tmp-web2xsd.rnc