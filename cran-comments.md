---
title: "Cran comments"
author: "Wayne Haythorn"
date: "2023-02-28"
---

## R CMD check results
There were no ERRORs, WARNINGs, or NOTES, using:
  - devtools::check()    # windows 11 laptop
  - devtools::check_mac_release()
  - rhub::check_on_linux()
  
There was one NOTE when I ran:
  - rhub::check_for_cran()
  
   "checking for detritus in the temp directory
   Found the following files/directories:
     'lastMiKTeXException'"
     
   As noted in R-hub issue #503, this could be due to a bug/crash in MiKTeX

## This is an initial submission. 
There are no downstream dependencies.
There are no side effects other than multiple calls to ggplot.
