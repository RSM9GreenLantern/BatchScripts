@echo on
setlocal
set currentLevel=0
set deepestLevel=0
set maxLevel=%2
echo cannot set too high, stack overflow
if not defined maxLevel set maxLevel=50
rem if %2 gtr 100 set maxLevel=100

:procFolder
pushd %1 2>&1 || exit /b
if %currentLevel% lss %maxLevel% (
	if %currentLevel% gtr %deepestLevel% (set deepestLevel=%currentLevel%)

	for /d %%F in (%1) do (
		echo %%~fF
		set /a currentLevel+=1
		call :procFolder %%F
		set /a currentLevel-=1
	)
)
echo exiting %currentLevel%
echo deepestLevel %deepestLevel%
popd