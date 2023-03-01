---
title: "Cran comments"
author: "Wayne Haythorn"
date: "2023-02-28"
---

## This is an initial submission.
There are no downstream dependencies.
There are no side effects other than multiple calls to ggplot.


## R CMD check results

### There were no ERRORs, WARNINGs, or NOTES, using 7 platforms:
  - `devtools::check()    # on my local windows 11 laptop
  - `devtools::check_on_windows()
  - `devtools::check_mac_release()
  - `rhub::check_on_linux()
  - `rhub::check()` with ubuntu-gcc-devel
  -   debian-clang-devel
  -   windows-x86_64-devel
  
### There were two NOTEs using `rhub::check_rhub()
  
  These were:

```  
      Possibly misspelled words in DESCRIPTION: embeddings (13:12)
```
     
   Response: This is the correct spelling of embeddings.
    
```
      checking for detritus in the temp directory
       Found the following files/directories:
        'lastMiKTeXException'
```
     
  Response: As noted in R-hub issue #503, this could be due to a bug/crash in MiKTeX:
        https://github.com/r-hub/rhub/issues/503

