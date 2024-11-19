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
# TODO rename: $SIGNUM_MAINNET_VERSION -> $SIGNUM_MAINNET_NODE_VERSION

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
$BTDEX_VERSION_DIR = "$BTDEX_DIR-$BTDEX_VERSION"
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

function Show-InstallMenu {
    Clear-Host
    Write-Host "====================================================="
    Write-Host "            Welcome to the Signum Installer          "
    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] Install Signum Mainnet with MariaDB"
    Write-Host "[2] Install Signum Testnet with MariaDB"
    Write-Host "[3] Install BTDEX"
    Write-Host "[4] Install Phoenix"
    Write-Host "[5] Install MariaDB"
    Write-Host "[6] Install HeidiSQL"
    Write-Host "[7] Install NGINX"
    Write-Host "-----------------------------------------------------"
    Write-Host "[8] Signum Starter Menu"
    Write-Host "[9] Exit"
    Write-Host "====================================================="

	# Write-Host "PowerShell version: $($PSVersionTable.PSVersion)"
    $choice = Read-Host "Enter your choice (1-9)"

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
			install-process $MARIADB_STARTER_PS1_PATH "MariaDB" {install_mariadb}
        }
        "6" {
			install-process $HEIDISQL_EXEC_PATH "HeidiSQL" {install_heidisql}
        }
		"7" {
			install-process $NGINX_EXEC_PATH "NGINX" {install_nginx}
        }
        "8" {
            Show-StartMenu
        }
        "9" {
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
    Write-Host "[1] Start Signum Node Mainnet with MariaDB"
    Write-Host "[2] Start Signum Node Testnet with MariaDB"
    Write-Host "[3] Start BTDEX"
    Write-Host "[4] Start Phoenix"
    Write-Host "[5] Start MariaDB"
    Write-Host "[6] Start HeidiSQL"
	Write-Host "[7] Start NGINX"
    Write-Host "-----------------------------------------------------"
    Write-Host "[8] Signum Installer Menu"
    Write-Host "[9] Exit"
    Write-Host "====================================================="

    $choice = Read-Host "Enter your choice (1-9)"

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
			start-process-menu $MARIADB_STARTER_PS1_PATH "MariaDB" {install_mariadb}
        }
        "6" {
			start-process-menu $HEIDISQL_STARTER_PS1_PATH "HeidiSQL" {install_heidisql}
        }
		"7" {
			start-process-menu $NGINX_STARTER_PS1_PATH "NGINX" {install_nginx}
        }
        "8" {
            Show-InstallMenu
        }
        "9" {
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

Start-Sleep -Seconds 10

# Start Signum Node
Start-Process -FilePath "jre\bin\java" -ArgumentList "-jar", "signum-node.jar" -WindowStyle Minimized
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
Start-Process -FilePath "..\..\..\$PHOENIX_EXEC_PATH"

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
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-Command", ".\bin\${MARIADB_EXEC} --no-defaults --console"
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
Show-InstallMenu
