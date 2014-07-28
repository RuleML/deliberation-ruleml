#!/bin/bash
# Prerequisites:
#   curl
# Download RNC schemas from MYNG for local testing
# datalog_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalog_min_normal.rnc 
# datalog_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalog_min_relaxed.rnc 
# disdatalog_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalog_min_normal.rnc 
# disdatalog_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalog_min_relaxed.rnc 
# datalog_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/datalog_normal.rnc"   > ../relaxng/test/datalog_normal.rnc 
# datalog_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/datalog_relaxed.rnc"  > ../relaxng/test/datalog_relaxed.rnc 

# datalogeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogeq_min_relaxed.rnc 
# disdatalogeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogeq_min_relaxed.rnc 
# datalogeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogeq_min_normal.rnc 
# disdatalogeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogeq_min_normal.rnc 

# datalogex_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogex_min_relaxed.rnc 
# disdatalogex_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogex_min_relaxed.rnc 
# datalogex_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogex_min_normal.rnc 
# disdatalogex_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogex_min_normal.rnc 

# datalogexeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogexeq_min_relaxed.rnc 
# disdatalogexeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogexeq_min_relaxed.rnc 
# datalogexeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogexeq_min_normal.rnc 
# disdatalogexeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogexeq_min_normal.rnc 

# datalogexand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x48&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogexand_min_relaxed.rnc 
# disdatalogexand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogexand_min_relaxed.rnc 
# datalogexand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x48&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogexand_min_normal.rnc 
# disdatalogexand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogexand_min_normal.rnc 

# datalogand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogand_min_relaxed.rnc 
# disdatalogand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogand_min_relaxed.rnc 
# datalogand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x8&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogand_min_normal.rnc 
# disdatalogand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x38&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogand_min_normal.rnc 

# ncdatalog_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x10&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/ncdatalog_min_relaxed.rnc 
# ncdatalog_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x10&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/ncdatalog_min_normal.rnc 

# datalogplus_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogplus_min_relaxed.rnc 
# disdatalogplus_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogplus_min_relaxed.rnc 
# datalogplus_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogplus_min_normal.rnc 
# disdatalogplus_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogplus_min_normal.rnc
# datalogplus_mid_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/datalogplus_mid_relaxed.rnc 
# disdatalogplus_mid_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/disdatalogplus_mid_relaxed.rnc 
# datalogplus_mid_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x5e&terms=xf30&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/datalogplus_mid_normal.rnc 
# disdatalogplus_mid_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x3c1&implies=x7e&terms=xf30&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/disdatalogplus_mid_normal.rnc

# unprop_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x0&default=x7&termseq=x1&lng=x1&propo=x0&implies=x0&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/test/unprop_min_relaxed.rnc
# unprop_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc_test.php?backbone=x0&default=x6&termseq=x1&lng=x1&propo=x0&implies=x0&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/test/unprop_min_normal.rnc
