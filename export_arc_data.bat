@echo off
setlocal

set "work_folder=C:\Users\%USERNAME%\AppData\Local\Packages\"

for /f %%I in ('powershell -command "Get-ChildItem '%work_folder%' | Where-Object { $_.Name -like 'TheBrowserCompany.Arc_*' } | Select-Object -ExpandProperty Name"') do set "arc_folder=%%I"

if not defined arc_folder (
    echo No matching folder found.
    exit /b 1
)

set "arc_data_folder=%work_folder%%arc_folder%\LocalCache\Local\Arc"

if "%1" neq "" (
    set "archive_destination=%1\arc_data.tar.gz"
) else (
    set "archive_destination=%~dp0arc_data.tar.gz"
)

echo Please make sure Arc Browser is closed before proceeding.
set /p "confirmation=Are you sure you want to continue? (Y/N) "
if /i "%confirmation%" neq "Y" (
    echo Aborted.
    exit /b 1
)

where tar >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: tar tool is not installed. Please download and install it.
    exit /b 1
)

tar -czvf "%archive_destination%" -C "%arc_data_folder%" ^
    ArchiveItemsFaviconCache ^
    ArchiveSnapshotCache ^
    BoostsImageCache ^
    RemoteAssetDirectory ^
    SidebarItemsFaviconCache ^
    StorableArchive.json ^
    StorableArchiveItems.json ^
    StorableAuthState.json ^
    StorableCommandBarAdditionalRanking.json ^
    StorableDefaultBrowserPrompts.json ^
    StorableFeatureFlags.json ^
    StorableSidebar.json ^
    StorableWindows.json || echo Warning: Some files or directories were not found.

echo Archive created successfully at: %archive_destination%

endlocal
