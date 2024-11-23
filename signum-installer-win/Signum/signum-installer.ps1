# Change directory to the script's location
cd $PSScriptRoot

$POWERSHELL_VERSION = "7.4.6"
$POWERSHELL_DIR = "PowerShell"
$POWERSHELL_ZIP = "PowerShell-${POWERSHELL_VERSION}-win-x64.zip"
$POWERSHELL_UNZIP = "PowerShell-${POWERSHELL_VERSION}-win-x64"
$POWERSHELL_EXEC = "pwsh.exe"
$POWERSHELL_EXEC_PATH = "${POWERSHELL_DIR}\${POWERSHELL_UNZIP}\${POWERSHELL_EXEC}"
$POWERSHELL_URL = "https://github.com/PowerShell/PowerShell/releases/download/v${POWERSHELL_VERSION}/PowerShell-${POWERSHELL_VERSION}-win-x64.zip"

$SIGNUM_NODE_DIR = "Node"
# TODO rename: $SIGNUM_MAINNET_VERSION -> $SIGNUM_MAINNET_NODE_VERSION?
# TODO MAINNET_POOL
# TODO TESTNET_POOL

$SIGNUM_STARTER_PS1 = "start-signum.ps1"
$SIGNUM_STARTER_EXEC = "start-signum.bat"

$SIGNUM_MAINNET_VERSION = "v3.8.2"
$SIGNUM_MAINNET_DIR = "Mainnet"
$SIGNUM_MAINNET_DIR_PATH = "${SIGNUM_MAINNET_DIR}\${SIGNUM_NODE_DIR}"
$SIGNUM_MAINNET_ZIP = "signum-node-${SIGNUM_MAINNET_VERSION}-win_x64.zip"
$SIGNUM_MAINNET_UNZIP = "signum-node-${SIGNUM_MAINNET_VERSION}-win_x64"
$SIGNUM_MAINNET_STARTER_PS1_PATH = "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\${SIGNUM_STARTER_PS1}"
$SIGNUM_MAINNET_STARTER_EXEC_PATH = "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\${SIGNUM_STARTER_EXEC}"
$SIGNUM_MAINNET_URL = "https://github.com/signum-network/signum-node/releases/download/${SIGNUM_MAINNET_VERSION}/${SIGNUM_MAINNET_ZIP}"

$SIGNUM_TESTNET_VERSION = "v3.8.2"
$SIGNUM_TESTNET_DIR = "Testnet"
$SIGNUM_TESTNET_DIR_PATH = "${SIGNUM_TESTNET_DIR}\${SIGNUM_NODE_DIR}"
$SIGNUM_TESTNET_ZIP = "signum-node-${SIGNUM_TESTNET_VERSION}-win_x64.zip"
$SIGNUM_TESTNET_UNZIP = "signum-node-${SIGNUM_TESTNET_VERSION}-win_x64"
$SIGNUM_TESTNET_STARTER_PS1_PATH = "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\${SIGNUM_STARTER_PS1}"
$SIGNUM_TESTNET_STARTER_EXEC_PATH = "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\${SIGNUM_STARTER_EXEC}"
$SIGNUM_TESTNET_URL = "https://github.com/signum-network/signum-node/releases/download/${SIGNUM_TESTNET_VERSION}/${SIGNUM_TESTNET_ZIP}"

$MAINNET_DEFAULT_PROPERTIES = ".\${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\conf\node-default.properties"
$MAINNET_PROPERTIES = ".\${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\conf\node.properties"

$TESTNET_DEFAULT_PROPERTIES = ".\${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\conf\node-default.properties"
$TESTNET_PROPERTIES = ".\${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\conf\node.properties"

$SIGNUM_MAINNET_MINER_VERSION = ""
$SIGNUM_MAINNET_MINER_DIR = ""
$SIGNUM_MAINNET_MINER_ZIP = ""
$SIGNUM_MAINNET_MINER_UNZIP = ""
$SIGNUM_MAINNET_MINER_STARTER_PS1_PATH = ""
$SIGNUM_MAINNET_MINER_URL = ""

$SIGNUM_TESTNET_MINER_VERSION = ""
$SIGNUM_TESTNET_MINER_DIR = ""
$SIGNUM_TESTNET_MINER_ZIP = ""
$SIGNUM_TESTNET_MINER_UNZIP = ""
$SIGNUM_TESTNET_MINER_STARTER_PS1_PATH = ""
$SIGNUM_TESTNET_MINER_URL = ""

$SIGNUM_MAINNET_MINER_YAML = ""
$SIGNUM_TESTNET_MINER_YAML = ""

$SIGNUM_PLOTTER_VERSION = ""
$SIGNUM_PLOTTER_DIR = ""
$SIGNUM_PLOTTER_ZIP = ""
$SIGNUM_PLOTTER_UNZIP = ""
$SIGNUM_PLOTTER_STARTER_PS1_PATH = ""
$SIGNUM_PLOTTER_URL = ""

$BTDEX_STARTER_PS1 = "start-btdex.ps1"
$BTDEX_STARTER_EXEC = "start-btdex.bat"
$BTDEX_VERSION = "v0.6.8"
$BTDEX_DIR = "BTDEX"
$BTDEX_VERSION_DIR = "$BTDEX_DIR\$BTDEX_VERSION"
$BTDEX_EXEC = "btdex-${BTDEX_VERSION}-win.exe"
$BTDEX_EXEC_PATH = "${BTDEX_DIR}\$BTDEX_VERSION_DIR\${BTDEX_EXEC}"
$BTDEX_STARTER_PS1_PATH = "${BTDEX_DIR}\$BTDEX_VERSION_DIR\${BTDEX_STARTER_PS1}"
$BTDEX_STARTER_EXEC_PATH = "${BTDEX_DIR}\$BTDEX_VERSION_DIR\${BTDEX_STARTER_EXEC}"
# TODO download BTDEX all.jar
# $BTDEX_URL = "https://github.com/btdex/btdex/releases/download/${BTDEX_VERSION}/btdex-${BTDEX_VERSION}-all.jar"
$BTDEX_URL = "https://github.com/btdex/btdex/releases/download/${BTDEX_VERSION}/${BTDEX_EXEC}"

$PHOENIX_STARTER_PS1 = "start-phoenix.ps1"
$PHOENIX_STARTER_EXEC = "start-phoenix.bat"
$PHOENIX_VERSION = "1.5.0-beta.3"
$PHOENIX_DIR = "Phoenix"
$PHOENIX_VERSION_DIR = "$PHOENIX_DIR\$PHOENIX_VERSION"
$PHOENIX_EXEC = "win-phoenix-signum-wallet.${PHOENIX_VERSION}.exe"
$PHOENIX_EXEC_PATH = "${PHOENIX_DIR}\$PHOENIX_VERSION_DIR\${PHOENIX_EXEC}"
$PHOENIX_STARTER_PS1_PATH = "${PHOENIX_DIR}\$PHOENIX_VERSION_DIR\${PHOENIX_STARTER_PS1}"
$PHOENIX_STARTER_EXEC_PATH = "${PHOENIX_DIR}\$PHOENIX_VERSION_DIR\${PHOENIX_STARTER_EXEC}"
$PHOENIX_URL = "https://github.com/signum-network/phoenix/releases/download/desktop-${PHOENIX_VERSION}/${PHOENIX_EXEC}"

$PLOTTER_DIR = "Plotter"

$TURBOPLOTTER_STARTER_PS1 = "start-turboplotter.ps1"
$TURBOPLOTTER_STARTER_EXEC = "start-turboplotter.bat"
$TURBOPLOTTER_VERSION = "0.10.2"
$TURBOPLOTTER_VERSION_DIR = "TurboPlotter"
$TURBOPLOTTER_VERSION_DIR_PATH = "$PLOTTER_DIR\$TURBOPLOTTER_VERSION_DIR"
$TURBOPLOTTER_VERSION_UNZIP = "$PLOTTER_DIR\$TURBOPLOTTER_VERSION_DIR\TurboPlotter_$TURBOPLOTTER_VERSION"
$TURBOPLOTTER_VERSION_ZIP = "$PLOTTER_DIR\$TURBOPLOTTER_VERSION_DIR\TurboPlotter_$TURBOPLOTTER_VERSION.zip"
$TURBOPLOTTER_EXEC = "TurboPlotter.exe"
$TURBOPLOTTER_EXEC_PATH = "$TURBOPLOTTER_VERSION_UNZIP\${TURBOPLOTTER_EXEC}"
$TURBOPLOTTER_STARTER_PS1_PATH = "$TURBOPLOTTER_VERSION_UNZIP\${TURBOPLOTTER_STARTER_PS1}"
$TURBOPLOTTER_STARTER_EXEC_PATH = "$TURBOPLOTTER_VERSION_UNZIP\${TURBOPLOTTER_STARTER_EXEC}"
$TURBOPLOTTER_URL = "https://blackpawn.com/tp/drop/TurboPlotter_$TURBOPLOTTER_VERSION.zip"

