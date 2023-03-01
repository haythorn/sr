---
title: "Cran comments"
author: "Wayne Haythorn"
date: "2023-02-28"
---

## This is an initial submission. 
There are no downstream dependencies.
There are no side effects other than multiple calls to ggplot.


## R CMD check results
There were no ERRORs, WARNINGs, or NOTES, using:
  - devtools::check()    # on a windows 11 laptop
  - devtools::check_mac_release()
  - rhub::check_on_linux()
  
There were two NOTEs when I ran:
  - rhub::check_rhub()
  
 1)  "Possibly misspelled words in DESCRIPTION:
       embeddings (13:12)"
    
    This word is not misspelled.
    
    
 2)  "checking for detritus in the temp directory
       Found the following files/directories:
        'lastMiKTeXException'"
     
     As noted in R-hub issue #503, this could be due to a bug/crash in MiKTeX:
        https://github.com/r-hub/rhub/issues/503

