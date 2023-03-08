---
title: "Cran comments"
author: "Wayne Haythorn"
date: "2023-02-28"
---

## Resubmission following manual review by Victoria Wimmer  

Thank you to Victoria for your clear and helpful comments, they are copied
below.  I believe I have resolved all of the issues:

1) Use Authors@R rather than old style Author:, Maintainer:
  Done
  
2) Don't use "Tools for", verbal padding in the description
  Done, made it snappier
  
3) Proof read the description
  I think you were referring to "over training", which I did because spell_check_package
  didn't like overtraining, so I changed it to over-training.

4) Put in references to the math behind Gamma
  The instructions were to add references to the description field of the DESCRIPTION 
  file.  I was a bit uncertain about how to make that look good, so I put the 
  references in an `@references` tag for the `gamma_test` function, and put a 
  note in the DESCRIPTION file pointing people to that.
  
5) Add \value to two .Rd files
  I did that and added more detail about return values in several other places.
  
6) I was using \dontrun {} inappropriately
  The dontruns are gone.  I rewrote the examples to make them run faster.  The histograms 
  are now working on such small data sets that it's a little silly, but they run 
  in under 5 seconds and show the syntax and logic, so I'm comfortable with it.
  
Thank you again for being a good editor.
Wayne Haythorn


## R CMD check results

### There were no ERRORs, WARNINGs, or NOTES, using 6 platforms:
  - `devtools::check()    # on my local windows 11 laptop
  - `rhub::check()` with
    - windows-x86_64-release
    - windows-x86_64-devel
    - macos-highsierra-release-cran
    - ubuntu-gcc-release
    - debian-clang-devel
   
    
## Reviewer comments on first submission

Thanks,

Please rather use the Authors@R field and declare Maintainer, Authors 
and Contributors with their appropriate roles with person() calls.
e.g. something like:
Authors@R: c(person("Alice", "Developer", role = c("aut", "cre","cph"),
                      email = "alice.developer@some.domain.net"),
                     person("Bob", "Dev", role = "aut") )

Please do not start the description with "Tools for", "This package", 
package name, title or similar.

Please proof-read your description text.

If there are references describing the methods in your package, please 
add these in the description field of your DESCRIPTION file in the form
authors (year) <doi:...>
authors (year) <arXiv:...>
authors (year, ISBN:...)
or if those are not available: <https:...>
with no space after 'doi:', 'arXiv:', 'https:' and angle brackets for 
auto-linking.
(If you want to add a title as well please put it in quotes: "Title")

Please add \value to .Rd files regarding exported methods and explain 
the functions results in the documentation. Please write about the 
structure of the output (class) and also what the output means. (If a 
function does not return a value, please document that too, e.g. 
\value{No return value, called for side effects} or similar)
Missing Rd-tags:
      gamma_histogram.Rd: \value
      mask_histogram.Rd: \value

\dontrun{} should only be used if the example really cannot be executed 
(e.g. because of missing additional software, missing API keys, ...) by 
the user. That's why wrapping examples in \dontrun{} adds the comment 
("# Not run:") as a warning for the user.
Does not seem necessary.
Please unwrap the examples if they are executable in < 5 sec, or replace 
\dontrun{} with \donttest{}.

Please fix and resubmit.

Best,
Victoria Wimmer
  