$SIGNUMPLOTTER_STARTER_PS1 = "start-signumplotter.ps1"
$SIGNUMPLOTTER_STARTER_EXEC = "start-signumplotter.bat"
$SIGNUMPLOTTER_VERSION = "v2.5.0"
$SIGNUMPLOTTER_DIR = "SignumPlotter"
$SIGNUMPLOTTER_VERSION_DIR = "$PLOTTER_DIR\$SIGNUMPLOTTER_DIR\$SIGNUMPLOTTER_VERSION"
$SIGNUMPLOTTER_EXEC = "signum-plotter.exe"
$SIGNUMPLOTTER_EXEC_PATH = "$SIGNUMPLOTTER_VERSION_DIR\${SIGNUMPLOTTER_EXEC}"
$SIGNUMPLOTTER_STARTER_PS1_PATH = "$SIGNUMPLOTTER_VERSION_DIR\${SIGNUMPLOTTER_STARTER_PS1}"
$SIGNUMPLOTTER_STARTER_EXEC_PATH = "$SIGNUMPLOTTER_VERSION_DIR\${SIGNUMPLOTTER_STARTER_EXEC}"
$SIGNUMPLOTTER_URL = "https://github.com/signum-network/signum-plotter/releases/download/$SIGNUMPLOTTER_VERSION/signum-plotter.exe"

# https://wiki.signum.network/signum-mining/index.htm
# https://blackpawn.com/tp/drop/TurboPlotter_0.10.2.zip
# https://github.com/signum-network/signum-plotter/releases/download/v2.5.0/signum-plotter.exe
# https://github.com/signum-network/whitepaper/blob/main/business/v1.pdf
# https://github.com/signum-network/signum-miner/releases/download/v1.8.0/signum-miner.exe
# https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.portable.x64.zip

# TODO 1 notepad++ installer
# TODO Documents Menu
# TODO makr recommended applications

$MINER_DIR = "Miner"
$SIGNUM_MINER_DIR = "Signum Miner"

$SIGNUM_MINER_MAINNET_STARTER_PS1 = "start-miner.ps1"
$SIGNUM_MINER_MAINNET_STARTER_EXEC = "start-miner.bat"
$SIGNUM_MINER_MAINNET_VERSION = "v1.8.0"
$SIGNUM_MINER_MAINNET_VERSION_DIR = "$SIGNUM_MINER_MAINNET_VERSION"
$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH = "$SIGNUM_MAINNET_DIR\$MINER_DIR\$SIGNUM_MINER_DIR\$SIGNUM_MINER_MAINNET_VERSION_DIR"
$SIGNUM_MINER_MAINNET_EXEC = "signum-miner.exe"
$SIGNUM_MINER_MAINNET_EXEC_PATH = "$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\${SIGNUM_MINER_MAINNET_EXEC}"
$SIGNUM_MINER_MAINNET_STARTER_PS1_PATH = "$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\${SIGNUM_MINER_MAINNET_STARTER_PS1}"
$SIGNUM_MINER_MAINNET_STARTER_EXEC_PATH = "$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\${SIGNUM_MINER_MAINNET_STARTER_EXEC}"
$SIGNUM_MINER_MAINNET_CONF_PATH = "$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\config.yaml"
$SIGNUM_MINER_MAINNET_CONF_URL = "https://github.com/signum-network/signum-miner/releases/download/${SIGNUM_MINER_MAINNET_VERSION}/config.yaml"
$SIGNUM_MINER_MAINNET_URL = "https://github.com/signum-network/signum-miner/releases/download/${SIGNUM_MINER_MAINNET_VERSION}/${SIGNUM_MINER_MAINNET_EXEC}"

$SIGNUM_MINER_TESTNET_STARTER_PS1 = "start-miner.ps1"
$SIGNUM_MINER_TESTNET_STARTER_EXEC = "start-miner.bat"
$SIGNUM_MINER_TESTNET_VERSION = "v1.8.0"
$SIGNUM_MINER_TESTNET_VERSION_DIR = "$SIGNUM_MINER_TESTNET_VERSION"
$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH = "$SIGNUM_TESTNET_DIR\$MINER_DIR\$SIGNUM_MINER_DIR\$SIGNUM_MINER_TESTNET_VERSION_DIR"
$SIGNUM_MINER_TESTNET_EXEC = "signum-miner.exe"
$SIGNUM_MINER_TESTNET_EXEC_PATH = "$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\${SIGNUM_MINER_TESTNET_EXEC}"
$SIGNUM_MINER_TESTNET_STARTER_PS1_PATH = "$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\${SIGNUM_MINER_TESTNET_STARTER_PS1}"
$SIGNUM_MINER_TESTNET_STARTER_EXEC_PATH = "$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\${SIGNUM_MINER_TESTNET_STARTER_EXEC}"
$SIGNUM_MINER_TESTNET_CONF_PATH = "$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\config.yaml"
$SIGNUM_MINER_TESTNET_CONF_URL = "https://github.com/signum-network/signum-miner/releases/download/${SIGNUM_MINER_TESTNET_VERSION}/config.yaml"
$SIGNUM_MINER_TESTNET_URL = "https://github.com/signum-network/signum-miner/releases/download/${SIGNUM_MINER_TESTNET_VERSION}/${SIGNUM_MINER_TESTNET_EXEC}"

$DOCUMENTS_DIR = "Documents"

$WHITEPAPER_VERSION = "v1"
$WHITEPAPER_DOC = "$WHITEPAPER_VERSION.pdf"
$WHITEPAPER_DIR = "Whitepaper"
$WHITEPAPER_DIR_PATH = "$DOCUMENTS_DIR\$WHITEPAPER_DIR"
$WHITEPAPER_DOC_PATH = "$DOCUMENTS_DIR\$WHITEPAPER_DIR\$WHITEPAPER_VERSION.pdf"
$WHITEPAPER_URL = "https://signum-network.github.io/whitepaper/business/${WHITEPAPER_VERSION}.pdf"
# $WHITEPAPER_URL = "https://github.com/signum-network/whitepaper/blob/main/business/${WHITEPAPER_VERSION}.pdf"

$DATABASE_DIR = "Database"

$MARIADB_STARTER_PS1 = "start-mariadb.ps1"
$MARIADB_STARTER_EXEC = "start-mariadb.bat"
$MARIADB_EXEC = "mariadb.exe"
$MARIADBD_EXEC = "mariadbd.exe"
$MARIADB_INSTALL_EXEC = "mysql_install_db.exe"
$MARIADB_VERSION = "10.6.20"
$MARIADB_DIR = "MariaDB"
$MARIADB_ZIP = "mariadb-${MARIADB_VERSION}-winx64.zip"
$MARIADB_UNZIP = "mariadb-${MARIADB_VERSION}-winx64"
$MARIADB_BIN = "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\bin"
$MARIADB_STARTER_PS1_PATH = "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\${MARIADB_STARTER_PS1}"
$MARIADB_STARTER_EXEC_PATH = "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\${MARIADB_STARTER_EXEC}"
$MARIADB_URL = "https://archive.mariadb.org/mariadb-${MARIADB_VERSION}/winx64-packages/mariadb-${MARIADB_VERSION}-winx64.zip"

$DATABASE_NAME = ""
$DATABASE_USERNAME = ""
$DATABASE_PASSWORD = ""

$TOOLS_DIR = "Tools"

$HEIDISQL_STARTER_PS1 = "start-heidisql.ps1"
$HEIDISQL_STARTER_EXEC = "start-heidisql.bat"

