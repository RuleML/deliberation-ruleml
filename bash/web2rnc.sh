#!/bin/bash
# Download RNC schemas from MYNG for local testing
# datalog_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalog_min_relaxed.rnc 
# disdatalog_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalog_min_relaxed.rnc 
# datalog_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalog_min_normal.rnc 
# disdatalog_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalog_min_normal.rnc 

# datalogeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalogeq_min_relaxed.rnc 
# disdatalogeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalogeq_min_relaxed.rnc 
# datalogeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x0&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalogeq_min_normal.rnc 
# disdatalogeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x30&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalogeq_min_normal.rnc 

# datalogex_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalogex_min_relaxed.rnc 
# disdatalogex_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalogex_min_relaxed.rnc 
# datalogex_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalogex_min_normal.rnc 
# disdatalogex_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalogex_min_normal.rnc 

# datalogexeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalogexeq_min_relaxed.rnc 
# disdatalogexeq_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalogexeq_min_relaxed.rnc 
# datalogexeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalogexeq_min_normal.rnc 
# disdatalogexeq_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalogexeq_min_normal.rnc 

# datalogexand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x48&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalogexand_min_relaxed.rnc 
# disdatalogexand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalogexand_min_relaxed.rnc 
# datalogexand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x48&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalogexand_min_normal.rnc 
# disdatalogexand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalogexand_min_normal.rnc 

# datalogand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x40&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalogand_min_relaxed.rnc 
# disdatalogand_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x70&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalogand_min_relaxed.rnc 
# datalogand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x8&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalogand_min_normal.rnc 
# disdatalogand_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x38&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalogand_min_normal.rnc 

# ncdatalog_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x10&terms=x200&quant=x0&expr=x0&serial=xf"  > ../relaxng/ncdatalog_min_relaxed.rnc 
# ncdatalog_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x10&terms=x200&quant=x0&expr=x0&serial=xc"  > ../relaxng/ncdatalog_min_normal.rnc 

# datalogplus_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/datalogplus_min_relaxed.rnc 
# disdatalogplus_min_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x7&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=xf"  > ../relaxng/disdatalogplus_min_relaxed.rnc 
# datalogplus_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x58&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/datalogplus_min_normal.rnc 
# disdatalogplus_min_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x7&default=x6&termseq=x7&lng=x1&propo=x1&implies=x78&terms=x210&quant=x0&expr=x0&serial=xc"  > ../relaxng/disdatalogplus_min_normal.rnc

# unprop_relaxed.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x0&default=x7&termseq=x1&lng=x1&propo=x0&implies=x0&terms=x0&quant=x0&expr=x0&serial=xb"  > ../relaxng/unprop_relaxed.rnc
# unprop_normal.rnc
curl -L "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x0&default=x6&termseq=x1&lng=x1&propo=x0&implies=x0&terms=x0&quant=x0&expr=x0&serial=x8"  > ../relaxng/unprop_normal.rnc
