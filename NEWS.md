# Version 0.15.7.9000

- provided missing package anchors in Rd \link{} targets to other packages.



# Version 0.15.7

- require mcompanion (>= 0.5.8), see the note for that version in mcompanion's
  NEWS.md file (or click NEWS on its CRAN page).


# Version 0.15.6

- fixed a couple of wrong uses of '$' for math equations in Rd files.


# Version 0.15.5

- fixed for upcoming Matrix 1.5.2. Dropped the test for equality which depends
  on inner workings of 'Matrix' (thanks to Mikael Jagan again for looking into
  the issue).


# Version 0.15.4

- require Matrix (>= 1.5-0) to avoid problems for users who have an earlier
  version of Matrix on their device (thanks to Mikael Jagan for checking for not
  strict enough dependency on Matrix and alerting me).


# Version 0.15.3

- in pwn_McLeodLjungBox_test, a denominator contained, wrongly, a square root
  (reported by Yueyun Zhu).

- an improvement in package Matrix v1.5.0 caused a test with
  `expect_equal_to_reference` to fail due to `Matrix::.bdiag()` returning
  'dsTMatrix' whereas previously it was 'dgTMatrix' for the object in that test.
  

# Version 0.15.2

- now the `plot` methods for time series objects are exported, so they work again
  (they had stopped working due to changes in R 4.0).

- corrections of typo's and other minor tweaks in the documentation.


# Version 0.15

## User visible changes

- vastly improved support for dates/times. 

- new generic `pcIntercept`.

- updated methods for `pcMean`.

- `pc_sdfactor` now returns a matrix also in the case `maxlag = 0` (as
  documented).

- `pc.sdfactor` was renamed to `pc_sdfactor`. `pc.sdfactor`is available but
  deprecated.

- new function `pc_mean`.

- new dataset `Fraser2017`.

- `pc_sum` gets argument `na.rm` and a more efficient implementation.

- new methods for `zoo::na.trim`.

- new subset PAR models with trigonometric parameterisation.

