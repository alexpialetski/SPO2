@echo off
set choice=%1
dir %choice%>NUL 2>&1 
if errorlevel 1 (md %choice%)

FOR /f "tokens=1,2,3,4  delims= " %%a IN ('fsutil fsinfo drives') do (
	dir %%b %%c %%d > %choice%\a.txt
)

systeminfo >> %choice%\a.txt
cd %choice% && echo File in && cd
echo on