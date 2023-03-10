---
title: "Cran comments"
author: "Wayne Haythorn"
date: "2023-02-28"
---

## Second resubmission following manual review by Victoria Wimmer  

Two issues this time:

1) Please write references in the description of the DESCRIPTION file in
the form
authors (year) <doi:...>
- OK, it wasn't that hard.

2) Please add () behind all function names  and omit the quotes for
function names in the description texts (DESCRIPTION file)
- removed the function names from the description

Thanks,
Wayne Haythorn


## R CMD check results

### No ERRORS, WARNINGS, or NOTES

For this submission the only changes were in the description so I only checked on my local machine (devtools::check) and rhub windows release: (windows-x86_64-release).

    
## Reviewer comments on second submission

Thanks,

Please write references in the description of the DESCRIPTION file in
the form
authors (year) <doi:...>
authors (year) <arXiv:...>
authors (year, ISBN:...)
or if those are not available: authors (year) <https:...>
with no space after 'doi:', 'arXiv:', 'https:' and angle brackets for
auto-linking.
(If you want to add a title as well please put it in quotes: "Title")

Please add () behind all function names  and omit the quotes for
function names in the description texts (DESCRIPTION file). e.g: -->
gamma_test()

Please fix and resubmit.

Best,
Victoria Wimmer
