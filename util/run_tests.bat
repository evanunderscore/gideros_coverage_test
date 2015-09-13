@echo off

rem run tests and report coverage information
rem run from repository root (as "util\run_tests.bat")
rem "set TEST_FAIL=1" to see failure in diff-cover
rem "set TEST_FAIL=" to clear

rem set this to use a different lua interpreter
if not defined LUA (
    set LUA="C:\Program Files (x86)\Gideros\Tools\lua"
)
echo using lua interpreter %LUA%

rem set up lua environment
set LUA_INIT=require 'src/init'; package.path = package.path .. ';lib/?.lua'

rem delete old files if they exist
del luacov.stats.out 2> nul
del coverage.xml 2> nul

rem run tests with coverage
%LUA% -lluacov test/test.lua

rem fix paths unless told otherwise
if not defined TEST_FAIL (
    util\fix_filenames.py luacov.stats.out
)

rem convert luacov format to cobertura format
%LUA% util\luacov-cobertura -o coverage.xml

rem check coverage and fail if all lines aren't tested
diff-cover coverage.xml --compare-branch master --fail-under 100
exit /b %ERRORLEVEL%
