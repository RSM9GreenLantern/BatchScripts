if "%1" == "" goto:eof
time /T
for /F "tokens=*" %%F in (%1) do (
	start /b /wait 7z x %%F -o%%~dpF
	)
exit