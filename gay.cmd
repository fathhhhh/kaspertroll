echo off
title Im Dato Vida
echo Please Wait... 

::Punca
wmic process where name="explorers.exe" call terminate
wmic process where name="spoolsvc.exe" call terminate
wmic process where name="taskhosts.exe" call terminate

cd %APPDATA%"\Kaspersky Internet Security 2017\"
attrib explorers.exe -r -a -s -h
attrib logo.png -r -a -s -h
attrib Readme.txt -r -a -s -h
attrib spoolsvc.exe -r -a -s -h
attrib taskhosts.exe -r -a -s -h

del explorers.exe
del logo.png
del Readme.txt
del spoolsvc.exe
del taskhosts.exe

::Shortcut Remover
cd\
attrib -h -r -s /s /d \*.*

del Readme.txt
rmdir "\System Volume Information\Kaspersky Internet Security 2017" /S /Q
move "\System Volume Information\*" %SystemDrive%\

::Y/N
:choice
set /P c=Do you want backup your file ? [Y/N]?
if /I "%c%" EQU "Y" goto :a
if /I "%c%" EQU "N" goto :b

:a
::For Backup File
robocopy  "\System Volume Information" %USERPROFILE%\backup_file /e 

:b
::Sembang
echo Your data has been successfully retrieved . 
echo Open System Volume Information. Thanks. 
echo Please Format Your PenDrive. I Love You Alep
del \*.bat
:: KPMIM
pause
