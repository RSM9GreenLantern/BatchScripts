set extractProcess=C:\Users\cvons\Documents\CodeRepo\batch\extractFileHere.bat
clear
@echo on
if "%1" == "" goto:eof
time /T
for /F %%F in ('DIR %~f1\*.cramfs %~f1\*.doc %~f1\*.gz %~f1\*.img %~f1\*.pkg %~f1\*.xz  /B /S') do (echo %%F >>tempRoot.txt)
set i=A
for /F "tokens=*" %%L in (tempRoot.txt) do (
		if %i%=="A" (
			set i=S
			echo 1
			echo %%L>>%%~f1\temp1.txt
			goto endloop
			)
		if %i%=="S" (
			set i=D
			echo 2
			echo %%L>>%%~f1\temp2.txt
			goto endloop
			)
		if %i%=="D" (
			set i=F
			echo 3
			echo %%L>>%%~f1\temp3.txt
			goto endloop
			)
		if %i%=="F" (
			set i=A
			echo 0
			echo %%L>>%%~f1\temp4.txt
			goto endloop
			)
		:endloop
	)
start %extractProcess% %~f1\temp1.txt
start %extractProcess% %~f1\temp2.txt
start %extractProcess% %~f1\temp3.txt
start %extractProcess% %~f1\temp4.txt
time /T
echo done