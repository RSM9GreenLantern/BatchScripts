@echo on

REM CANT FIND FILE --try putting list in text file from 7z
for /F "usebackq tokens=*" %%F in ( start /wait 7z l "%CD%\*.gz" ) do (mkdir %%~dpF%%~nF & start /wait 7z x %%~fF o %%~dpF%%~nF)
for /F "usebackq tokens=*" %%F in ( start /wait 7z l "%CD%\*.zip") do (mkdir %%~dpF%%~nF & start /wait 7z x %%~fF o %%~dpF%%~nF)
for /F "usebackq tokens=*" %%F in ( start /wait 7z l "%CD%\*.7z" ) do (mkdir %%~dpF%%~nF & start /wait 7z x %%~fF o %%~dpF%%~nF)
for /F "usebackq tokens=*" %%F in ( start /wait 7z l "%CD%\*.tar") do (mkdir %%~dpF%%~nF & start /wait 7z x %%~fF o %%~dpF%%~nF)
