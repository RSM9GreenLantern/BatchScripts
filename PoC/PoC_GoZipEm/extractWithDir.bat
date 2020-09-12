@echo on
for /F "tokens=*" %%F in ("DIR /B /S %CD%\*.gz %CD%\*.7z %CD%\*.tar %CD%\*.zip") do (start /wait 7z x %%~fF o %%~dpF%%~nF)