$HEIDISQL_VERSION = "12.8"
$HEIDISQL_DIR = "HeidiSQL"
$HEIDISQL_ZIP = "HeidiSQL_${HEIDISQL_VERSION}_64_Portable.zip"
$HEIDISQL_UNZIP = "HeidiSQL_${HEIDISQL_VERSION}_Portable"
$HEIDISQL_EXEC = "heidisql.exe"
$HEIDISQL_EXEC_PATH = "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_UNZIP}\${HEIDISQL_EXEC}"
$HEIDISQL_STARTER_PS1_PATH = "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_UNZIP}\${HEIDISQL_STARTER_PS1}"
$HEIDISQL_STARTER_EXEC_PATH = "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_UNZIP}\${HEIDISQL_STARTER_EXEC}"
$HEIDISQL_URL = "https://www.heidisql.com/downloads/releases/HeidiSQL_${HEIDISQL_VERSION}_64_Portable.zip"

$NGINX_STARTER_PS1 = "start-nginx.ps1"
$NGINX_STARTER_EXEC = "start-nginx.bat"

$NGINX_VERSION = "1.26.2"
$NGINX_DIR = "NGINX"
$NGINX_ZIP = "nginx-${NGINX_VERSION}.zip"
$NGINX_UNZIP = "nginx-${NGINX_VERSION}"
$NGINX_EXEC = "nginx.exe"
$NGINX_EXEC_PATH = "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_UNZIP}\${NGINX_EXEC}"
$NGINX_STARTER_PS1_PATH = "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_UNZIP}\${NGINX_STARTER_PS1}"
$NGINX_STARTER_EXEC_PATH = "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_UNZIP}\${NGINX_STARTER_EXEC}"
$NGINX_URL = "https://nginx.org/download/nginx-${NGINX_VERSION}.zip"

$NOTEPAD_STARTER_PS1 = "start-notepad.ps1"
$NOTEPAD_STARTER_EXEC = "start-notepad.bat"

$NOTEPAD_VERSION = "8.7.1"
$NOTEPAD_DIR = "Notepad"
$NOTEPAD_ZIP = "npp.$NOTEPAD_VERSION.portable.x64.zip"
$NOTEPAD_UNZIP = "npp.$NOTEPAD_VERSION.portable.x64"
$NOTEPAD_EXEC = "notepad++.exe"
$NOTEPAD_EXEC_PATH = "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_UNZIP}\${NOTEPAD_EXEC}"
$NOTEPAD_STARTER_PS1_PATH = "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_UNZIP}\${NOTEPAD_STARTER_PS1}"
$NOTEPAD_STARTER_EXEC_PATH = "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_UNZIP}\${NOTEPAD_STARTER_EXEC}"
$NOTEPAD_URL = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.portable.x64.zip"

function Show-InstallMenu {
    Clear-Host
    Write-Host "====================================================="
    Write-Host "            Welcome to the Signum Installer          "
    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] `tInstall Signum Mainnet with MariaDB"
    Write-Host "[2] `tInstall Signum Testnet with MariaDB"
	# Write-Host "[1] Install Signum Mainnet with PostgreSQL set different ports"
    # Write-Host "[2] Install Signum Testnet with PostgreSQL set different ports"
	# Write-Host "[1] Install Signum Mainnet with SQLite set different ports"
    # Write-Host "[2] Install Signum Testnet with SQLite set different ports"
    Write-Host "[3] `tInstall BTDEX"
    Write-Host "[4] `tInstall Phoenix"
	Write-Host "[5] `tInstall TurboPlotter"
	Write-Host "[6] `tInstall SignumPlotter"
    Write-Host "[7] `tInstall Signum Miner Mainnet"
    Write-Host "[8] `tInstall Signum Miner Testnet"
	# TODO add signum miner
	# TODO add signum pool
	# TODO add signum explorer
    Write-Host "[9] `tInstall MariaDB"
    Write-Host "[10] `tInstall HeidiSQL"
    Write-Host "[11] `tInstall NGINX"
	Write-Host "[12] `tInstall Notepad++"
	Write-Host "[13] `tDownload Whitepaper"
    Write-Host "-----------------------------------------------------"
	# TODO Signum pages menu
	# TODO add usefull signum pages wiki, official page, github stb. coinmarcetcap, bft portal, explorer
	# Developer menu SmartC SmartJ for smartcontracts
	# Signum provider menu
	# letsencrypt with ACME challege
	# open readme how to use the installer
    Write-Host "[14] `tSignum Starter Menu"
    Write-Host "[15] `tExit"
    Write-Host "====================================================="

	# Write-Host "PowerShell version: $($PSVersionTable.PSVersion)"
    $choice = Read-Host "Enter your choice (1-14)"

	function install-process($file, $name, $installFunction) {
		if (Test-Path $file) {
			Write-Host "${name} already installed."
			reinstall-prompt $name $installFunction
			Pause
			Show-InstallMenu
		} else {
			install-prompt $name $installFunction
			Pause
			Show-InstallMenu
		}
	}

    switch ($choice) {
        "1" {
			install-process $SIGNUM_MAINNET_STARTER_PS1_PATH "Signum Mainnet" {Install-SignumMainnet}
        }
        "2" {
			install-process $SIGNUM_TESTNET_STARTER_PS1_PATH "Signum Testnet" {Install-SignumTestnet}
        }
        "3" {
			install-process $BTDEX_EXEC_PATH "BTDEX" {install_btdex}
        }
        "4" {
			install-process $PHOENIX_EXEC_PATH "Phoenix" {install_phoenix}
        }
		"5" {
			install-process $TURBOPLOTTER_EXEC_PATH "TurboPlotter" {install_turboplotter}
        }
		"6" {
			install-process $SIGNUMPLOTTER_EXEC_PATH "SignumPlotter" {install_signumplotter}
        }
		"7" {
			install-process $SIGNUM_MINER_MAINNET_EXEC_PATH "Signum Miner Mainnet" {install_signumminer_mainnet}
        }
		"8" {
			install-process $SIGNUM_MINER_TESTNET_EXEC_PATH "Signum Miner Testnet" {install_signumminer_testnet}
        }
        "9" {
			install-process $MARIADB_STARTER_PS1_PATH "MariaDB" {install_mariadb}
        }
        "10" {
			install-process $HEIDISQL_EXEC_PATH "HeidiSQL" {install_heidisql}
        }
		"11" {
			install-process $NGINX_EXEC_PATH "NGINX" {install_nginx}
        }
		"12" {
			install-process $NOTEPAD_EXEC_PATH "Notepad" {install_notepad}
        }
		"13" {
			install-doc $WHITEPAPER_DOC_PATH "Whitepaper" $WHITEPAPER_DOC_PATH $WHITEPAPER_URL
        }
        "14" {
            Show-StartMenu
        }
        "15" {
            Exit-Script
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            Show-InstallMenu
        }
    }
}

