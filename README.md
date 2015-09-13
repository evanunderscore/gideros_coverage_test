Gideros Coverage Test
=====================

Test project for combining Gideros with luacov and diff-cover for code coverage reports.

Reproducing diff-cover failure
------------------------------

0. Add a dummy function to `src/maths.lua` that will not be called by the test
0. From the repository root, run `util\runtests.bat`
    * You will need to `set LUA=<path to lua interpreter>` if you don't have Gideros
0. `diff-cover` should report coverage is below 100%
    * Save a copy of `coverage.xml` if you need it
0. `set TEST_FAIL=1` and rerun `util\runtests.bat`
0. `diff-cover` should report that there are no lines with coverage information