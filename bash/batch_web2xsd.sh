#!/bin/bash
# Auto-generate XSD from MYNG RNC
# Prerequisites:
#  Installation of curl
#  See also rnc2xsd for additional dependencies.
# This script will remove the contents of a sibling directory named /xsd.
# Instructions:
# run this script from the command line
# then apply the XSLT transformations in http://deliberation.ruleml.org/1.01/xslt/rnc2xsd:
#  1. 101_rnc2xsd.xslt to all the file in the xsd directory, in place
#  2. 101_rnc2xsd_min.xslt to all the files in the xsd_min directory, write output into xsd directory
#
# Notes
# 1. The parameter serial=x10 or serial=x12 includes a "pivot" bit for customizing the RNC schema for conversion to XSD.
# 
# creates the xsd directory if it doesn't exist, and clears it, in case it already has contents
mkdir -p ../xsd
rm ../xsd/*

# bindatagroundfact
# b1-d6-a2-l1-p3cf-i6-tf0f-q1-e0-s10 (normal)
# b1-d7-a2-l1-p3cf-i6-tf0f-q1-e0-s12
# http://deliberation.ruleml.org/1.01/xsd/bindatagroundfact_normal.xsd
#curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1&default=x6&termseq=x2&lng=x1&propo=x3cf&implies=x6&terms=xf0f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
#./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/bindatagroundfact_normal.xsd
./aux_web2xsd.sh "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1&default=x6&termseq=x2&lng=x1&propo=x3cf&implies=x6&terms=xf0f&quant=x1&expr=x0&serial=x10" "../xsd/bindatagroundfact_normal.xsd"
# http://deliberation.ruleml.org/1.01/xsd/bindatagroundfact.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1&default=x7&termseq=x2&lng=x1&propo=x3cf&implies=x6&terms=xf0f&quant=x1&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/bindatagroundfact.xsd

# bindatagroundlog
# b3-d6-a2-l1-p3cf-i7-tf0f-q1-e0-s10 (normal)
# b3-d7-a2-l1-p3cf-i7-tf0f-q1-e0-s12
# http://deliberation.ruleml.org/1.01/xsd/bindatagroundlog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3&default=x6&termseq=x2&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/bindatagroundlog_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/bindatagroundlog.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3&default=x7&termseq=x2&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/bindatagroundlog.xsd

# bindatalog
# b7-d6-a2-l1-p3cf-i7-tf0f-q3-e0-s10 (normal)
# b7-d7-a2-l1-p3cf-i7-tf0f-q3-e0-s12
# http://deliberation.ruleml.org/1.01/xsd/bindatalog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x2&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/bindatalog_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/bindatalog.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x2&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/bindatalog.xsd

# datalog_min
# b7-d6-a7-l1-p1-i0-t200-q0-e0-s10 (normal)
# b7-d7-a7-l1-p1-i0-t200-q0-e0-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x200&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/datalog_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x200&quant=x0&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/datalog_min.xsd

# disdatalog_min
# b7-d6-a7-l1-p1-i30-t200-q0-e0-s10 (normal)
# b7-d7-a7-l1-p1-i30-t200-q0-e0-s10
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x200&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/disdatalog_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x200&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/disdatalog_min.xsd

# datalog
# b7-d6-a7-l1-p3cf-i7-tf0f-q7-e0-s10 (normal)
# b7-d7-a7-l1-p3cf-i7-tf0f-q7-e0-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x7&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x7&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalog.xsd

# datalogplus_min
# b7-d6-a7-l1-p1-i58-t210-q0-e0-s10 (normal)
# b7-d7-a7-l1-p1-i58-t210-q0-e0-s10
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/datalogplus_min_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/datalogplus_min.xsd

# disdatalogplus_min
# b7-d6-a7-l1-p1-i78-t210-q0-e0-s10 (normal)
# b7-d7-a7-l1-p1-i78-t210-q0-e0-s10
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_min_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/disdatalogplus_min_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_min.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd_min/disdatalogplus_min.xsd



# datalogplus_mid
# b7-d6-a7-l1-p3c1-i5e-tf30-q0-e0-s10 (normal)
# b7-d7-a7-l1-p3c1-i5e-tf30-q0-e0-s10
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/datalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/datalogplus_mid.xsd

# disdatalogplus_mid
# b7-d6-a7-l1-p3c1-i7e-tf30-q0-e0-s10 (normal)
# b7-d7-a7-l1-p3c1-i7e-tf30-q0-e0-s10
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/disdatalogplus_mid.xsd

# nafdatalog
# b7-d6-a7-l1-p3ef-i7-tf0f-q1-e0-s10 (normal)
# b7-d7-a7-l1-p3ef-i7-tf0f-q1-e0-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3ef&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafdatalog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3ef&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafdatalog.xsd

# negdatalog
# b7-d6-a7-l1-p3df-i7-tf0f-q1-e0-s10 (normal)
# b7-d7-a7-l1-p3df-i7-tf0f-q1-e0-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3df&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/negdatalog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3df&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/negdatalog.xsd

# nafnegdatalog
# b7-d6-a7-l1-p3ff-i7-tf0f-q1-e0-s10 (normal)
# b7-d7-a7-l1-p3ff-i7-tf0f-q1-e0-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3ff&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdatalog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7&terms=xf0f&quant=x1&expr=x0&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdatalog.xsd

# nafnegdisdatalogplus
# bf-d6-a7-l1-p3ff-i7f-tf3f-q1-e0-s10 (normal)
# bf-d7-a7-l1-p3ff-i7f-tf3f-q1-e0-s12
# http://deliberation.ruleml.org/1.01/xsd/nafnegdisdatalogplus_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdisdatalogplus_normal.xsd
# http://deliberation.ruleml.org/1.01/xsd/nafnegdisdatalogplus.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x1&expr=x0&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdisdatalogplus.xsd

# hornlog
# bf-d6-a7-l1-p3cf-i7-tf0f-q7-e3-s10 (normal)
# bf-d7-a7-l1-p3cf-i7-tf0f-q7-e3-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x6&termseq=x7&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x7&expr=x3&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/hornlog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3cf&implies=x7&terms=xf0f&quant=x7&expr=x3&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/hornlog.xsd

# hornlogeq
# bf-d6-a7-l1-p3cf-i7-tf3f-q7-ee-s10 (normal)
# bf-d7-a7-l1-p3cf-i7-tf3f-q7-ef-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x6&termseq=x7&lng=x1&propo=x3cf&implies=x7&terms=xf3f&quant=x7&expr=xe&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/hornlogeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3cf&implies=x7&terms=xf3f&quant=x7&expr=xf&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/hornlogeq.xsd

# dishornlog
# b1f-d6-a7-l1-p3cf-i37-tf0f-q7-e3-s10 (normal)
# b1f-d7-a7-l1-p3cf-i37-tf0f-q7-e3-s10
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1f&default=x6&termseq=x7&lng=x1&propo=x3cf&implies=x37&terms=xf0f&quant=x7&expr=x3&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/dishornlog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1f&default=x7&termseq=x7&lng=x1&propo=x3cf&implies=x37&terms=xf0f&quant=x7&expr=x3&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/dishornlog.xsd

# nafhornlog
# bf-d6-a7-l1-p3ef-i7-tf0f-q7-e3-s10 (normal)
# bf-d7-a7-l1-p3ef-i7-tf0f-q7-e3-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x6&termseq=x7&lng=x1&propo=x3ef&implies=x7&terms=xf0f&quant=x7&expr=x3&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafhornlog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3ef&implies=x7&terms=xf0f&quant=x7&expr=x3&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafhornlog.xsd

# nafneghornlogeq
# bf-d6-a7-l1-p3ff-i7-tf3f-q7-ee-s10 (normal)
# bf-d7-a7-l1-p3ff-i7-tf3f-q7-ef-s12
# http://deliberation.ruleml.org/1.01/xsd/nafneghornlogeq.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x6&termseq=x7&lng=x1&propo=x3ff&implies=x7&terms=xf3f&quant=x7&expr=xe&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafneghornlogeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=xf&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7&terms=xf3f&quant=x7&expr=xf&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafneghornlogeq.xsd

# nafnegdishornlogplus
# b1f-d6-a7-l1-p3ff-i7f-tf3f-q7-ee-s10 (normal)
# b1f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1f&default=x6&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xe&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdishornlogplus_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1f&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xf&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/nafnegdishornlogplus.xsd

# folog
# b3f-d2-a7-l1-p3df-i7f-tf0f-q7-e3-s10 (normal)
# b3f-d7-a7-l1-p3df-i7f-tf0f-q7-e3-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3df&implies=x7f&terms=xf0f&quant=x7&expr=x3&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/folog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x7&termseq=x7&lng=x1&propo=x3df&implies=x7f&terms=xf0f&quant=x7&expr=x3&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/folog.xsd

# fologeq
# b3f-d2-a7-l1-p3df-i7f-tf3f-q7-ee-s10 (normal)
# b3f-d7-a7-l1-p3df-i7f-tf3f-q7-ef-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3df&implies=x7f&terms=xf3f&quant=x7&expr=xe&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/fologeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x7&termseq=x7&lng=x1&propo=x3df&implies=x7f&terms=xf3f&quant=x7&expr=xf&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/fologeq.xsd

# naffolog
# b3f-d2-a7-l1-p3ff-i7f-tf0f-q7-e3-s10 (normal)
# b3f-d7-a7-l1-p3ff-i7f-tf0f-q7-e3-s12
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf0f&quant=x7&expr=x3&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffolog_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf0f&quant=x7&expr=x3&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffolog.xsd

# naffologeq
# b3f-d2-a7-l1-p3ff-i7f-tf3f-q7-ee-s0 (normal)
# b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s0
# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x2&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xe&serial=x10"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq_normal.xsd
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x3f&default=x7&termseq=x7&lng=x1&propo=x3ff&implies=x7f&terms=xf3f&quant=x7&expr=xf&serial=x12"  > ../relaxng/tmp-web2xsd.rnc 
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc ../xsd/naffologeq.xsd

rm ../relaxng/tmp-web2xsd.rnc