function Show-StartMenu {
    Clear-Host
    Write-Host "====================================================="
    Write-Host "                 Start Signum Node                   "
    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] `tStart Signum Node Mainnet with MariaDB"
    Write-Host "[2] `tStart Signum Node Testnet with MariaDB"
    Write-Host "[3] `tStart BTDEX"
    Write-Host "[4] `tStart Phoenix"
	Write-Host "[5] `tStart TurboPlotter"
	Write-Host "[6] `tStart SignumPlotter"
	Write-Host "[7] `tStart Signum Miner Mainnet"
	Write-Host "[8] `tStart Signum Miner Testnet"
    Write-Host "[9] `tStart MariaDB"
    Write-Host "[10] `tStart HeidiSQL"
	Write-Host "[11] `tStart NGINX"
	Write-Host "[12] `tStart Notepad++"
	Write-Host "[13] `tOpen Whitepaper"
    Write-Host "-----------------------------------------------------"
    Write-Host "[14] `tSignum Installer Menu"
    Write-Host "[15] `tExit"
    Write-Host "====================================================="

    $choice = Read-Host "Enter your choice (1-14)"

	function start-process-menu($file, $name, $installFunction) {
		if (Test-Path $file) {
			Write-Host "Starting ${name} ..."
			# Start-Process -FilePath $file $command
			& $POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "$file"
			# Start-Process -FilePath $POWERSHELL_EXEC_PATH -ArgumentList "-ExecutionPolicy Bypass", "-File", $file
			Pause
			Show-StartMenu
		} else {
			Write-Host "${name} is not installed, please install first!"
			install-prompt $name $installFunction
			Pause
			Show-StartMenu
		}
	}

    switch ($choice) {
        "1" {
			start-process-menu $SIGNUM_MAINNET_STARTER_PS1_PATH "Signum Mainnet" {Install-SignumMainnet} 
        }
        "2" {
			start-process-menu $SIGNUM_TESTNET_STARTER_PS1_PATH "Signum Testnet" {Install-SignumTestnet}
        }
        "3" {
			start-process-menu $BTDEX_STARTER_PS1_PATH "BTDEX" {install_btdex}
		}
        "4" {
			start-process-menu $PHOENIX_STARTER_PS1_PATH "Phoenix" {install_phoenix}
        }
		"5" {
			start-process-menu $TURBOPLOTTER_STARTER_PS1_PATH "TurboPlotter" {install_turboplotter}
        }
		"6" {
			start-process-menu $SIGNUMPLOTTER_STARTER_PS1_PATH "SignumPlotter" {install_signumplotter}
        }
		"7" {
			start-process-menu $SIGNUM_MINER_MAINNET_STARTER_PS1_PATH "Signum Miner Mainnet" {install_signumminer_mainnet}
        }
		"8" {
			start-process-menu $SIGNUM_MINER_TESTNET_STARTER_PS1_PATH "Signum Miner Testnet" {install_signumminer_testnet}
        }
        "9" {
			start-process-menu $MARIADB_STARTER_PS1_PATH "MariaDB" {install_mariadb}
        }
        "10" {
			start-process-menu $HEIDISQL_STARTER_PS1_PATH "HeidiSQL" {install_heidisql}
        }
		"11" {
			start-process-menu $NGINX_STARTER_PS1_PATH "NGINX" {install_nginx}
        }
		"12" {
			start-process-menu $NOTEPAD_STARTER_PS1_PATH "Notepad" {install_notepad}
        }
		"13" {
            open-doc $WHITEPAPER_DOC_PATH "Whitepaper" $WHITEPAPER_DIR_PATH $WHITEPAPER_URL
		}
        "14" {
            Show-InstallMenu
        }
        "15" {
            Exit-Script
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            Show-StartMenu
        }
    }
}

function Exit-Script {
    Write-Host "Press any key to exit Signum Installer. Goodbye!"
    Pause
    Exit
}

function open-doc ($file, $name, $target_path, $url) {
	
	# Create mainnet/testnet directory
    if (-not (Test-Path -Path "${file}")) {
		Write-Host "$name is not downloaded."
		download-prompt $name $url $target_path $file
		Pause
		Show-StartMenu
    } else {
        Write-Host "Opening ${name}"
		Start-Process -FilePath "$file"
    }
	Pause
	Show-InstallMenu
	
}

function install-doc ($file, $name, $target_path, $url) {
	
	# Create mainnet/testnet directory
    if (-not (Test-Path -Path "${file}")) {
		download-prompt $name $url $target_path $file
    } else {
		Write-Host "${name} already downloaded."
		$userChoice = Read-Host "Do you want to Open ${name} (yes/no)"
		if ($userChoice -match '^(yes|y|Y)$') {
			Write-Host "Opening ${name}"
			Start-Process -FilePath "$file"
		} else {
			Write-Host "${name} download canceled."
		}
    }
	Pause
	Show-StartMenu
	
}

function Install-SignumMainnet {
    Write-Host "Installing Signum Mainnet ..."

    # Create mainnet/testnet directory
    if (-not (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_MAINNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}") {
        Write-Host "${SIGNUM_MAINNET_ZIP} already downloaded."
    } else {
        # Download the Signum mainnet zip file
        Write-Host "Downloading Signum from GitHub ..."
        Start-BitsTransfer -Source "${SIGNUM_MAINNET_URL}" -Destination "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}"

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}")) {
            Write-Host "Error: Failed to download Signum."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}") {
        Write-Host "${SIGNUM_MAINNET_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP} ..."
        Expand-Archive -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}" -DestinationPath "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}" -Force
    }

    # Copy node-default.properties to node.properties
    Write-Host "Copying ${MAINNET_DEFAULT_PROPERTIES} to ${MAINNET_PROPERTIES} ..."
    Copy-Item -Path "${MAINNET_DEFAULT_PROPERTIES}" -Destination "${MAINNET_PROPERTIES}"

    # Create starter ps1
    signum-starter-ps1 "Mainnet" ${SIGNUM_MAINNET_STARTER_PS1_PATH}
	
	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_STARTER_PS1} ${SIGNUM_STARTER_EXEC} ${SIGNUM_MAINNET_STARTER_EXEC_PATH}

    # Install MariaDB
    install_mariadb

    # Setup MariaDB for Mainnet
    setup_mariadb "Mainnet" "signum-mainnet"
	
	# Update database information in node.properties
	setup_db_node_properties ${MAINNET_PROPERTIES}

	# TODO Create start-signum-v8.2.0-mariadb-v10.20.0.bat in root to start specific versions
	# TODO start-signum-node.bat should be bat and start-mariadb.bat should be bat as well and OS spacific or ps1 + ps1 executer bat

    Write-Host "Signum Mainnet Installation complete."
    # Pause

    if (-not (Test-Path -Path "${SIGNUM_TESTNET_STARTER_PS1_PATH}")) {
        install-prompt "Signum Testnet" Install-SignumTestnet
    }
}

function Install-SignumTestnet {
    Write-Host "Installing Signum Testnet ..."

    # Create mainnet/testnet directory
    if (-not (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_TESTNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_TESTNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}") {
        Write-Host "${SIGNUM_TESTNET_ZIP} already downloaded."
    } else {
        # Download the Signum testnet zip file
        Write-Host "Downloading Signum from GitHub ..."
		# TODO try out Invoke-WebRequest or System.Net.Http.HttpClient
        Start-BitsTransfer -Source "${SIGNUM_TESTNET_URL}" -Destination "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}"

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}")) {
            Write-Host "Error: Failed to download Signum."
            Exit
        }
    }

    if (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}") {
        Write-Host "${SIGNUM_TESTNET_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP} ..."
        Expand-Archive -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}" -DestinationPath "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}" -Force
    }

    # Copy node-default.properties to node.properties
    Write-Host "Copying ${TESTNET_DEFAULT_PROPERTIES} to ${TESTNET_PROPERTIES} ..."
    Copy-Item -Path "${TESTNET_DEFAULT_PROPERTIES}" -Destination "${TESTNET_PROPERTIES}"

    # Update node.properties with new database information
    Write-Host "Updating ${TESTNET_PROPERTIES} with Testnet configurations ..."
    (Get-Content -Path $TESTNET_PROPERTIES) -replace '# node.network = signum.net.TestnetNetwork', 'node.network = signum.net.TestnetNetwork' | Set-Content -Path $TESTNET_PROPERTIES

    Write-Host "Update complete."

    # Install Signum Testnet starter batch
    signum-starter-ps1 "Testnet" $SIGNUM_TESTNET_STARTER_PS1_PATH
	
	# OS dependent start-signum
	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_STARTER_PS1} ${SIGNUM_STARTER_EXEC} ${SIGNUM_TESTNET_STARTER_EXEC_PATH}

    # Install MariaDB
    install_mariadb

    # Setup MariaDB for Testnet
    setup_mariadb "Testnet" "signum-testnet" $TESTNET_PROPERTIES
	
	# Update database information in node.properties
	setup_db_node_properties ${TESTNET_PROPERTIES}

    Write-Host "Signum Testnet Installation complete."
    # Pause

    if (-not (Test-Path -Path "${SIGNUM_MAINNET_STARTER_PS1_PATH}")) {
        install-prompt "Signum Mainnet" Install-SignumMainnet
    }
}

