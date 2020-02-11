@echo off
setlocal EnableDelayedExpansion 

echo F - Enter FIO
echo N - Enter phone number
echo G - Enter group number
echo D - Enter birth date

set /P choice="Enter your choice:"
If /i "%choice%"=="F" goto :fio
If /i "%choice%"=="N" goto :num
If /i "%choice%"=="G" goto :group
If /i "%choice%"=="D" goto :date
echo Your choice is wrong
goto :eof
set fcount=0
set bcount=0
set ncount=0
set gcount=0

:fio
set /P fchoice="Enter surname:"
call :findInGroup !fchoice! 1
for /L %%i in (1,1,!fcount!) do (
	call :findInBirth !fam%%i! 0
	call :findInNumber !fam%%i! 0
)
goto :print

:group
set /P gchoice="Enter group:"
call :findInGroup !gchoice! 1
for /L %%i in (1,1,!fcount!) do (
	call :findInBirth !fam%%i! 0
	call :findInNumber !fam%%i! 0
)
goto :print

:num
set /P nchoice="Enter number:"
call :findInNumber !nchoice! 1
for /L %%i in (1,1,!fcount!) do (
	call :findInBirth !fam%%i! 0
	call :findInGroup !fam%%i! 0
)
goto :print

:date
set /P dchoice="Enter birth date:"
call :findInBirth !dchoice! 1
for /L %%i in (1,1,!fcount!) do (
	call :findInNumber !fam%%i! 0
	call :findInGroup !fam%%i! 0
)
goto :print

:print
call :printResult
:eof
EXIT /B 0

:printResult 
for /L %%i in (1, 1 !fcount!) do (
	echo !fam%%i! - !group%%i! - !num%%i! - !birth%%i!
)
EXIT /B 0

:findInGroup 
FOR /f "tokens=1,2 delims= " %%a IN ('findstr /I "%1" group.txt') do (
	if %2==1 (
		set /a fcount+=1
		set fam!fcount!=%%a
	)
	set /a gcount+=1
	set group!gcount!=%%b
)
EXIT /B 0

:findInNumber 
FOR /f "tokens=1,2 delims= " %%a IN ('findstr /I "%1" number.txt') do (
	if %2==1 (
		set /a fcount+=1
		set fam!fcount!=%%a
	)
	set /a ncount+=1
	set num!ncount!=%%b
)
EXIT /B 0

:findInBirth 
FOR /f "tokens=1,2 delims= " %%a IN ('findstr /I "%1" birth.txt') do (
	if %2==1 (
		set /a fcount+=1
		set fam!fcount!=%%a
	)
	set /a bcount+=1
	set birth!bcount!=%%b
)
EXIT /B 0

echo on