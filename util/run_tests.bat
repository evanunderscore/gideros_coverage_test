@echo off
set LUA="C:\Program Files (x86)\Gideros\Tools\lua"
del luacov.stats.out
del coverage.xml
%LUA% -lluacov test\test.lua
util\fix_filenames.py luacov.stats.out
%LUA% bin\luacov-cobertura -o coverage.xml
diff-cover coverage.xml --compare-branch master --fail-under 100
exit /b %ERRORLEVEL%
