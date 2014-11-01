#!/bin/bash
# Batch generate Simplified RNC from MYNG RNC
# Prerequisites:
#  Installation of curl
#  See also rnc2simp for additional dependencies.
# This script will remove the contents of a sibling directory named /simplified.
# Instructions:
# run this script from the command line
#
# Notes
# due to problems in Jing with simplification of qualified names as content, the explicit datatyping feature is not included.
# 
# creates the simplifed directory if it doesn't exist, and clears it, in case it already has contents
mkdir -p ../simplified
rm ../simplified/*

# bindatagroundfact
# b1-d6-a2-l1-p3cf-i6-tf0f-q1-e0-s8 (normal)
./aux_web2simp.sh "b1-d6-a2-l1-p3cf-i6-tf0f-q1-e0-s8" "../simplified/bindatagroundfact_normal.rnc"
# b1-d7-a2-l1-p3cf-i6-tf0f-q1-e0-sb (relaxed)
./aux_web2simp.sh "b1-d7-a2-l1-p3cf-i6-tf0f-q1-e0-sb" "../simplified/bindatagroundfact_relaxed.rnc"

# bindatagroundlog
# b3-d6-a2-l1-p3cf-i7-tf0f-q1-e0-s8 (normal)
./aux_web2simp.sh "b3-d6-a2-l1-p3cf-i7-tf0f-q1-e0-s8" "../simplified/bindatagroundlog_normal.rnc"
# b3-d7-a2-l1-p3cf-i7-tf0f-q1-e0-sb (relaxed)
./aux_web2simp.sh "b3-d7-a2-l1-p3cf-i7-tf0f-q1-e0-sb" "../simplified/bindatagroundlog_relaxed.rnc"

# bindatalog
# b7-d6-a2-l1-p3cf-i7-tf0f-q3-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a2-l1-p3cf-i7-tf0f-q3-e0-s8" "../simplified/bindatalog_normal.rnc"
# b7-d7-a2-l1-p3cf-i7-tf0f-q3-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a2-l1-p3cf-i7-tf0f-q3-e0-sb" "../simplified/bindatalog_relaxed.rnc"

# datalog_min
# b7-d6-a7-l1-p1-i0-t200-q0-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p1-i0-t200-q0-e0-s8" "../simplified/datalog_min_normal.rnc"
# b7-d7-a7-l1-p1-i0-t200-q0-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p1-i0-t200-q0-e0-sb" "../simplified/datalog_min_relaxed.rnc"

# disdatalog_min
# b7-d6-a7-l1-p1-i30-t200-q0-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p1-i30-t200-q0-e0-s8" "../simplified/disdatalog_min_normal.rnc"
# b7-d7-a7-l1-p1-i30-t200-q0-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p1-i30-t200-q0-e0-sb" "../simplified/disdatalog_min_relaxed.rnc"

# datalog
# b7-d6-a7-l1-p3cf-i7-tf0f-q7-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p3cf-i7-tf0f-q7-e0-s8" "../simplified/datalog_normal.rnc"
# b7-d7-a7-l1-p3cf-i7-tf0f-q7-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p3cf-i7-tf0f-q7-e0-sb" "../simplified/datalog_relaxed.rnc"

# datalogplus_min
# b7-d6-a7-l1-p1-i58-t210-q0-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p1-i58-t210-q0-e0-s8" "../simplified/datalogplus_min_normal.rnc"
# b7-d7-a7-l1-p1-i58-t210-q0-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p1-i58-t210-q0-e0-sb" "../simplified/datalogplus_min_relaxed.rnc"

# disdatalogplus_min
# b7-d6-a7-l1-p1-i78-t210-q0-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p1-i78-t210-q0-e0-s8" "../simplified/disdatalogplus_min_normal.rnc"
# b7-d7-a7-l1-p1-i78-t210-q0-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p1-i78-t210-q0-e0-sb" "../simplified/disdatalogplus_min_relaxed.rnc"

# datalogplus_mid
# b7-d6-a7-l1-p3c1-i5e-tf30-q0-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p3c1-i5e-tf30-q0-e0-s8" "../simplified/datalogplus_mid_normal.rnc"
# b7-d7-a7-l1-p3c1-i5e-tf30-q0-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p3c1-i5e-tf30-q0-e0-sb" "../simplified/datalogplus_mid_relaxed.rnc"

# disdatalogplus_mid
# b7-d6-a7-l1-p3c1-i7e-tf30-q0-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p3c1-i7e-tf30-q0-e0-s8" "../simplified/disdatalogplus_mid_normal.rnc"
# b7-d7-a7-l1-p3c1-i7e-tf30-q0-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p3c1-i7e-tf30-q0-e0-sb" "../simplified/disdatalogplus_mid_relaxed.rnc"

# nafdatalog
# b7-d6-a7-l1-p3ef-i7-tf0f-q1-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p3ef-i7-tf0f-q1-e0-s8" "../simplified/nafdatalog_normal.rnc"
# b7-d7-a7-l1-p3ef-i7-tf0f-q1-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p3ef-i7-tf0f-q1-e0-sb" "../simplified/nafdatalog_relaxed.rnc"

# negdatalog
# b7-d6-a7-l1-p3df-i7-tf0f-q1-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p3df-i7-tf0f-q1-e0-s8" "../simplified/negdatalog_normal.rnc"
# b7-d7-a7-l1-p3df-i7-tf0f-q1-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p3df-i7-tf0f-q1-e0-sb" "../simplified/negdatalog_relaxed.rnc"

# nafnegdatalog
# b7-d6-a7-l1-p3ff-i7-tf0f-q1-e0-s8 (normal)
./aux_web2simp.sh "b7-d6-a7-l1-p3ff-i7-tf0f-q1-e0-s8" "../simplified/nafnegdatalog_normal.rnc"
# b7-d7-a7-l1-p3ff-i7-tf0f-q1-e0-sb (relaxed)
./aux_web2simp.sh "b7-d7-a7-l1-p3ff-i7-tf0f-q1-e0-sb" "../simplified/nafnegdatalog_relaxed.rnc"

# nafnegdisdatalogplus
# bf-d6-a7-l1-p3ff-i7f-tf3f-q1-e0-s8 (normal)
./aux_web2simp.sh "bf-d6-a7-l1-p3ff-i7f-tf3f-q1-e0-s8" "../simplified/nafnegdisdatalogplus_normal.rnc"
# bf-d7-a7-l1-p3ff-i7f-tf3f-q1-e0-sb (relaxed)
./aux_web2simp.sh "bf-d7-a7-l1-p3ff-i7f-tf3f-q1-e0-sb" "../simplified/nafnegdisdatalogplus_relaxed.rnc"

# hornlog
# bf-d6-a7-l1-p3cf-i7-tf0f-q7-e3-s8 (normal)
./aux_web2simp.sh "bf-d6-a7-l1-p3cf-i7-tf0f-q7-e3-s8" "../simplified/hornlog_normal.rnc"
# bf-d7-a7-l1-p3cf-i7-tf0f-q7-e3-sb (relaxed)
./aux_web2simp.sh "bf-d7-a7-l1-p3cf-i7-tf0f-q7-e3-sb" "../simplified/hornlog_relaxed.rnc"

# hornlogeq
# bf-d6-a7-l1-p3cf-i7-tf3f-q7-ee-s8 (normal)
./aux_web2simp.sh "bf-d6-a7-l1-p3cf-i7-tf3f-q7-ee-s8" "../simplified/hornlogeq_normal.rnc"
# bf-d7-a7-l1-p3cf-i7-tf3f-q7-ef-sb (relaxed)
./aux_web2simp.sh "bf-d7-a7-l1-p3cf-i7-tf3f-q7-ef-sb" "../simplified/hornlogeq_relaxed.rnc"

# dishornlog
# b1f-d6-a7-l1-p3cf-i37-tf0f-q7-e3-s8 (normal)
./aux_web2simp.sh "b1f-d6-a7-l1-p3cf-i37-tf0f-q7-e3-s8" "../simplified/dishornlog_normal.rnc"
# b1f-d7-a7-l1-p3cf-i37-tf0f-q7-e3-sb (relaxed)
./aux_web2simp.sh "b1f-d7-a7-l1-p3cf-i37-tf0f-q7-e3-sb" "../simplified/dishornlog_relaxed.rnc"

# nafhornlog
# bf-d7-a6-l1-p3ef-i7-tf0f-q7-e3-s8 (normal)
./aux_web2simp.sh "bf-d6-a7-l1-p3ef-i7-tf0f-q7-e3-s8" "../simplified/nafhornlog_normal.rnc"
# bf-d7-a7-l1-p3ef-i7-tf0f-q7-e3-sb (relaxed)
./aux_web2simp.sh "bf-d7-a7-l1-p3ef-i7-tf0f-q7-e3-sb" "../simplified/nafhornlog_relaxed.rnc"

# nafneghornlogeq
# bf-d6-a7-l1-p3ff-i7-tf3f-q7-ee-s8 (normal)
./aux_web2simp.sh "bf-d6-a7-l1-p3ff-i7-tf3f-q7-ee-s8" "../simplified/nafneghornlogeq_normal.rnc"
# bf-d7-a7-l1-p3ff-i7-tf3f-q7-ef-sb (relaxed)
./aux_web2simp.sh "bf-d7-a7-l1-p3ff-i7-tf3f-q7-ef-sb" "../simplified/nafneghornlogeq_relaxed.rnc"

# nafnegdishornlogplus
# b1f-d6-a7-l1-p3ff-i7f-tf3f-q7-ee-s8 (normal)
./aux_web2simp.sh "b1f-d6-a7-l1-p3ff-i7f-tf3f-q7-ee-s8" "../simplified/nafnegdishornlogplus_normal.rnc"
# b1f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-sb (relaxed)
./aux_web2simp.sh "b1f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-sb" "../simplified/nafnegdishornlogplus_relaxed.rnc"

# folog
# b3f-d2-a7-l1-p3df-i7f-tf0f-q7-e3-s8 (normal)
./aux_web2simp.sh "b3f-d2-a7-l1-p3df-i7f-tf0f-q7-e3-s8" "../simplified/folog_normal.rnc"
# b3f-d7-a7-l1-p3df-i7f-tf0f-q7-e3-sb (relaxed)
./aux_web2simp.sh "b3f-d7-a7-l1-p3df-i7f-tf0f-q7-e3-sb" "../simplified/folog_relaxed.rnc"

# fologeq
# b3f-d2-a7-l1-p3df-i7f-tf3f-q7-ee-s8 (normal)
./aux_web2simp.sh "b3f-d2-a7-l1-p3df-i7f-tf3f-q7-ee-s8" "../simplified/fologeq_normal.rnc"
# b3f-d7-a7-l1-p3df-i7f-tf3f-q7-ef-sb (relaxed)
./aux_web2simp.sh "b3f-d7-a7-l1-p3df-i7f-tf3f-q7-ef-sb" "../simplified/fologeq_relaxed.rnc"

# naffolog
# b3f-d2-a7-l1-p3ff-i7f-tf0f-q7-e3-s8 (normal)
./aux_web2simp.sh "b3f-d2-a7-l1-p3ff-i7f-tf0f-q7-e3-s8" "../simplified/naffolog_normal.rnc"
# b3f-d7-a7-l1-p3ff-i7f-tf0f-q7-e3-sb (relaxed)
./aux_web2simp.sh "b3f-d7-a7-l1-p3ff-i7f-tf0f-q7-e3-sb" "../simplified/naffolog_relaxed.rnc"

# naffologeq
# b3f-d2-a7-l1-p3ff-i7f-tf3f-q7-ee-s8 (normal)
./aux_web2simp.sh "b3f-d2-a7-l1-p3ff-i7f-tf3f-q7-ee-s8" "../simplified/naffologeq_normal.rnc"
# b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-sb (relaxed)
./aux_web2simp.sh "b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-sb" "../simplified/naffologeq_relaxed.rnc"

