@echo off
setlocal enabledelayedexpansion

cd %~dp0

set "POWERSHELL_VERSION=7.4.6"
set "POWERSHELL_DIR=PowerShell"
set "POWERSHELL_ZIP=PowerShell-%POWERSHELL_VERSION%-win-x64.zip"
set "POWERSHELL_UNZIP=PowerShell-%POWERSHELL_VERSION%-win-x64"
set "POWERSHELL_EXEC=pwsh.exe"
set "POWERSHELL_EXEC_PATH=%POWERSHELL_DIR%\%POWERSHELL_UNZIP%\%POWERSHELL_EXEC%"
set "POWERSHELL_URL=https://github.com/PowerShell/PowerShell/releases/download/v%POWERSHELL_VERSION%/PowerShell-%POWERSHELL_VERSION%-win-x64.zip"

:install_powershell
	
	echo Installing Portable PowerShell v%POWERSHELL_VERSION%
	
	:: Create PowerShell directory
    if not exist "%POWERSHELL_DIR%" (
        mkdir "%POWERSHELL_DIR%"
        echo Created directory: %POWERSHELL_DIR%
    ) else (
        echo Directory already exists: %POWERSHELL_DIR%
    )

	if exist "%POWERSHELL_DIR%\%POWERSHELL_ZIP%" (
        echo %POWERSHELL_ZIP% already downloaded.
    ) else (
		:: Download PowerShell zip file
		echo Downloading PowerShell ...
		powershell -Command "Start-BitsTransfer -Source '%POWERSHELL_URL%' -Destination '%POWERSHELL_DIR%\%POWERSHELL_ZIP%'"
		
		:: Check if download was successful
		if not exist "%POWERSHELL_DIR%\%POWERSHELL_ZIP%" (
			echo Error: Failed to download PowerShell.
			:: TODO retry download or skip
			pause
		)	
	)
	
	if exist "%POWERSHELL_DIR%\%POWERSHELL_UNZIP%" (
		echo %POWERSHELL_UNZIP% already installed.
		goto start_installer
	) else (
		:: Unzip the downloaded file to the installation directory
		echo Unzipping PowerShell to %POWERSHELL_DIR%\%POWERSHELL_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%POWERSHELL_DIR%\%POWERSHELL_ZIP%' -DestinationPath '%POWERSHELL_DIR%\%POWERSHELL_UNZIP%' -Force"
		echo PowerShell installed successfully.
	)
	
	pause
	
:: Start signum installer using portable PowerShell
:start_installer
%POWERSHELL_EXEC_PATH% -ExecutionPolicy Bypass -File ".\signum-installer.ps1"
