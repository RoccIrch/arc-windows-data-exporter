@echo off
setlocal enabledelayedexpansion

set "work_folder=C:\Users\%USERNAME%\AppData\Local\Packages\"

for /f "delims=" %%I in ('powershell -command "Get-ChildItem '%work_folder%' | Where-Object { $_.Name -like 'TheBrowserCompany.Arc_*' } | Select-Object -ExpandProperty Name"') do set "package_name=%%I"
if not defined package_name (
    echo No matching folder found.
    exit /b 1
)

set "folder_to_empty=%work_folder%%package_name%\LocalCache\Local\Arc"
if not exist "%folder_to_empty%" (
    echo The folder does not exist.
    exit /b 1
)

echo Please make sure Arc Browser is closed before proceeding.
set /p confirmation=Do you really want to empty the folder %folder_to_empty%? (Y/N)
if /i "%confirmation%" neq "Y" (
    echo Folder emptying cancelled.
    exit /b 0
)

del /q "%folder_to_empty%\*"

echo Last data has been successfully removed.

set "destination_folder=%work_folder%%package_name%\LocalCache\Local\Arc"

if not "%1"=="" (
    set "archive_path=%~1"
) else (
    set "archive_path=%~dp0arc_data.tar.gz"
)

if exist "%archive_path%" (
    tar -xzvf "%archive_path%" -C "%destination_folder%" 2>nul
    echo The data has been successfully imported.
) else (
    echo The specified archive does not exist.
    exit /b 1
)

endlocal