function signum-starter-ps1 ($name, $file){

    if (-not (Test-Path $file)) {
        # Create start-signum.ps1 file with the desired content
        $content = 
@"
# PowerShell script to start Signum Node
Set-Location -Path `$PSScriptRoot

# Start MariaDB
..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$MARIADB_STARTER_PS1_PATH" "-WindowStyle Minimized"
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-File", "..\..\..\$MARIADB_STARTER_PS1_PATH" -WindowStyle Minimized

Start-Sleep -Seconds 10

# Start Signum Node
# Start-Process -FilePath "jre\bin\java" -ArgumentList "-jar", "signum-node.jar" -WindowStyle Minimized
Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "jre\bin\java -jar signum-node.jar"

# TODO check
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\jre\bin\java -jar signum-node.jar -WindowStyle Minimized
# "jre\bin\java" "-jar" "signum-node.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "Set-Title 'Signum Mainnet Node'; Start-Process -NoNewWindow -FilePath 'jre\bin\java' -ArgumentList '-jar', 'signum-node.jar'"

exit
"@

        $content | Out-File -FilePath $file -Force

        Write-Host "${file} successfully created."
    } else {
        Write-Host "File already exists: ${file}"
    }
}

function create-starter-ps1-exec (${file-ps1}, ${file-exec}, ${file-exec-path}){

    if (-not (Test-Path ${file-exec-path})) {
        # Create start-signum batch file with the desired content
        $content = 
@"
cd %~dp0
..\..\..\${POWERSHELL_EXEC_PATH} -ExecutionPolicy Bypass -File ".\${file-ps1}"
"@
        $content | Out-File -FilePath ${file-exec-path} -Force

        Write-Host "${file-exec-path} successfully created."
    } else {
        Write-Host "File already exists: ${file-exec-path}"
    }
}

function install_heidisql {
    # Create HeidiSQL directory
    if (-not (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}")) {
        New-Item -ItemType Directory -Path "${TOOLS_DIR}\${HEIDISQL_DIR}" | Out-Null
        Write-Host "Created directory: ${HEIDISQL_DIR}"
    } else {
        Write-Host "Directory already exists: ${HEIDISQL_DIR}"
    }

    if (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}") {
        Write-Host "${HEIDISQL_ZIP} already downloaded."
    } else {
        # Download HeidiSQL
        Write-Host "Downloading HeidiSQL ..."
        Start-BitsTransfer -Source "${HEIDISQL_URL}" -Destination "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}"

        # Check if download was successful
        if (-not (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}")) {
            Write-Host "Error: Failed to download HeidiSQL."
            Pause
            return
        }
    }

    if (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_UNZIP}") {
        Write-Host "${HEIDISQL_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping HeidiSQL to $TOOLS_DIR\$HEIDISQL_DIR\$HEIDISQL_UNZIP ..."
        Expand-Archive -Path "$TOOLS_DIR\$HEIDISQL_DIR\$HEIDISQL_ZIP" -DestinationPath "$TOOLS_DIR\$HEIDISQL_DIR\$HEIDISQL_UNZIP" -Force
	}
		
	# Create starter ps1
	if (-not (Test-Path $HEIDISQL_STARTER_PS1_PATH)) {
		# Create start-signum.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start HeidiSQL
Set-Location -Path `$PSScriptRoot

# Start HeidiSQL
Start-Process -FilePath "$HEIDISQL_EXEC"

exit
"@

		$content | Out-File -FilePath $HEIDISQL_STARTER_PS1_PATH -Force

		Write-Host "${HEIDISQL_STARTER_PS1_PATH} successfully created."
	} else {
			Write-Host "File already exists: ${HEIDISQL_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${HEIDISQL_STARTER_PS1} ${HEIDISQL_STARTER_EXEC} ${HEIDISQL_STARTER_EXEC_PATH}

	Write-Host "HeidiSQL installed successfully."
		
}

function install_notepad {
    # Create NOTEPAD++ directory
    if (-not (Test-Path "${TOOLS_DIR}\${NOTEPAD_DIR}")) {
        New-Item -ItemType Directory -Path "${TOOLS_DIR}\${NOTEPAD_DIR}" | Out-Null
        Write-Host "Created directory: ${NOTEPAD_DIR}"
    } else {
        Write-Host "Directory already exists: ${NOTEPAD_DIR}"
    }

    if (Test-Path "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_ZIP}") {
        Write-Host "${NOTEPAD_ZIP} already downloaded."
    } else {
        # Download Notepad
        Write-Host "Downloading Notepad ..."
        Start-BitsTransfer -Source "${NOTEPAD_URL}" -Destination "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_ZIP}"

        # Check if download was successful
        if (-not (Test-Path "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_ZIP}")) {
            Write-Host "Error: Failed to download Notepad."
            Pause
            return
        }
    }

    if (Test-Path "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_UNZIP}") {
        Write-Host "${NOTEPAD_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Notepad to $TOOLS_DIR\$NOTEPAD_DIR\$NOTEPAD_UNZIP ..."
        Expand-Archive -Path "$TOOLS_DIR\$NOTEPAD_DIR\$NOTEPAD_ZIP" -DestinationPath "$TOOLS_DIR\$NOTEPAD_DIR\$NOTEPAD_UNZIP" -Force
    }
	
	# Create starter ps1
	if (-not (Test-Path $NOTEPAD_STARTER_PS1_PATH)) {
		# Create start-notepad.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start Notepad
Set-Location -Path `$PSScriptRoot

# Start Notepad
Start-Process -FilePath "$NOTEPAD_EXEC"

exit
"@

		$content | Out-File -FilePath $NOTEPAD_STARTER_PS1_PATH -Force

		Write-Host "${NOTEPAD_STARTER_PS1_PATH} successfully created."
	} else {
			Write-Host "File already exists: ${NOTEPAD_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${NOTEPAD_STARTER_PS1} ${NOTEPAD_STARTER_EXEC} ${NOTEPAD_STARTER_EXEC_PATH}

	Write-Host "Notepad installed successfully."
	
}

function install_nginx {
    # Create NGINX directory
    if (-not (Test-Path "${TOOLS_DIR}\${NGINX_DIR}")) {
        New-Item -ItemType Directory -Path "${TOOLS_DIR}\${NGINX_DIR}" | Out-Null
        Write-Host "Created directory: ${NGINX_DIR}"
    } else {
        Write-Host "Directory already exists: ${NGINX_DIR}"
    }

    if (Test-Path "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_ZIP}") {
        Write-Host "${NGINX_ZIP} already downloaded."
    } else {
        # Download NGINX
        Write-Host "Downloading NGINX ..."
        Start-BitsTransfer -Source "${NGINX_URL}" -Destination "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_ZIP}"

        # Check if download was successful
        if (-not (Test-Path "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_ZIP}")) {
            Write-Host "Error: Failed to download NGINX."
            Pause
            return
        }
    }

    if (Test-Path "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_UNZIP}") {
        Write-Host "${NGINX_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping NGINX to $TOOLS_DIR\$NGINX_DIR\$NGINX_UNZIP ..."
        Expand-Archive -Path "$TOOLS_DIR\$NGINX_DIR\$NGINX_ZIP" -DestinationPath "$TOOLS_DIR\$NGINX_DIR" -Force
    }
	
	# Create starter ps1
	if (-not (Test-Path $NGINX_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start NGINX
Set-Location -Path `$PSScriptRoot

# Start NGINX
Start-Process -FilePath "$NGINX_EXEC"

exit
"@

		$content | Out-File -FilePath $NGINX_STARTER_PS1_PATH -Force

		Write-Host "${NGINX_STARTER_PS1_PATH} successfully created."
	} else {
			Write-Host "File already exists: ${NGINX_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${NGINX_STARTER_PS1} ${NGINX_STARTER_EXEC} ${NGINX_STARTER_EXEC_PATH}

	Write-Host "NGINX installed successfully."
	
}

function install_signumminer_mainnet {
    # Create Signum Miner Mainnet directory
    if (-not (Test-Path "${SIGNUM_MINER_MAINNET_VERSION_DIR_PATH}")) {
        New-Item -ItemType Directory -Path "${SIGNUM_MINER_MAINNET_VERSION_DIR_PATH}" | Out-Null
        Write-Host "Created directory: ${SIGNUM_MINER_MAINNET_VERSION_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_MINER_MAINNET_VERSION_DIR_PATH}"
    }

    if (Test-Path $SIGNUM_MINER_MAINNET_EXEC_PATH) {
        Write-Host "${SIGNUM_MINER_MAINNET_EXEC} already installed."
    } else {
        Write-Host "Downloading Signum Miner Mainnet ..."
        Start-BitsTransfer -Source $SIGNUM_MINER_MAINNET_URL -Destination $SIGNUM_MINER_MAINNET_EXEC_PATH

        if (-not (Test-Path $SIGNUM_MINER_MAINNET_EXEC_PATH)) {
            Write-Host "Error: Failed to download Signum Miner Mainnet."
            Read-Host "Press Enter to continue"
            return
        }
	}
	
	if (Test-Path $SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\config.yaml) {
        Write-Host "Configuration file already downloaded."
    } else {
        Write-Host "Downloading Configuration file ..."
        Start-BitsTransfer -Source $SIGNUM_MINER_MAINNET_CONF_URL -Destination $SIGNUM_MINER_MAINNET_CONF_PATH

        if (-not (Test-Path $SIGNUM_MINER_MAINNET_CONF_PATH)) {
            Write-Host "Error: Failed to download Configuration file."
            Read-Host "Press Enter to continue"
            return
        }
		Write-Host "Configuration file downloaded ..."
	}
			
	# Create starter ps1
	if (-not (Test-Path $SIGNUM_MINER_MAINNET_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
	
@"
# PowerShell script to start Signum Miner Mainnet
Set-Location -Path `$PSScriptRoot

# Start PHOENIX
# Start-Process -FilePath "$SIGNUM_MINER_MAINNET_EXEC"
Start-Process -FilePath "..\..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-NoExit", "-Command", ".\$SIGNUM_MINER_MAINNET_EXEC"

exit
"@

		$content | Out-File -FilePath $SIGNUM_MINER_MAINNET_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_MINER_MAINNET_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_MINER_MAINNET_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_MINER_MAINNET_STARTER_PS1} ${SIGNUM_MINER_MAINNET_EXEC} ${SIGNUM_MINER_MAINNET_STARTER_EXEC_PATH}
		
    Write-Host "Signum Miner Mainnet installed successfully."
	
	setup_signumminer "$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\config.yaml" $SIGNUM_MINER_MAINNET_CONF_URL
	
}

function setup_signumminer($config_path, $config_url) {
	
	Clear-Host
    Write-Host "====================================================="
    Write-Host "                 Setup Signum Miner                   "
    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] `tEdit Configuration file"
    Write-Host "[2] `tSetup Miner Configuration"
	Write-Host "[3] `tRestore Configuration"
	Write-Host "====================================================="
	Write-Host "[4] `tExit Setup"
    Write-Host "====================================================="
	
	
    $choice = Read-Host "Enter your choice (1-4)"

    switch ($choice) {
        "1" {
			# Download notepad++
			# Open Configuration with notepad++
			install_notepad
			# Start-Process -FilePath "$NOTEPAD_EXEC_PATH"
			& $NOTEPAD_EXEC_PATH $config_path
			Return
        }
        "2" {
			# init configuration.yaml with commenting out lines
			# Load the content of the file
			$content = Get-Content -Path $config_path

			# Process each line using regex to add '#' only if there's no '#' before the target
			$content = $content | ForEach-Object {
				$_ -replace "^\s*10282355196851764065:", "# 10282355196851764065:" `
				   -replace "^\s*1796535821016683299:", "# 1796535821016683299:" `
				   -replace "^\s*- 'D:\\plot\\dir'", "# - 'D:\plot\dir'" `
				   -replace "^\s*- 'E:\\plot\\dir'", "# - 'E:\plot\dir'" `
				   -replace "^\s*- '/mnt/hd1/plot/dir'", "# - '/mnt/hd1/plot/dir'" `
				   -replace "^\s*url: 'https://pool.burstcoin.ro'", "#url: 'https://pool.burstcoin.ro'"
			}

			# Write the changes back to the file
			$content | Set-Content -Path $config_path
			
			Write-Host "Configuration initialized"	
			
			# add user inputs
			Write-Host "Please select an option:"
			# Would you like to [1] solo mine or [1] pool mine?
			Write-Host "[1] Setup Solo Miner"
			Write-Host "[2] Setup Pool Miner"
			
			$choice_mining = Read-Host "Enter your choice (1-2)"
			
			switch ($choice_mining) {
				"1" {
					Write-Host "Solo miner config"
					$choice_account_id = Read-Host "Enter Account Id"
					$choice_passphrase = Read-Host "Enter Passphrase"
					$choice_node_url = Read-Host "Enter Signum node url (default: http://localhost:8125)"
					if ($choice_node_url -eq "")
					{
						$choice_node_url = "http://localhost:8125"
					}
					if ($choice_account_id -ne "") {
						$lines = Get-Content -Path $config_path

						# Loop through each line and add a new line after the target line
						for ($i = 0; $i -lt $lines.Count; $i++) {
							if ($lines[$i] -match "^account_id_to_secret_phrase:") {
								# Insert a new empty line after the detected line
								$lines = $lines[0..$i] + "$choice_account_id`: $choice_passphrase" + $lines[($i + 1)..($lines.Count - 1)]
								break
							}
						}
						
						# Loop through each line and add a new line after the target line
						for ($i = 0; $i -lt $lines.Count; $i++) {
							if ($lines[$i] -match "url:") {
								# Insert a new empty line after the detected line
								$lines = $lines[0..$i] + "url`: $choice_node_url" + $lines[($i + 1)..($lines.Count - 1)]
								break
							}
						}
						
						$choice_plot_path = Read-Host "Enter Plot path (D:\plot\dir)"
						while ($choice_plot_path -ne "") {		
							# Loop through each line and add a new line after the target line
							for ($i = 0; $i -lt $lines.Count; $i++) {
								if ($lines[$i] -match "^plot_dirs:") {
									# Insert a new empty line after the detected line
									$lines = $lines[0..$i] + "  - '$choice_plot_path'" + $lines[($i + 1)..($lines.Count - 1)]
									break
								}
							}
							$choice_plot_path = Read-Host "Enter Plot path (empty path exit)"
						}
						
						# Write the modified lines back to the file
						$lines | Set-Content -Path $config_path
						Pause
						setup_signumminer $config_path $config_url
					}
				}
				"2" {
					Write-Host "Pool miner config"
					# Enter pool URL
					$choice_pool_url = Read-Host "Enter Signum pool url (default: https://opensignumpool.ddns.net:8129)"
					if ($choice_pool_url -eq "")
					{
						$choice_pool_url = "https://opensignumpool.ddns.net:8129"
					}
					
					$lines = Get-Content -Path $config_path
					# Loop through each line and add a new line after the target line
					for ($i = 0; $i -lt $lines.Count; $i++) {
						if ($lines[$i] -match "url:") {
							# Insert a new empty line after the detected line
							$lines = $lines[0..$i] + "url: $choice_pool_url" + $lines[($i + 1)..($lines.Count - 1)]
							break
						}
					}
					
					$choice_plot_path = Read-Host "Enter Plot path (empty path: exit)"
					while ($choice_plot_path -ne "") {
						# Loop through each line and add a new line after the target line
						for ($i = 0; $i -lt $lines.Count; $i++) {
							if ($lines[$i] -match "^plot_dirs:") {
								# Insert a new empty line after the detected line
								$lines = $lines[0..$i] + "  - '$choice_plot_path'" + $lines[($i + 1)..($lines.Count - 1)]
								break
							}
						}
						$choice_plot_path = Read-Host "Enter Plot path (empty path: exit)"
					}
					
					# Write the modified lines back to the file
					$lines | Set-Content -Path $config_path
					Pause
					setup_signumminer $config_path $config_url
				}
				default {
					Write-Host "Invalid choice! Please try again."
					Pause
					setup_signumminer $config_path $config_url
				}
			}
        }
		"3" {
			# Restore Configuration
			 Write-Host "Downloading Configuration file ..."
			Start-BitsTransfer -Source $config_url -Destination $config_path

			if (-not (Test-Path $config_path)) {
				Write-Host "Error: Failed to download Configuration file."
				Read-Host "Press Enter to continue"
				Pause
				setup_signumminer $config_path $config_url
				return
			}
			Write-Host "Configuration restored"
			Pause
            setup_signumminer $config_path $config_url
			Return
        }
		"4" {
			# Exit Setup
			Return
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            setup_signumminer $config_path $config_url
        }
    }
}

