---
title: "Cran comments"
author: "Wayne Haythorn"
date: "2023-02-28"
---

## This is an initial submission.
There are no downstream dependencies.
There are no side effects other than multiple calls to ggplot.

## This is a resubmission.  There were two notes on the previous submission.

  These were:

```  
N  checking CRAN incoming feasibility
   Maintainer: 'Wayne Haythorn <support@smoothregression.com>'
   
   New submission
```
     And

```
     * checking package subdirectories ... NOTE
Problems with news in 'NEWS.md':
No news entries found.

```
     
  Response: I removed a bad character from my NEWS.md file


## R CMD check results

### There were no ERRORs, WARNINGs, or NOTES, using 7 platforms:
  - `devtools::check()    # on my local windows 11 laptop
  - `devtools::check_on_windows()
  - `devtools::check_mac_release()
  - `rhub::check_on_linux()
  - `rhub::check()` with ubuntu-gcc-devel
  -   debian-clang-devel
  -   windows-x86_64-devel
  
  
### There were two NOTEs using `devtools::check_rhub()
  
  These were:

```  
N  checking CRAN incoming feasibility
   Maintainer: 'Wayne Haythorn <support@smoothregression.com>'
   
   New submission
```
     And

```
      checking for detritus in the temp directory
       Found the following files/directories:
        'lastMiKTeXException'
```
     
  Response: As noted in R-hub issue #503, this could be due to a bug/crash in MiKTeX:
        https://github.com/r-hub/rhub/issues/503

