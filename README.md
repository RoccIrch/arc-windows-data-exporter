# Arc Data Import and Export Scripts 

These scripts provide a convenient way to export and import your spaces, pinned tab and favorite tab from Arc Windows Beta. You can use it to bring your things to another computer or just to make some saves before updating client. 

❗ Caution, this script only enables exporting and importing spaces, pinned tabs, and favorites, you will need to reconnect your accounts!

## Before using :
- Ensure that 'tar' is installed on your system.
- Make sure Arc Browser is closed before proceeding export or import.
- The folder name for 'TheBrowserCompany.Arc_*' may vary, and the scripts will adapt to the correct folder dynamically.


## Exporting Script : 

```cmd
export_arc_data.bat [destination_archive_folder]
```
This script exports the contents in a tar.gz archive file. You can specify the destination path for the archive file as an optional argument. If no destination is provided, the archive will be created in the script's directory.
### Example:
```cmd
export_arc_data.bat C:\Users\YourUsername\Documents\ArcSaves\
```

## Import Script :
```cmd
import_arc_data.bat [source_archive_folder]
```
This script imports data from the specified tar.gz archive. You can provide the source path of the archive as an optional argument. If no source is provided, the script will look for 'arc_data.tar.gz' in the script's directory.
### Example:
```cmd
import_arc_data.bat C:\Users\YourUsername\Documents\ArcSaves\myarcsave.tar.gz
```

## Disclaimer:

Use these scripts at your own risk. Always backup important data before performing any actions.