function install_signumminer_testnet {
    # Create Signum Miner Testnet directory
    if (-not (Test-Path "${SIGNUM_MINER_TESTNET_VERSION_DIR_PATH}")) {
        New-Item -ItemType Directory -Path "${SIGNUM_MINER_TESTNET_VERSION_DIR_PATH}" | Out-Null
        Write-Host "Created directory: ${SIGNUM_MINER_TESTNET_VERSION_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_MINER_TESTNET_VERSION_DIR_PATH}"
    }

    if (Test-Path $SIGNUM_MINER_TESTNET_EXEC_PATH) {
        Write-Host "${SIGNUM_MINER_TESTNET_EXEC} already installed."
    } else {
        Write-Host "Downloading Signum Miner Testnet ..."
        Start-BitsTransfer -Source $SIGNUM_MINER_TESTNET_URL -Destination $SIGNUM_MINER_TESTNET_EXEC_PATH

        if (-not (Test-Path $SIGNUM_MINER_TESTNET_EXEC_PATH)) {
            Write-Host "Error: Failed to download Signum Miner Testnet."
            Read-Host "Press Enter to continue"
            return
        }
	}
	
	if (Test-Path $SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\config.yaml) {
        Write-Host "Configuration file already downloaded."
    } else {
        Write-Host "Downloading Configuration file ..."
        Start-BitsTransfer -Source $SIGNUM_MINER_TESTNET_CONF_URL -Destination $SIGNUM_MINER_TESTNET_CONF_PATH

        if (-not (Test-Path $SIGNUM_MINER_TESTNET_CONF_PATH)) {
            Write-Host "Error: Failed to download Configuration file."
            Read-Host "Press Enter to continue"
            return
        }
		Write-Host "Configuration file downloaded ..."
	}
			
	# Create starter ps1
	if (-not (Test-Path $SIGNUM_MINER_TESTNET_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
	
@"
# PowerShell script to start Signum Miner Testnet
Set-Location -Path `$PSScriptRoot

# Start PHOENIX
# Start-Process -FilePath "$SIGNUM_MINER_TESTNET_EXEC"
Start-Process -FilePath "..\..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-NoExit", "-Command", ".\$SIGNUM_MINER_TESTNET_EXEC"

exit
"@

		$content | Out-File -FilePath $SIGNUM_MINER_TESTNET_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_MINER_TESTNET_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_MINER_TESTNET_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_MINER_TESTNET_STARTER_PS1} ${SIGNUM_MINER_TESTNET_EXEC} ${SIGNUM_MINER_TESTNET_STARTER_EXEC_PATH}
		
    Write-Host "Signum Miner Testnet installed successfully."
	
	setup_signumminer "$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\config.yaml" $SIGNUM_MINER_TESTNET_CONF_URL
	
}

function install_btdex {
    # Create btdex directory
    if (-not (Test-Path $BTDEX_DIR\$BTDEX_VERSION_DIR)) {
        New-Item -ItemType Directory -Path $BTDEX_DIR\$BTDEX_VERSION_DIR | Out-Null
        Write-Host "Created directory: ${BTDEX_DIR}\$BTDEX_VERSION_DIR"
    } else {
        Write-Host "Directory already exists: ${BTDEX_DIR}\$BTDEX_VERSION_DIR"
    }

    if (Test-Path $BTDEX_EXEC_PATH) {
        Write-Host "BTDEX already installed."
    } else {
        # Download BTDEX exe file
        Write-Host "Downloading BTDEX ..."
        Start-BitsTransfer -Source $BTDEX_URL -Destination $BTDEX_EXEC_PATH

        # Check if download was successful
        if (-not (Test-Path $BTDEX_EXEC_PATH)) {
            Write-Host "Error: Failed to download BTDEX."
            Pause
            return
        } 
	}
		
	# Create starter ps1
	if (-not (Test-Path $BTDEX_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start BTDEX
Set-Location -Path `$PSScriptRoot

# Start BTDEX
Start-Process -FilePath "$BTDEX_EXEC"

exit
"@

		$content | Out-File -FilePath $BTDEX_STARTER_PS1_PATH -Force

		Write-Host "${BTDEX_STARTER_PS1_PATH} successfully created."
	} else {
			Write-Host "File already exists: ${BTDEX_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${BTDEX_STARTER_PS1} ${BTDEX_STARTER_EXEC} ${BTDEX_STARTER_EXEC_PATH}
	
	Write-Host "BTDEX installed successfully."

}

function install_phoenix {
    if (-not (Test-Path $PHOENIX_DIR\$PHOENIX_VERSION_DIR)) {
        New-Item -ItemType Directory -Force -Path $PHOENIX_DIR\$PHOENIX_VERSION_DIR | Out-Null
        Write-Host "Created directory: ${PHOENIX_DIR}\$PHOENIX_VERSION_DIR"
    } else {
        Write-Host "Directory already exists: ${PHOENIX_DIR}\$PHOENIX_VERSION_DIR"
    }

    if (Test-Path $PHOENIX_EXEC_PATH) {
        Write-Host "${PHOENIX_EXEC} already installed."
    } else {
        Write-Host "Downloading Phoenix ..."
        Start-BitsTransfer -Source $PHOENIX_URL -Destination $PHOENIX_EXEC_PATH

        if (-not (Test-Path $PHOENIX_EXEC_PATH)) {
            Write-Host "Error: Failed to download Phoenix."
            Read-Host "Press Enter to continue"
            return
        }
	}
			
	# Create starter ps1
	if (-not (Test-Path $PHOENIX_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
	
@"
# PowerShell script to start PHOENIX
Set-Location -Path `$PSScriptRoot

# Start PHOENIX
Start-Process -FilePath "$PHOENIX_EXEC"

exit
"@

		$content | Out-File -FilePath $PHOENIX_STARTER_PS1_PATH -Force

		Write-Host "${PHOENIX_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${PHOENIX_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${PHOENIX_STARTER_PS1} ${PHOENIX_STARTER_EXEC} ${PHOENIX_STARTER_EXEC_PATH}
		
    Write-Host "Phoenix installed successfully."
        
}

function install_signumplotter {
    if (-not (Test-Path $SIGNUMPLOTTER_VERSION_DIR)) {
        New-Item -ItemType Directory -Force -Path $SIGNUMPLOTTER_VERSION_DIR | Out-Null
        Write-Host "Created directory: $SIGNUMPLOTTER_VERSION_DIR"
    } else {
        Write-Host "Directory already exists: $SIGNUMPLOTTER_VERSION_DIR"
    }

    if (Test-Path $SIGNUMPLOTTER_EXEC_PATH) {
        Write-Host "${SIGNUMPLOTTER_EXEC} already installed."
    } else {
        Write-Host "Downloading SignumPlotter ..."
        Start-BitsTransfer -Source $SIGNUMPLOTTER_URL -Destination $SIGNUMPLOTTER_EXEC_PATH

        if (-not (Test-Path $SIGNUMPLOTTER_EXEC_PATH)) {
            Write-Host "Error: Failed to download SignumPlotter."
            Read-Host "Press Enter to continue"
            return
        }
	}
			
	# Create starter ps1
	if (-not (Test-Path $SIGNUMPLOTTER_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
	
@"
# PowerShell script to start SignumPlotter
Set-Location -Path `$PSScriptRoot

# Start SignumPlotter
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-NoExit", "-Command", .\SIGNUMPLOTTER_EXEC"
# "..\..\..\${POWERSHELL_EXEC_PATH}" "$SIGNUMPLOTTER_EXEC"
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\$SIGNUMPLOTTER_EXEC

exit
"@

		$content | Out-File -FilePath $SIGNUMPLOTTER_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUMPLOTTER_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUMPLOTTER_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUMPLOTTER_STARTER_PS1} ${SIGNUMPLOTTER_STARTER_EXEC} ${SIGNUMPLOTTER_STARTER_EXEC_PATH}
		
    Write-Host "SignumPlotter installed successfully."
        
}

function install_turboplotter {
	
    if (-not (Test-Path $TURBOPLOTTER_VERSION_DIR_PATH)) {
        New-Item -ItemType Directory -Force -Path $TURBOPLOTTER_VERSION_DIR_PATH | Out-Null
        Write-Host "Created directory: $TURBOPLOTTER_VERSION_DIR_PATH"
    } else {
        Write-Host "Directory already exists: $TURBOPLOTTER_VERSION_DIR_PATH"
    }
	
	if (Test-Path -Path "${TURBOPLOTTER_VERSION_ZIP}") {
        Write-Host "${TURBOPLOTTER_VERSION_ZIP} already downloaded."
    } else {
        # Download the TurboPlotter testnet zip file
        Write-Host "Downloading TurboPlotter ..."
		# TODO try out Invoke-WebRequest or System.Net.Http.HttpClient
        Start-BitsTransfer -Source "${TURBOPLOTTER_URL}" -Destination "${TURBOPLOTTER_VERSION_ZIP}"

        # Check if download was successful
        if (-not (Test-Path -Path "${TURBOPLOTTER_VERSION_ZIP}")) {
            Write-Host "Error: Failed to download TurboPlotter."
            Exit
        }
    }

    if (Test-Path -Path "${TURBOPLOTTER_VERSION_UNZIP}") {
        Write-Host "${TURBOPLOTTER_VERSION_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping TurboPlotter to ${TURBOPLOTTER_VERSION_UNZIP} ..."
        Expand-Archive -Path "${TURBOPLOTTER_VERSION_ZIP}" -DestinationPath "${TURBOPLOTTER_VERSION_UNZIP}" -Force
    }
			
	# Create starter ps1
	if (-not (Test-Path $TURBOPLOTTER_STARTER_PS1_PATH)) {
		# Create start-nginx.ps1 file with the desired content
		$content = 
	
@"
# PowerShell script to start TurboPlotter
Set-Location -Path `$PSScriptRoot

# Start TurboPlotter
Start-Process -FilePath "$TURBOPLOTTER_EXEC"

exit
"@

		$content | Out-File -FilePath $TURBOPLOTTER_STARTER_PS1_PATH -Force

		Write-Host "${TURBOPLOTTER_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${TURBOPLOTTER_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${TURBOPLOTTER_STARTER_PS1} ${TURBOPLOTTER_STARTER_EXEC} ${TURBOPLOTTER_STARTER_EXEC_PATH}
		
    Write-Host "TurboPlotter installed successfully."
        
}

function install_mariadb {
    install_heidisql

    if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
        return
    }

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}")) {
        New-Item -ItemType Directory -Force -Path "${DATABASE_DIR}\${MARIADB_DIR}" | Out-Null
    } else {
        Write-Host "Directory already exists: ${DATABASE_DIR}\${MARIADB_DIR}"
    }

    if (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}") {
        Write-Host "${MARIADB_ZIP} already downloaded."
    } else {
        Write-Host "Downloading MariaDB version ${MARIADB_VERSION} ..."
        Start-BitsTransfer -Source $MARIADB_URL -Destination "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}"

        if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}")) {
            Write-Host "Error: Failed to download MariaDB version ${MARIADB_VERSION}."
            Read-Host "Press Enter to continue"
            return
        }
    }

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}")) {
        Write-Host "Unzipping MariaDB to ${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP} ..."
        Expand-Archive -Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}" -DestinationPath "${DATABASE_DIR}\${MARIADB_DIR}" -Force
    }

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\data")) {
        New-Item -ItemType Directory -Force -Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\data" | Out-Null
        Write-Host "Initializing MariaDB data directory ..."
        & "${MARIADB_BIN}\${MARIADB_INSTALL_EXEC}"
    } else {
        Write-Host "MariaDB data directory already initialized."
    }

    if (-not (Test-Path $MARIADB_STARTER_PS1_PATH)) {
        $content = 
@"
# PowerShell script to start MariaDB
Set-Location -Path `$PSScriptRoot
# TODO find out how to run mariadb 1 within a powershell window, or 2 without powershell within mariadb own terminal window. Use the chosen soluton for 
# mariadb setup as well currently mariadb within powershell is used in mariadb setup
# 1:
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" "-Command", ".\bin\${MARIADBD_EXEC} --no-defaults --console"
# 2: If I can set powershell window title it is ok as well
# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized

# & .\bin\${MARIADBD_EXEC} --no-defaults --console
exit
"@
        $content | Out-File -FilePath $MARIADB_STARTER_PS1_PATH -Force
        Write-Host "${MARIADB_STARTER_PS1_PATH} successfully created."
    } else {
        Write-Host "File already exists: ${MARIADB_STARTER_PS1_PATH}"
    }
	
	# Create OS specific starter
	create-starter-ps1-exec ${MARIADB_STARTER_PS1} ${MARIADB_STARTER_EXEC} ${MARIADB_STARTER_EXEC_PATH}
	
	Write-Host "MariaDB installed successfully."
}

function setup_mariadb ($name, $database) {
	
	$DATABASE_NAME = ""
	$DATABASE_USERNAME = ""
	$DATABASE_PASSWORD = ""
	
    $DATABASE_NAME = Read-Host "Enter Signum ${name} database name (or press Enter for default ${database})"
    if (-not $DATABASE_NAME) { $DATABASE_NAME = $database }
    Write-Host "Database name: ${database}"

    $DATABASE_USERNAME = Read-Host "Enter the username (or press Enter for default 'signumuser')"
    if (-not $DATABASE_USERNAME) { $DATABASE_USERNAME = "signumuser" }
    Write-Host "Username: ${DATABASE_USERNAME}"

    $DATABASE_PASSWORD = Read-Host "Enter the password (or press Enter for default 'signumpassword')"
    if (-not $DATABASE_PASSWORD) { $DATABASE_PASSWORD = "signumpassword" }
    Write-Host "Password: ${DATABASE_PASSWORD}"

    Write-Host "Starting MariaDB server ..."
    Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized

    Start-Sleep -Seconds 10

    Write-Host "Creating database: ${DATABASE_NAME}"
	$createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS ``${DATABASE_NAME}``;"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $createDatabaseQuery

    Write-Host "Creating user: ${DATABASE_USERNAME}"
	$createUserQuery = "CREATE USER IF NOT EXISTS '${DATABASE_USERNAME}'@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $createUserQuery

    Write-Host "Granting permissions to user ${DATABASE_USERNAME} on database ${DATABASE_NAME} ..."
	$grantPermissionsQuery = "GRANT ALL PRIVILEGES ON ``${DATABASE_NAME}``.* TO '${DATABASE_USERNAME}'@'localhost';"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $grantPermissionsQuery
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e "FLUSH PRIVILEGES;"

	$global:DATABASE_NAME = $DATABASE_NAME
	$global:DATABASE_USERNAME = $DATABASE_USERNAME
	$global:DATABASE_PASSWORD = $DATABASE_PASSWORD

    Write-Host "MariaDB setup complete."
}

function setup_db_node_properties($file) {
	
	Write-Host "Updating node.properties with new database configurations ..."
    (Get-Content -Path $file) -replace '# DB.Url=jdbc:mariadb:.*', "DB.Url=jdbc:mariadb://localhost:3306/${DATABASE_NAME}" `
        -replace '# DB.Username=.*', "DB.Username=${DATABASE_USERNAME}" `
        -replace '# DB.Password=.*', "DB.Password=${DATABASE_PASSWORD}" | Set-Content -Path $file

    Write-Host "Update complete."
	
}

function install-prompt($name, $installFunction) {
    $userChoice = Read-Host "Do you want to install ${name} (yes/no)"
    if ($userChoice -match '^(yes|y|Y)$') {
        &$installFunction
    } else {
        Write-Host "${name} Installation canceled."
    }
}

function download-prompt($name, $url, $target_path, $file) {
    $userChoice = Read-Host "Do you want to download ${name} (yes/no)"
    if ($userChoice -match '^(yes|y|Y)$') {
		if (-not (Test-Path "${target_path}")) {
			New-Item -Path "${target_path}" -ItemType Directory | Out-Null
		}
		Write-Host "Downloading ${name} ..."
		Start-BitsTransfer -Source $url -Destination $file
		Write-Host "${name} downloaded successfully."
		# Invoke-WebRequest -Uri $url -OutFile $file
		# Invoke-RestMethod -Uri $url -OutFile $file
    } else {
        Write-Host "${name} download canceled."
    }
}

function reinstall-prompt($name, $installFunction) {
    $userChoice = Read-Host "Do you want to reinstall ${name} (yes/no)"
    if ($userChoice -match '^(yes|y|Y)$') {
        &$installFunction
    } else {
        Write-Host "${name} Installation canceled."
    }
}

# TODO Every installer folder has the OS specific batch file creation which call the PowerShell 

# TODO download whitepaper if not exist
# TODO make every directory and file exist check a function
# TODO add plotter
# TOTO add miner
# TODO setup menu mariadb setup signum node setup e.g.

# Initialize the script by showing the install menu
# Pause
Show-InstallMenu