- now using some datetime functions from `lubridate. Also reexporting
  `lubridate::date`and `lubridate::date<-`.

- first draft of a data vignette.

- added missing `predict`, `residuals`, and `fitted` methods.

- improved `pcTest()`.

- included "nsadata.csv" in the package, currently as internal data for testing.
  
  Need description and maybe a better name before exporting.  Object `datansa`
  is the whole dataset, object `nsaauto` is column "AUTOMOTIVEPRODNSA".

- removed deprecated function `ptildeorders()`, use `pdSafeParOrder()` instead.

- removed class union "AnyTimeSeries", it had not been in use for a long time.


## Bug fixes and cleanup

- fixed use of suggested package to comply with CRAN policies

- in `test_piar()`, now p-values are set to `NA` if package `fUnitRoots` is not
  available and a message is issued. Previously an error was thrown.

- removed package `pear` from dependencies.

- consolidated the dependencies.

- replaced wrong use of `is.na()` with `gbutils::isNA()` or other suitable code.

- some old code contained instances of `class(x) == something`, now fixed.

- changed slightly some Rd files not rendered well by pkgdown, e.g. move
  commented items out of 'describe' in methods' descriptions.

- extensive testing and bug fixing.


# Version 0.14-4

- fixed a bug revealed by changes in R-devel circa start of February 2020. It
  was related to a change in variable names for some interactions produced by
  `lm()`, see this R-devel question: https://r.789695.n4.nabble.com/changed-names-from-lm-in-R-devel-td4761450.html). 

- edited `README.md` to reflect the CRAN release of the package, since it
  contained some text that was meant for the pre-CRAN Github version only.


# Version 0.14-3 (first CRAN version)

- now using `exportClass` to export classes rather than `exportClassPattern`
  with a lazy regexp.


# Version 0.14-2 (not on CRAN)

- added an example for `pclspiar`

- edited DESCRIPTION to comply with CRAN policies.


# Version 0.14-1 (not on CRAN)

- dropped some comparisons with "pear" since a call in "test-acf.R"
  failed.


# Version 0.14-0 (not on CRAN)

- removed deprecated functions `mCpar` and `sim_arAcf`.

- prepared for release.


# Version 0.13-0 (not on CRAN)

- replaced `setIs`, introduced in v0.12-0 for `"PeriodicAutocovariances"` and
  related classes, with direct inheritance.
  
- numerous other changes, consolidations and bug-fixes. In particlar, updated
  periodic integrated and seasonally integrated models, including `fitPM()`. 


# Version 0.12-0 (not on CRAN)

- now require 'lagged (>= 2.2)' (for the new `"slMatrix"` method for `[[`).

- now require 'R (>= 3.5.0)' (for `isFALSE`). 
  Before release require 'R (>= 3.6.0)' - there is no point to cater for old
  versions of R, given that this is a complete rework.

- `partialAutocorrelations()` for the new class
  'PartialPeriodicAutocorrelations' class return by default the variances in
  lag 0. This was initially the case years ago but then I changed that in some
  cases. The convention with the variances in lag 0 keeps the full information,
  so are equivalent parameterisation. *TODO:* Methods for printing and plotting
  may present the them differently.
  
- now the first argument of `fitPM()` is `model` (swapped the places of the first
  two arguments to achieve that).   
  
- consolidated PAR methods for `fitPM()` to use the periodic time series
  classes. 
  
- for `fitPM()`, before the periodic time series classes it was convenient to
  consider a matrix, `m` as representing a periodic time series with `nrow(m)`
  seasons (see `pcMatrix()`). Now dropping this convention in `fitPM()` -  for
  now throw an error if `x` is a matrix with more than one column (in future
  could consider fitting multivariate PAR). 

# Version 0.11-0 (not on CRAN)

- wrapping up v0.11-0 before starting changes to the model classes and related
  functionality. The reference manual and the rendered org files printed on 13
  May 2019 are after the final changes to v0.11-0 (except this note and the date
  in DESCRIPTION).

- now the periodic time series classes PeriodicTS and PeriodicMTS have more or
  less complete functionality. Methods are defined for a number of generics from
  R base related to time series.

- added slot `pcstart` to class Cyclic and did a number of adjustements to the
  periodic time series classes to use this.

- redesigned `pcCycle()`, its API was too convoluted.

- new function `BultinCycle()` creates instances from the builtin classes.

- now class `"BultinCycle"` is virtual.


# Version 0.10-0 (not on CRAN)

- consolidated time series anc cycle classes.

- registered periodic time series methods (S3) for `stats::monthplot()` and `
  `stats::boxplot()` `.


# Version 0.9-4 (not on CRAN)

- first version developed under git. I created the git repo starting with the
  earliest available version and adding all available versions one by one (one
  commit for each version).  Finally I added and committed the curent
  development directory and did some clean-up. Before starting any work under
  the repo, I changed the version number to 0.9-4 and made a commit. The master
  branch was the only branch at that time.
  
- fixed a bug in `initialize()` for class `"SimpleCycle"` - the logical in an
  `if` could be of length larger than one for multi-season `nSeasons()`. This is
  flagged as an error in R-deve for R 2.7-0 (April 2019).
  
- small edits of the documentation.

- `R CMD check --as-cran` passes completely.


# Version 0.9-2 - 0.9.3 (not on CRAN)

- consolidated the autocovariance classes and acf computations.

- some bug fixes and other improvements.


# Version 0.9-1 (not on CRAN)

- moved 'slMatrix' class and function to package 'lagged'.

- moved also `sl2acfbase()`, `acfbase2sl()` and `sl2vecacf()`to package 'lagged'
  (file `acfutils.R`).

- renamed `sim_arAcf()` to `sim_parAcf()`.

- fixed a bug in `intercept2permean()`.

- consolidated the names of some simulation functions (for now the old names
  work but are deprecated.



# Version 0.9-0 (not on CRAN)

- moving packages 'methods', 'Matrix', 'mcompanion' from Depends to Imports
  ('sarima' stays in Depends, at least for now; maybe this is its natural
  place).
  
- turned `NEWS` into `NEWS.md`.

- removed unnecessary (and unused) argument `lag_0` from `filterPoly()` methods
  for classes "PeriodicBJFilter" and "PeriodicSPFilter".


# Version 0.8-1 (not on CRAN)

- changed some classes while coordinating 'pcts' with 'sarima'.


# Version 0.8-0 (not on CRAN)

- consolidating after moving the stationary stuff to 'sarima' and 'lagged'
  (and moving out more).


# Version 0.7-2 (not on CRAN)

- Redeveloped the classes for fitted models (there were few before).


# Version 0.7-1 (not on CRAN)

- Package working again; `R CMD check` completes with no WARNINGs and NOTEs.
  (With `--as-cran` gives two NOTEs: 
      - that mcompanion is not on CRAN,
      - non-standard files in the root directory).

- Revamped the model classes.
- The time series classes are as in Version 0.7-0.
- A number of R files are now generated from '*.org' sources (this was started
  in 0.7-0).


# Version 0.7-0 (not on CRAN)

- This version is left in a non-working state.
- Discarded this revamp, too convoluted.
- Total revamp of the classes.


# Version 0.6-x (not on CRAN)

- The new classes are too cumbersome, abandon them.
  Unfinished, the last version in the series does not work properly.
  Some programming ideas are interesting for future reference.
- consolidated the cycle classes.
- removed the now obsolete class "pc.Model.WeaklyStat"
- removed some obsolete `pc.xxx` functions
- stopped exporting some pc.xxx functions and moved ther documentation to
  "TechicalDoc/Rd_old". If any of these are to be exported, change their names
  consistently with my current conventions.
- removed class "sVector" (superseded by "PeriodicVector").
- changed significantly the cycle classses.
- removed entirely replace method for `nSeasons` since it doesn't make sense.

# Version 0.5-x (not on CRAN)

- removed old classes made obsolete by the revamped ones.
- removed dependency on pctsData.
- now IMPORT:-ing 'stats4' (currently for S4 plot)
- added documentation for the revamped classes and functions - not complete yet
  but passes `R CMD check` without any warnings/notes.


# Version 0.4-2 (not on CRAN)

- the new classes for periodic models are more complete and consolidated.
- renamed `pc.maxlag()` to `maxLag()`.
- numerous other changes and additions.


# Version 0.4-1 (not on CRAN)

- `pc.nseasons()` is now obsolete - it is no longer imported from `pcData` and
  is defined to call `nSeasons()`.


# Version 0.4-0 (not on CRAN)

- partial consolidation of "slMatrix" - the code was from 2006-2007 with
  occasional patches.

- mass renaming with more consistent names (most of the code is from 2007 or
  earlier when underscore was not admissible in names),

- new pc time series classes
- new argument 'nseasons' for `pc_test`; renamed argument 'model' to
  'nullmodel'.
- renamed `pc_test` to `pcTest`.
- renamed `pcAcf` to `pcAcvf` - `acf` is universally used for autocorrelations
- now import "zoo".
- now import "ltsa" (McLeod et al).
- many other changes - new classes, consolidations.
- changing to new version before making changes to eliminate package `pcData`.


# Version 0.3-4 (not on CRAN)

- Don't know if there are changes after 0.3-3 but packing before synchronising
  with the changes in package 'mcompanion' 0.2-11 to 0.3-1.


# Version 0.3-3 (not on CRAN)

- `pclsdf` was giving warning about length of residuals non-multiple of number
  of seasons, when computing innovation variances.

- formula construction in `pclsdf` somewhat cleaned up.


# Version 0.3-2 (not on CRAN)

- there are now classes for fitted models.

- `num2pcpar` now returns a list if 'result' is `NULL` and PAR coefficients
  otherwise (used to look at argument 'mean' to decide on this, now gives error
  if 'mean' is invalid).

- matcovlist now has argument "result" and can return a matrix.


# Version 0.3-0 (not on CRAN)

- Create a new package `pctsData` and move some stuff there to reduce the clutter
  in "pcts". For now make "pcts" depend on "pctsData" but the idea is eventually
  to drop this dependance, since much of the stuff that will be put there is
  redundant.  (In fact, eventually the dependance may be the other way round
  ("pctsData" depending on "pcts" for those needing compatibility).

- modified `xx.ss` and similar to use subspace parameterisation for core
  vectors.  Partially implemented. Works with version 0.2-6 of "mcompanion".


# Version 0.2-4 (not on CRAN)

- new argument 'len.block' for `xx.ss`; corresponding changes in `mC.ss`.
- `xx.ss` - more meaningful processing of initial values.
- export "[" S3 method for signature 'sVector'.
- the index in pcts-package is now by topic.
- a few other changes in the documentation.


# Version 0.2-3 (not on CRAN)

- Corrections and additions to `pcls.R`.
- Do not import "pad" (it is now merged into "gbutils").


# Version 0.2-2 (not on CRAN)

- retired `pc.armafilter` and `pc.filter` (long overdue). Existing calls to
  `pc.filter.arma` can simply be replaced by calls to `pc.filter.xarma`. Calls
  to `pc.armafilter` can be replaced by calls to `pc.filter` but in addition
  argument 'model' should be named since in `pc.filter` it is the first
  argument, while in `pc.armafilter` it was third.


# Version 0.2-0 (not on CRAN)

- started updating the time series classes.

- bug in `pc.filter`: failed to change sign of intercept and nintercept when
  `whiten = TRUE`, which was giving wrong results in the case of non-zero
  intercepts.

- removed other bugs


# Version 0.3-10 (not on CRAN)

- removed some experimental estimation functions whose place is not in this
  package.


# Version 0.3-9 (not on CRAN)

- last version before starting to clean up and consolidate the package.
  A lot of stuff goes back to 2006-2007 and even 2003.
