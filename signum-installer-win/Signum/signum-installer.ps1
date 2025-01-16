# Change directory to the script's location
Set-Location $PSScriptRoot
$host.UI.RawUI.WindowTitle = "Signum Installer"

# global variables
$global:UserResponse = $null

$global:DATABASE_NAME = $null
$global:DATABASE_USERNAME = $null
$global:DATABASE_PASSWORD = $null

$SLEEP_SECONDS = 20

$POWERSHELL_VERSION = "7.4.6"
$POWERSHELL_DIR = "PowerShell"
$POWERSHELL_UNZIP = "PowerShell-${POWERSHELL_VERSION}-win-x64"
$POWERSHELL_ZIP = "${POWERSHELL_UNZIP}.zip"
$POWERSHELL_UNZIP = "PowerShell-${POWERSHELL_VERSION}-win-x64"
$POWERSHELL_EXEC = "pwsh.exe"
$POWERSHELL_EXEC_PATH = "${POWERSHELL_DIR}\${POWERSHELL_UNZIP}\${POWERSHELL_EXEC}"
$POWERSHELL_URL = "https://github.com/PowerShell/PowerShell/releases/download/v${POWERSHELL_VERSION}/PowerShell-${POWERSHELL_VERSION}-win-x64.zip"

# TODO rename: $SIGNUM_NODE_MAINNET_VERSION -> $SIGNUM_NODE_MAINNET_VERSION?
# TODO very important to stop all processes before stop mariadb or run mariadb in the background to solve
# TODO mention or notify recommended menu items
# TODO download explorer https://github.com/signum-network/signum-explorer/archive/refs/heads/master.zip
# TODO download python https://www.python.org/ftp/python/3.13.1/python-3.13.1-embed-amd64.zip not full
# TODO download full pytjon pakage https://www.python.org/ftp/python/3.13.1/Python-3.13.1.tar.xz not ok

# TODO try to use portable wls
# Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
# If the download is taking a long time, turn off the progress bar by setting $ProgressPreference = 'SilentlyContinue'
# TODO unzip python-3.13.1-embed-amd64.zip
# TODO unzip python-3.13.1-embed-amd64/python313.zip

# Run mariadb in the background to not shut down it unintentianally

# TODO DBEAVER install to tools?
# https://dbeaver.io/files/dbeaver-ce-latest-win32.win32.x86_64.zip
# https://dbeaver.io/download/

$SIGNUM_NODE_DIR = "Node"

$SIGNUM_NODE_STARTER_PS1 = "start-node.ps1"
$SIGNUM_NODE_STARTER_EXEC = "start-node.bat"

$SIGNUM_NODE_MAINNET_VERSION = "v3.8.4"
$SIGNUM_NODE_MAINNET_DIR = "Mainnet"
$SIGNUM_NODE_MAINNET_DIR_PATH = "${SIGNUM_NODE_MAINNET_DIR}\${SIGNUM_NODE_DIR}"
$SIGNUM_NODE_MAINNET_ZIP = "signum-node-${SIGNUM_NODE_MAINNET_VERSION}-win_x64.zip"
$SIGNUM_NODE_MAINNET_UNZIP = "signum-node-${SIGNUM_NODE_MAINNET_VERSION}-win_x64"
$SIGNUM_NODE_MAINNET_UNZIP_PATH = "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}"
$SIGNUM_NODE_MAINNET_STARTER_PS1_PATH = "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}\${SIGNUM_NODE_STARTER_PS1}"
$SIGNUM_NODE_MAINNET_STARTER_EXEC_PATH = "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}\${SIGNUM_NODE_STARTER_EXEC}"
$SIGNUM_NODE_MAINNET_URL = "https://github.com/signum-network/signum-node/releases/download/${SIGNUM_NODE_MAINNET_VERSION}/${SIGNUM_NODE_MAINNET_ZIP}"

$SIGNUM_NODE_TESTNET_VERSION = "v3.8.4"
$SIGNUM_NODE_TESTNET_DIR = "Testnet"
$SIGNUM_NODE_TESTNET_DIR_PATH = "${SIGNUM_NODE_TESTNET_DIR}\${SIGNUM_NODE_DIR}"
$SIGNUM_NODE_TESTNET_ZIP = "signum-node-${SIGNUM_NODE_TESTNET_VERSION}-win_x64.zip"
$SIGNUM_NODE_TESTNET_UNZIP = "signum-node-${SIGNUM_NODE_TESTNET_VERSION}-win_x64"
$SIGNUM_NODE_TESTNET_UNZIP_PATH = "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}"
$SIGNUM_NODE_TESTNET_STARTER_PS1_PATH = "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}\${SIGNUM_NODE_STARTER_PS1}"
$SIGNUM_NODE_TESTNET_STARTER_EXEC_PATH = "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}\${SIGNUM_NODE_STARTER_EXEC}"
$SIGNUM_NODE_TESTNET_URL = "https://github.com/signum-network/signum-node/releases/download/${SIGNUM_NODE_TESTNET_VERSION}/${SIGNUM_NODE_TESTNET_ZIP}"

$SIGNUM_NODE_MAINNET_DEFAULT_PROPERTIES_PATH = ".\${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}\conf\node-default.properties"
$SIGNUM_NODE_MAINNET_PROPERTIES_PATH = ".\${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}\conf\node.properties"

$SIGNUM_NODE_TESTNET_DEFAULT_PROPERTIES_PATH = ".\${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}\conf\node-default.properties"
$SIGNUM_NODE_TESTNET_PROPERTIES_PATH = ".\${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}\conf\node.properties"

# TODO add NeoClassic to nodes https://github.com/deleterium/neoclassic-wallet
# TODO add link to html/ui/index.html

$SIGNUM_WALLET_NEOCLASSIC_ZIP = "neoclassic.zip"
$SIGNUM_WALLET_NEOCLASSIC_DIR = "neoclassic"

$SIGNUM_WALLET_MAINNET_NEOCLASSIC_VERSION = "1.0.0"
$SIGNUM_WALLET_MAINNET_UI_DIR_PATH = "${SIGNUM_NODE_MAINNET_UNZIP_PATH}\html\ui"
$SIGNUM_WALLET_MAINNET_NEOCLASSIC_ZIP_PATH = "${SIGNUM_WALLET_MAINNET_UI_DIR_PATH}\${SIGNUM_WALLET_NEOCLASSIC_ZIP}"
$SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH = "${SIGNUM_WALLET_MAINNET_UI_DIR_PATH}\${SIGNUM_WALLET_NEOCLASSIC_DIR}"
$SIGNUM_WALLET_MAINNET_NEOCLASSIC_URL = "https://github.com/deleterium/neoclassic-wallet/releases/download/v${SIGNUM_WALLET_MAINNET_NEOCLASSIC_VERSION}/neoclassic-wallet-${SIGNUM_WALLET_MAINNET_NEOCLASSIC_VERSION}.zip"

$SIGNUM_WALLET_TESTNET_NEOCLASSIC_VERSION = "1.0.0"
$SIGNUM_WALLET_TESTNET_UI_DIR_PATH = "${SIGNUM_NODE_TESTNET_UNZIP_PATH}\html\ui"
$SIGNUM_WALLET_TESTNET_NEOCLASSIC_ZIP_PATH = "${SIGNUM_WALLET_TESTNET_UI_DIR_PATH}\${SIGNUM_WALLET_NEOCLASSIC_ZIP}"
$SIGNUM_WALLET_TESTNET_NEOCLASSIC_UNZIP_PATH = "${SIGNUM_WALLET_TESTNET_UI_DIR_PATH}\${SIGNUM_WALLET_NEOCLASSIC_DIR}"
$SIGNUM_WALLET_TESTNET_NEOCLASSIC_URL = "https://github.com/deleterium/neoclassic-wallet/releases/download/v${SIGNUM_WALLET_MAINNET_NEOCLASSIC_VERSION}/neoclassic-wallet-${SIGNUM_WALLET_TESTNET_NEOCLASSIC_VERSION}.zip"

$SIGNUM_POOL_STARTER_PS1 = "start-pool.ps1"
$SIGNUM_POOL_STARTER_EXEC = "start-pool.bat"
$SIGNUM_POOL_PROPERTIES = "pool.properties"
$SIGNUM_POOL_PROPERTIES_ORIGINAL = "pool-original.properties"

$SIGNUM_POOL_MAINNET_VERSION = "v2.2.1"
$SIGNUM_POOL_MAINNET_DIR = "Pool"
$SIGNUM_POOL_MAINNET_DIR_PATH = "${SIGNUM_NODE_MAINNET_DIR}\${SIGNUM_POOL_MAINNET_DIR}"
$SIGNUM_POOL_MAINNET_UNZIP = "signum-pool-${SIGNUM_POOL_MAINNET_VERSION}"
$SIGNUM_POOL_MAINNET_ZIP = "${SIGNUM_POOL_MAINNET_UNZIP}.zip"
$SIGNUM_POOL_MAINNET_ZIP_PATH = "${SIGNUM_POOL_MAINNET_DIR_PATH}\${SIGNUM_POOL_MAINNET_ZIP}"
$SIGNUM_POOL_MAINNET_UNZIP_PATH = "${SIGNUM_POOL_MAINNET_DIR_PATH}\${SIGNUM_POOL_MAINNET_UNZIP}"
$SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_PATH = "$SIGNUM_POOL_MAINNET_UNZIP_PATH\$SIGNUM_POOL_PROPERTIES"
$SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_ORIGINAL_PATH = "$SIGNUM_POOL_MAINNET_UNZIP_PATH\$SIGNUM_POOL_PROPERTIES_ORIGINAL"
$SIGNUM_POOL_MAINNET_STARTER_PS1_PATH = "$SIGNUM_POOL_MAINNET_UNZIP_PATH\${SIGNUM_POOL_STARTER_PS1}"
$SIGNUM_POOL_MAINNET_STARTER_EXEC_PATH = "$SIGNUM_POOL_MAINNET_UNZIP_PATH\${SIGNUM_POOL_STARTER_EXEC}"
$SIGNUM_POOL_MAINNET_URL = "https://github.com/signum-network/signum-pool/releases/download/${SIGNUM_POOL_MAINNET_VERSION}/${SIGNUM_POOL_MAINNET_ZIP}"

$SIGNUM_POOL_TESTNET_VERSION = "v2.2.1"
$SIGNUM_POOL_TESTNET_DIR = "Pool"
$SIGNUM_POOL_TESTNET_DIR_PATH = "${SIGNUM_NODE_TESTNET_DIR}\${SIGNUM_POOL_TESTNET_DIR}"
$SIGNUM_POOL_TESTNET_UNZIP = "signum-pool-${SIGNUM_POOL_TESTNET_VERSION}"
$SIGNUM_POOL_TESTNET_ZIP = "${SIGNUM_POOL_TESTNET_UNZIP}.zip"
$SIGNUM_POOL_TESTNET_ZIP_PATH = "${SIGNUM_POOL_TESTNET_DIR_PATH}\${SIGNUM_POOL_TESTNET_ZIP}"
$SIGNUM_POOL_TESTNET_UNZIP_PATH = "${SIGNUM_POOL_TESTNET_DIR_PATH}\${SIGNUM_POOL_TESTNET_UNZIP}"
$SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_PATH = "$SIGNUM_POOL_TESTNET_UNZIP_PATH\$SIGNUM_POOL_PROPERTIES"
$SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_ORIGINAL_PATH = "$SIGNUM_POOL_TESTNET_UNZIP_PATH\$SIGNUM_POOL_PROPERTIES_ORIGINAL"
$SIGNUM_POOL_TESTNET_STARTER_PS1_PATH = "$SIGNUM_POOL_TESTNET_UNZIP_PATH\${SIGNUM_POOL_STARTER_PS1}"
$SIGNUM_POOL_TESTNET_STARTER_EXEC_PATH = "$SIGNUM_POOL_TESTNET_UNZIP_PATH\${SIGNUM_POOL_STARTER_EXEC}"
$SIGNUM_POOL_TESTNET_URL = "https://github.com/signum-network/signum-pool/releases/download/${SIGNUM_POOL_TESTNET_VERSION}/${SIGNUM_POOL_TESTNET_ZIP}"

$SIGNUM_EXPLORER_STARTER_PS1 = "start-explorer.ps1"
$SIGNUM_EXPLORER_STARTER_EXEC = "start-explorer.bat"

$SIGNUM_EXPLORER_MAINNET_DIR = "Explorer"
$SIGNUM_EXPLORER_MAINNET_DIR_PATH = "${SIGNUM_NODE_MAINNET_DIR}\${SIGNUM_EXPLORER_MAINNET_DIR}"
$SIGNUM_EXPLORER_MAINNET_UNZIP = "signum-explorer-master"
$SIGNUM_EXPLORER_MAINNET_ZIP = "${SIGNUM_EXPLORER_MAINNET_UNZIP}.zip"
$SIGNUM_EXPLORER_MAINNET_ZIP_PATH = "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}\${SIGNUM_EXPLORER_MAINNET_ZIP}"
$SIGNUM_EXPLORER_MAINNET_UNZIP_PATH = "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}\${SIGNUM_EXPLORER_MAINNET_UNZIP}"

$SIGNUM_EXPLORER_MAINNET_PYTHON_VERSION = "3.10.11"
$SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP = "python-${SIGNUM_EXPLORER_MAINNET_PYTHON_VERSION}-embed-amd64}.zip"
$SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH = "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}\${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP}"
$SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH = "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}\${SIGNUM_EXPLORER_MAINNET_UNZIP}"
# $SIGNUM_EXPLORER_MAINNET_GUNICORN_PATH = "$SIGNUM_POOL_MAINNET_UNZIP_PATH\gunicorn.conf.py"
$SIGNUM_EXPLORER_MAINNET_STARTER_PS1_PATH = "$SIGNUM_EXPLORER_MAINNET_UNZIP_PATH\${SIGNUM_EXPLORER_STARTER_PS1}"
$SIGNUM_EXPLORER_MAINNET_STARTER_EXEC_PATH = "$SIGNUM_EXPLORER_MAINNET_UNZIP_PATH\${SIGNUM_EXPLORER_STARTER_EXEC}"
$SIGNUM_EXPLORER_MAINNET_URL = "https://github.com/signum-network/signum-explorer/archive/refs/heads/master.zip"
$SIGNUM_EXPLORER_MAINNET_PYTHON_URL = "https://www.python.org/ftp/python/${SIGNUM_EXPLORER_MAINNET_PYTHON_VERSION}/python-${SIGNUM_EXPLORER_MAINNET_PYTHON_VERSION}-embed-amd64.zip"
$SIGNUM_EXPLORER_MAINNET_PYTHON_GETPIP_URL = "https://bootstrap.pypa.io/get-pip.py"

$SIGNUM_EXPLORER_TESTNET_DIR = "Explorer"
$SIGNUM_EXPLORER_TESTNET_DIR_PATH = "${SIGNUM_NODE_TESTNET_DIR}\${SIGNUM_EXPLORER_TESTNET_DIR}"
$SIGNUM_EXPLORER_TESTNET_UNZIP = "signum-explorer-master"
$SIGNUM_EXPLORER_TESTNET_ZIP = "${SIGNUM_EXPLORER_TESTNET_UNZIP}.zip"
$SIGNUM_EXPLORER_TESTNET_ZIP_PATH = "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}\${SIGNUM_EXPLORER_TESTNET_ZIP}"
$SIGNUM_EXPLORER_TESTNET_UNZIP_PATH = "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}\${SIGNUM_EXPLORER_TESTNET_UNZIP}"

$SIGNUM_EXPLORER_TESTNET_PYTHON_VERSION = "3.10.11"
$SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP = "python-${SIGNUM_EXPLORER_TESTNET_PYTHON_VERSION}-embed-amd64}.zip"
$SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH = "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}\${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP}"
$SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH = "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}\${SIGNUM_EXPLORER_TESTNET_UNZIP}"
# $SIGNUM_EXPLORER_TESTNET_GUNICORN_PATH = "$SIGNUM_POOL_TESTNET_UNZIP_PATH\gunicorn.conf.py"
$SIGNUM_EXPLORER_TESTNET_STARTER_PS1_PATH = "$SIGNUM_EXPLORER_TESTNET_UNZIP_PATH\${SIGNUM_EXPLORER_STARTER_PS1}"
$SIGNUM_EXPLORER_TESTNET_STARTER_EXEC_PATH = "$SIGNUM_EXPLORER_TESTNET_UNZIP_PATH\${SIGNUM_EXPLORER_STARTER_EXEC}"
$SIGNUM_EXPLORER_TESTNET_URL = "https://github.com/signum-network/signum-explorer/archive/refs/heads/master.zip"
$SIGNUM_EXPLORER_TESTNET_PYTHON_URL = "https://www.python.org/ftp/python/${SIGNUM_EXPLORER_TESTNET_PYTHON_VERSION}/python-${SIGNUM_EXPLORER_TESTNET_PYTHON_VERSION}-embed-amd64.zip"
$SIGNUM_EXPLORER_TESTNET_PYTHON_GETPIP_URL = "https://bootstrap.pypa.io/get-pip.py"

$JAVA_POOL_MAINNET_DIR = "jre"
$JAVA_POOL_MAINNET_BIN = "jre\bin\java"
$JAVA_POOL_MAINNET_UNZIP = "zulu11.56.19-ca-fx-jre11.0.15-win_x64"
$JAVA_POOL_MAINNET_ZIP = "$JAVA_POOL_MAINNET_UNZIP.zip"
$JAVA_POOL_MAINNET_DIR_PATH = "$SIGNUM_POOL_MAINNET_UNZIP_PATH\$JAVA_POOL_MAINNET_DIR"
$JAVA_POOL_MAINNET_BIN_PATH = "$JAVA_POOL_MAINNET_DIR_PATH\bin\java"
$JAVA_POOL_MAINNET_ZIP_PATH = "${JAVA_POOL_MAINNET_DIR_PATH}\${JAVA_POOL_MAINNET_ZIP}"
$JAVA_POOL_MAINNET_UNZIP_PATH = "${JAVA_POOL_MAINNET_DIR_PATH}\${JAVA_POOL_MAINNET_UNZIP}"
$JAVA_POOL_MAINNET_URL = "https://cdn.azul.com/zulu/bin/$JAVA_POOL_MAINNET_ZIP"

$JAVA_POOL_TESTNET_DIR = "jre"
$JAVA_POOL_TESTNET_BIN = "jre\bin\java"
$JAVA_POOL_TESTNET_UNZIP = "zulu11.56.19-ca-fx-jre11.0.15-win_x64"
$JAVA_POOL_TESTNET_ZIP = "$JAVA_POOL_TESTNET_UNZIP.zip"
$JAVA_POOL_TESTNET_DIR_PATH = "$SIGNUM_POOL_TESTNET_UNZIP_PATH\$JAVA_POOL_TESTNET_DIR"
$JAVA_POOL_TESTNET_BIN_PATH = "$JAVA_POOL_TESTNET_DIR_PATH\bin\java"
$JAVA_POOL_TESTNET_ZIP_PATH = "${JAVA_POOL_TESTNET_DIR_PATH}\${JAVA_POOL_TESTNET_ZIP}"
$JAVA_POOL_TESTNET_UNZIP_PATH = "${JAVA_POOL_TESTNET_DIR_PATH}\${JAVA_POOL_TESTNET_UNZIP}"
$JAVA_POOL_TESTNET_URL = "https://cdn.azul.com/zulu/bin/$JAVA_POOL_TESTNET_ZIP"

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

$SIGNUMPLOTTER_STARTER_PS1 = "start-nodeplotter.ps1"
$SIGNUMPLOTTER_STARTER_EXEC = "start-nodeplotter.bat"
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

# TODO developers
# https://github.com/signum-network/signum-smartj 		#link
# https://github.com/deleterium/DASC-for-Signum 		#link
# https://deleterium.info/SmartC/stable/
# https://github.com/deleterium/SmartC
# https://github.com/deleterium/smartc-web-ui
# https://github.com/deleterium/SC-Simulator
# https://github.com/deleterium/smartc-signum-decompiler
# SmartC youtube
# https://www.youtube.com/playlist?list=PLyu0NNtb1eg3Gcg2JCrOle8MjtuFPb-Gi
# https://github.com/signum-network
# https://github.com/signum-network/signum-pool/releases/tag/v2.2.1

# https://deleterium.info/SmartC/stable/
# https://deleterium.info/sc-simulator/
# https://deleterium.info/smartc-retro-ui/

# jre\bin\java
# https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-fx-jre11.0.15-win_x64.zip

# DB.SqliteSynchronous = OFF
# DB.Sqlite.CacheSize = -4000

# TODO 1 notepad++ installer
# TODO Documents Menu
# TODO makr recommended applications



$MINER_DIR = "Miner"
$SIGNUM_MINER_DIR = "Signum Miner"

$SIGNUM_MINER_MAINNET_STARTER_PS1 = "start-miner.ps1"
$SIGNUM_MINER_MAINNET_STARTER_EXEC = "start-miner.bat"
$SIGNUM_MINER_MAINNET_VERSION = "v1.8.0"
$SIGNUM_MINER_MAINNET_VERSION_DIR = "$SIGNUM_MINER_MAINNET_VERSION"
$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH = "$SIGNUM_NODE_MAINNET_DIR\$MINER_DIR\$SIGNUM_MINER_DIR\$SIGNUM_MINER_MAINNET_VERSION_DIR"
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
$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH = "$SIGNUM_NODE_TESTNET_DIR\$MINER_DIR\$SIGNUM_MINER_DIR\$SIGNUM_MINER_TESTNET_VERSION_DIR"
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
$WHITEPAPER_DOC_NAME = "Whitepaper_$WHITEPAPER_VERSION.pdf"
$WHITEPAPER_DIR = "Whitepaper"
$WHITEPAPER_DIR_PATH = "$DOCUMENTS_DIR\$WHITEPAPER_DIR"
$WHITEPAPER_DOC_PATH = "$DOCUMENTS_DIR\$WHITEPAPER_DOC_NAME.pdf"
$WHITEPAPER_URL = "https://signum-network.github.io/whitepaper/business/${WHITEPAPER_VERSION}.pdf"

$WHITEHOUSE_DOC_NAME = "Climate_And_Energy_Implications_Of_Crypto_Assets_In_The_United_States.pdf"
$WHITEHOUSE_DOC_PATH = "$DOCUMENTS_DIR\$WHITEHOUSE_DOC_NAME"
$WHITEHOUSE_URL = "https://www.whitehouse.gov/wp-content/uploads/2022/09/09-2022-Crypto-Assets-and-Climate-Report.pdf"

$INDECS_DOC_NAME = "Sustainabiliy_Of_Blockchain_For_Strong_Private_Data_From_IOT_Devices.pdf"
$INDECS_DOC_PATH = "$DOCUMENTS_DIR\$INDECS_DOC_NAME"
$INDECS_URL = "https://indecs.eu/2024/indecs2024-pp738-762.pdf"

$SIGNUM_LINK_COLLECTION = "Signum-Link-Collection.html"
$SIGNUM_LINK_COLLECTION_PATH = "$DOCUMENTS_DIR\$SIGNUM_LINK_COLLECTION"

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

$SMART_CONTRACT_DIR = "SmartContract"

$SMARTC_SIGNUM_COMPILER_VERSION = "2.3.0"
$SMARTC_ASSEMBLY_HIGHLIGHT_VERSION = "1.1.1"

$SMARTC_WEB_UI_STARTER_PS1 = "start-smartc.ps1"
$SMARTC_WEB_UI_STARTER_EXEC = "start-smartc.bat"

$SMARTC_WEB_UI_ZIP_NAME_PATH = "${SMART_CONTRACT_DIR}\smartc-web-ui-main"
$SMARTC_WEB_UI_UNZIP = "SmartC-WEB-UI"
$SMARTC_WEB_UI_ZIP = "$SMARTC_WEB_UI_UNZIP.zip"
$SMARTC_WEB_UI_ZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_WEB_UI_ZIP}"
$SMARTC_WEB_UI_UNZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_WEB_UI_UNZIP}"
$SMARTC_WEB_UI_STARTER_PS1_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_WEB_UI_UNZIP}\${SMARTC_WEB_UI_STARTER_PS1}"
$SMARTC_WEB_UI_STARTER_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_WEB_UI_UNZIP}\${SMARTC_WEB_UI_STARTER_EXEC}"
$SMARTC_WEB_UI_URL = "https://github.com/deleterium/smartc-web-ui/archive/refs/heads/main.zip"

$SMARTC_RETRO_UI_STARTER_PS1 = "start-smartc.ps1"
$SMARTC_RETRO_UI_STARTER_EXEC = "start-smartc.bat"

$SMARTC_RETRO_UI_ZIP_NAME_PATH = "${SMART_CONTRACT_DIR}\smartc-retro-ui-main"
$SMARTC_RETRO_UI_UNZIP = "SmartC-RETRO-UI"
$SMARTC_RETRO_UI_ZIP = "$SMARTC_RETRO_UI_UNZIP.zip"
$SMARTC_RETRO_UI_ZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_RETRO_UI_ZIP}"
$SMARTC_RETRO_UI_UNZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_RETRO_UI_UNZIP}"
$SMARTC_RETRO_UI_STARTER_PS1_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_RETRO_UI_UNZIP}\${SMARTC_RETRO_UI_STARTER_PS1}"
$SMARTC_RETRO_UI_STARTER_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_RETRO_UI_UNZIP}\${SMARTC_RETRO_UI_STARTER_EXEC}"
$SMARTC_RETRO_UI_URL = "https://github.com/deleterium/smartc-retro-ui/archive/refs/heads/main.zip"

$SMARTC_SIGNUM_DECOMPILER_STARTER_PS1 = "start-smartc-decompiler.ps1"
$SMARTC_SIGNUM_DECOMPILER_STARTER_EXEC = "start-smartc-decompiler.bat"

$SMARTC_SIGNUM_DECOMPILER_ZIP_NAME_PATH = "${SMART_CONTRACT_DIR}\smartc-signum-decompiler-main"
$SMARTC_SIGNUM_DECOMPILER_ZIP = "SmartC-SIGNUM-DECOMPILER.zip"
$SMARTC_SIGNUM_DECOMPILER_UNZIP = "SmartC-SIGNUM-DECOMPILER"
$SMARTC_SIGNUM_DECOMPILER_ZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_SIGNUM_DECOMPILER_ZIP}"
$SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_SIGNUM_DECOMPILER_UNZIP}"
$SMARTC_SIGNUM_DECOMPILER_STARTER_PS1_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_SIGNUM_DECOMPILER_UNZIP}\${SMARTC_SIGNUM_DECOMPILER_STARTER_PS1}"
$SMARTC_SIGNUM_DECOMPILER_STARTER_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SMARTC_SIGNUM_DECOMPILER_UNZIP}\${SMARTC_SIGNUM_DECOMPILER_STARTER_EXEC}"
$SMARTC_SIGNUM_DECOMPILER_URL = "https://github.com/deleterium/smartc-signum-decompiler/archive/refs/heads/main.zip"

$SC_SIMULATOR_STARTER_PS1 = "start-sc-simulator.ps1"
$SC_SIMULATOR_STARTER_EXEC = "start-sc-simulator.bat"

$SC_SIMULATOR_ZIP_NAME_PATH = "${SMART_CONTRACT_DIR}\sc-simulator-main"
$SC_SIMULATOR_UNZIP = "SC-Simulator"
$SC_SIMULATOR_ZIP = "$SC_SIMULATOR_UNZIP.zip"
$SC_SIMULATOR_ZIP_PATH = "${SMART_CONTRACT_DIR}\${SC_SIMULATOR_ZIP}"
$SC_SIMULATOR_UNZIP_PATH = "${SMART_CONTRACT_DIR}\${SC_SIMULATOR_UNZIP}"
$SC_SIMULATOR_STARTER_PS1_PATH = "${SMART_CONTRACT_DIR}\${SC_SIMULATOR_UNZIP}\${SC_SIMULATOR_STARTER_PS1}"
$SC_SIMULATOR_STARTER_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SC_SIMULATOR_UNZIP}\${SC_SIMULATOR_STARTER_EXEC}"
$SC_SIMULATOR_URL = "https://github.com/deleterium/SC-Simulator/archive/refs/heads/main.zip"

$SIGNUM_D_OR_STARTER_PS1 = "start-signum-d-or.ps1"
$SIGNUM_D_OR_STARTER_EXEC = "start-signum-d-or.bat"

$SIGNUM_D_OR_ZIP_NAME_PATH = "${SMART_CONTRACT_DIR}\signum-d-or-main"
$SIGNUM_D_OR_UNZIP = "Signum-D-OR"
$SIGNUM_D_OR_ZIP = "$SIGNUM_D_OR_UNZIP.zip"
$SIGNUM_D_OR_ZIP_PATH = "${SMART_CONTRACT_DIR}\${SIGNUM_D_OR_ZIP}"
$SIGNUM_D_OR_UNZIP_PATH = "${SMART_CONTRACT_DIR}\${SIGNUM_D_OR_UNZIP}"
$SIGNUM_D_OR_STARTER_PS1_PATH = "${SMART_CONTRACT_DIR}\${SIGNUM_D_OR_UNZIP}\${SIGNUM_D_OR_STARTER_PS1}"
$SIGNUM_D_OR_STARTER_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SIGNUM_D_OR_UNZIP}\${SIGNUM_D_OR_STARTER_EXEC}"
$SIGNUM_D_OR_URL = "https://github.com/deleterium/Signum-D-Or/archive/refs/heads/main.zip"

$SMARTJ_STARTER_PS1 = "start-smartj.ps1"
$SMARTJ_STARTER_EXEC = "start-smartj.bat"

$SMARTJ_ZIP_NAME_PATH = "${SMART_CONTRACT_DIR}\signum-smartj-master"
$SMARTJ_UNZIP = "Signum-SmartJ"
$SMARTJ_ZIP = "$SMARTJ_UNZIP.zip"
$SMARTJ_ZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTJ_ZIP}"
$SMARTJ_UNZIP_PATH = "${SMART_CONTRACT_DIR}\${SMARTJ_UNZIP}"
$SMARTJ_EXEC = "heidisql.exe"
$SMARTJ_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SMARTJ_UNZIP}\${SMARTJ_EXEC}"
$SMARTJ_STARTER_PS1_PATH = "${SMART_CONTRACT_DIR}\${SMARTJ_UNZIP}\${SMARTJ_STARTER_PS1}"
$SMARTJ_STARTER_EXEC_PATH = "${SMART_CONTRACT_DIR}\${SMARTJ_UNZIP}\${SMARTJ_STARTER_EXEC}"
$SMARTJ_URL = "https://github.com/signum-network/signum-smartj/archive/refs/heads/master.zip"

$JAVA_SMARTJ_DIR = "jre"
$JAVA_SMARTJ_BIN = "jre\bin\java"
$JAVA_SMARTJ_UNZIP = "openlogic-openjdk-8u432-b06-windows-x64"
$JAVA_SMARTJ_ZIP = "$JAVA_SMARTJ_UNZIP.zip"
$JAVA_SMARTJ_DIR_PATH = "$SMARTJ_UNZIP_PATH\$JAVA_SMARTJ_DIR"
$JAVA_SMARTJ_BIN_PATH = "$JAVA_SMARTJ_DIR_PATH\bin\java"
$JAVA_SMARTJ_ZIP_PATH = "${JAVA_SMARTJ_DIR_PATH}\${JAVA_SMARTJ_ZIP}"
$JAVA_SMARTJ_UNZIP_PATH = "${JAVA_SMARTJ_DIR_PATH}\${JAVA_SMARTJ_UNZIP}"
$JAVA_SMARTJ_URL = "https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u432-b06/$JAVA_SMARTJ_ZIP"

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

$DBEAVER_STARTER_PS1 = "start-dbeaver.ps1"
$DBEAVER_STARTER_EXEC = "start-dbeaver.bat"

$DBEAVER_VERSION = "24.3.1"
$DBEAVER_DIR = "DBeaver"
$DBEAVER_ZIP = "dbeaver-ce-${DBEAVER_VERSION}-win32.win32.x86_64.zip"
$DBEAVER_UNZIP = "dbeaver-ce-${DBEAVER_VERSION}-win32.win32.x86_64"
$DBEAVER_EXEC = "dbeaver.exe"
$DBEAVER_EXEC_PATH = "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_UNZIP}\${DBEAVER_EXEC}"
$DBEAVER_STARTER_PS1_PATH = "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_UNZIP}\${DBEAVER_STARTER_PS1}"
$DBEAVER_STARTER_EXEC_PATH = "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_UNZIP}\${DBEAVER_STARTER_EXEC}"
$DBEAVER_URL = "https://dbeaver.io/files/${DBEAVER_VERSION}/${DBEAVER_ZIP}"

$NODEJS_STARTER_PS1 = "start-nodejs.ps1"
$NODEJS_STARTER_EXEC = "start-nodejs.bat"

$NODEJS_VERSION = "22.12.0"
$NODEJS_DIR = "NodeJS"
$NODEJS_DIR_PATH = "${TOOLS_DIR}\${NODEJS_DIR}"
$NODEJS_ZIP = "node-v${NODEJS_VERSION}-win-x64.zip"
$NODEJS_UNZIP = "node-v${NODEJS_VERSION}-win-x64"
$NODEJS_ZIP_PATH = "${NODEJS_DIR_PATH}\${NODEJS_ZIP}"
$NODEJS_UNZIP_PATH = "${NODEJS_DIR_PATH}\${NODEJS_UNZIP}"
$NODEJS_EXEC = "node.exe"
$NODEJS_EXEC_PATH = "${NODEJS_UNZIP_PATH}\${NODEJS_EXEC}"
$NODEJS_STARTER_PS1_PATH = "${NODEJS_UNZIP_PATH}\${NODEJS_STARTER_PS1}"
$NODEJS_STARTER_EXEC_PATH = "${NODEJS_UNZIP_PATH}\${NODEJS_STARTER_EXEC}"
$NODEJS_URL = "https://nodejs.org/dist/v${NODEJS_VERSION}/${NODEJS_ZIP}"

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

# TODO change between databases to install

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
    Write-Host "[9] `tInstall Signum Pool Mainnet with MariaDB"
    Write-Host "[10] `tInstall Signum Pool Testnet with MariaDB"
    Write-Host "[11] `tInstall Signum Explorer Mainnet with MariaDB"
    Write-Host "[12] `tInstall Signum Explorer Testnet with MariaDB"
	Write-Host "[13] `tInstall SmartC Signum Smart Contract Compiler [WEB-UI]"
	Write-Host "[14] `tInstall SmartC Signum Smart Contract Compiler [RETRO-UI]"
	Write-Host "[15] `tInstall SmartC Signum Smart Decompiler"
	Write-Host "[16] `tInstall SC Simulator"
	Write-Host "[17] `tInstall Signum-D-OR"
	Write-Host "[18] `tInstall SmartJ Signum Smart Contract Compiler"
	# Write-Host "====================================================="
	# Write-Host "            		 Databases	 			         "
	# Write-Host "====================================================="
    Write-Host "[19] `tInstall MariaDB"
	# Write-Host "====================================================="
	# Write-Host "            		 Tools	 			             "
	# Write-Host "====================================================="
    Write-Host "[20] `tInstall HeidiSQL"
	Write-Host "[21] `tInstall DBeaver"
    Write-Host "[22] `tInstall NGINX"
	Write-Host "[23] `tInstall NodeJS"
	Write-Host "[24] `tInstall Notepad++"
	<# Write-Host "====================================================="
	Write-Host "            	  Developer Tools 			         "
	Write-Host "====================================================="
	Write-Host "[8] `tInstall Signum SmartC Smart Contract Compiler" #>
	# Write-Host "-----------------------------------------------------"
	Write-Host "[25] `tInstall Whitepaper And Documents"
	Write-Host "[26] `tInstall Signum Link Collection"
    Write-Host "-----------------------------------------------------"
	# TODO Signum pages menu
	# TODO add usefull signum pages wiki, official page, github stb. coinmarcetcap, bft portal, explorer
	# Developer menu SmartC SmartJ for smartcontracts
	# Signum provider menu
	# letsencrypt with ACME challege
	# open readme how to use the installer
    Write-Host "[27] `tSignum Starter Menu"
    Write-Host "[28] `tExit"
    Write-Host "====================================================="

	# Write-Host "PowerShell version: $($PSVersionTable.PSVersion)"
    $choice = Read-Host "Enter your choice (1-28)"

	function install-process($file, $name, $installFunction) {
		if (Test-Path $file) {
			Write-Host "${name} already installed."
			question-prompt "Reinstall" $name $installFunction
			Pause
			Show-InstallMenu
		} else {
			question-prompt "Install" $name $installFunction
			Pause
			Show-InstallMenu
		}
	}

    switch ($choice) {
        "1" {
			install-process $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH "Signum Mainnet Node" {Install-SignumMainnet}
        }
        "2" {
			install-process $SIGNUM_NODE_TESTNET_STARTER_PS1_PATH "Signum Testnet Node" {Install-SignumTestnet}
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
			install-process $SIGNUM_POOL_MAINNET_STARTER_EXEC_PATH "Signum Pool Mainnet" {Install-SignumPoolMainnet}
        }
		"10" {
			install-process $SIGNUM_POOL_TESTNET_STARTER_EXEC_PATH "Signum Pool Testnet" {Install-SignumPoolTestnet}
        }
		"11" {
			install-process $SIGNUM_EXPLORER_MAINNET_STARTER_EXEC_PATH "Signum Explorer Mainnet" {Install-SignumExplorerMainnet}
        }
		"12" {
			install-process $SIGNUM_EXPLORER_TESTNET_STARTER_EXEC_PATH "Signum Explorer Testnet" {Install-SignumExplorerTestnet}
        }
		"13" {
			install-process $SMARTC_WEB_UI_STARTER_EXEC_PATH "SmartC Signum Smart Contract Compiler [WEB-UI]" {install-smartc-web-ui}
        }
		"14" {
			install-process $SMARTC_RETRO_UI_STARTER_EXEC_PATH "SmartC Signum Smart Contract Compiler [RETRO-UI]" {install-smartc-retro-ui}
        }
		"15" {
			install-process $SMARTC_SIGNUM_DECOMPILER_STARTER_EXEC_PATH "SmartC Signum Smart Contract Decompiler" {install-smartc-signum-decompiler}
        }
		"16" {
			install-process $SC_SIMULATOR_STARTER_EXEC_PATH "SC Simulator" {install-sc-simulator}
        }
		"17" {
			install-process $SIGNUM_D_OR_STARTER_EXEC_PATH "Signum-D-OR" {install-signum-d-or}
        }
		"18" {
			install-process $SMARTJ_STARTER_EXEC_PATH "SmartJ Signum Smart Contract Compiler" {install-smartj-compiler}
        }
        "19" {
			install-process $MARIADB_STARTER_PS1_PATH "MariaDB" {install_mariadb}
        }
        "20" {
			install-process $HEIDISQL_EXEC_PATH "HeidiSQL" {install_heidisql}
        }
		"21" {
			install-process $DBEAVER_EXEC_PATH "DBeaver" {install_DBeaver}
        }
		"22" {
			install-process $NGINX_EXEC_PATH "NGINX" {install_nginx}
        }
		"23" {
			install-process $NODEJS_EXEC_PATH "NodeJs" {install_nodejs}
        }
		"24" {
			install-process $NOTEPAD_EXEC_PATH "Notepad" {install_notepad}
        }
		"25" {
			install-process $WHITEPAPER_DOC_PATH "Whitepaper And Documents" {install-doc}
        }
		"26" {
			install-process $SIGNUM_LINK_COLLECTION_PATH "Signum Link Collection" {install-doc}
        }
        "27" {
            Show-StartMenu
        }
        "28" {
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
	Write-Host "[9] `tStart Signum Pool Mainnet"
	Write-Host "[10] `tStart Signum Pool Testnet"
	Write-Host "[11] `tStart Signum Explorer Mainnet"
	Write-Host "[12] `tStart Signum Explorer Testnet"
	Write-Host "[13] `tStart SmartC Signum Smart Contract [WEB-UI]"
	Write-Host "[14] `tStart SmartC Signum Smart Contract [RETRO-UI]"
	Write-Host "[15] `tStart SmartC Signum Smart Contract Decompiler"
	Write-Host "[16] `tStart SC Simulator"
	Write-Host "[17] `tStart Signum-D-OR"
	Write-Host "[18] `tStart SmartJ Signum Smart Contract Compiler"
    Write-Host "[19] `tStart MariaDB"
    Write-Host "[20] `tStart HeidiSQL"
	Write-Host "[21] `tStart DBeaver"
	Write-Host "[22] `tStart NGINX"
	Write-Host "[23] `tStart NodeJS"
	Write-Host "[24] `tStart Notepad++"
	Write-Host "[25] `tOpen Whitepaper"
	Write-Host "[26] `tOpen Signum Link Collection"
    Write-Host "-----------------------------------------------------"
    Write-Host "[27] `tSignum Installer Menu"
    Write-Host "[28] `tExit"
    Write-Host "====================================================="

    $choice = Read-Host "Enter your choice (1-28)"

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
			question-prompt "Install" $name $installFunction
			Pause
			Show-StartMenu
		}
	}
	
	function open-doc-menu($file, $name, $installFunction) {
		if (Test-Path $file) {
			Write-Host "Opening ${name} ..."
			# Start-Process -FilePath $file $command
			Start-Process -FilePath "$file"
			# Start-Process -FilePath $POWERSHELL_EXEC_PATH -ArgumentList "-ExecutionPolicy Bypass", "-File", $file
			Pause
			Show-StartMenu
		} else {
			Write-Host "${name} is not downloaded, please download first!"
			question-prompt "Download" $name $installFunction
			Pause
			Show-StartMenu
		}
	}

    switch ($choice) {
        "1" {
			start-process-menu $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH "Signum Node Mainnet" {Install-SignumMainnet} 
        }
        "2" {
			start-process-menu $SIGNUM_NODE_TESTNET_STARTER_PS1_PATH "Signum Node Testnet" {Install-SignumTestnet}
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
			start-process-menu $SIGNUM_POOL_MAINNET_STARTER_PS1_PATH "Signum Pool Mainnet" {Install-SignumPoolMainnet}
        }
		"10" {
			start-process-menu $SIGNUM_POOL_TESTNET_STARTER_PS1_PATH "Signum Pool Testnet" {Install-SignumPoolTestnet}
        }
		"11" {
			start-process-menu $SIGNUM_EXPLORER_MAINNET_STARTER_PS1_PATH "Signum Explorer Mainnet" {Install-SignumExplorerMainnet}
        }
		"12" {
			start-process-menu $SIGNUM_EXPLORER_TESTNET_STARTER_PS1_PATH "Signum Explorer Testnet" {Install-SignumExplorerTestnet}
        }
		"13" {
			start-process-menu $SMARTC_WEB_UI_STARTER_PS1_PATH "SmartC Signum Smart Contract Compiler [WEB-UI]" {install-smartc-web-ui}
        }
		"14" {
			start-process-menu $SMARTC_RETRO_UI_STARTER_PS1_PATH "SmartC Signum Smart Contract Compiler [RETRO-UI]" {install-smartc-retro-ui}
        }
		"15" {
			start-process-menu $SMARTC_SIGNUM_DECOMPILER_STARTER_PS1_PATH "SmartC Signum Signum Smart Contract Decompiler" {install-smartc-signum-decompiler}
        }
		"16" {
			start-process-menu $SC_SIMULATOR_STARTER_PS1_PATH "SC Simulator" {install-sc-simulator}
        }
		"17" {
			start-process-menu $SIGNUM_D_OR_STARTER_PS1_PATH "Signum-D-OR" {install-signum-d-or}
        }
		"18" {
			start-process-menu $SMARTJ_STARTER_PS1_PATH "SmartJ Signum Smart Contract Compiler" {install-smartj-compiler}
        }
        "19" {
			start-process-menu $MARIADB_STARTER_PS1_PATH "MariaDB" {install_mariadb}
        }
        "20" {
			start-process-menu $HEIDISQL_STARTER_PS1_PATH "HeidiSQL" {install_heidisql}
		}
		"21" {
			start-process-menu $DBEAVER_STARTER_PS1_PATH "DBeaver" {install_DBeaver}
        }
		"22" {
			start-process-menu $NGINX_STARTER_PS1_PATH "NGINX" {install_nginx}
        }
		"23" {
			start-process-menu $NODEJS_STARTER_PS1_PATH "NodeJs" {install_nodejs}
        }
		"24" {
			start-process-menu $NOTEPAD_STARTER_PS1_PATH "Notepad" {install_notepad}
        }
		"25" {
            open-doc-menu $WHITEPAPER_DOC_PATH "Whitepaper" {install-doc}
		}
		"26" {
            open-doc-menu $SIGNUM_LINK_COLLECTION_PATH "Signum Link Collection" {install-doc}
		}
        "27" {
            Show-InstallMenu
        }
        "28" {
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

function install-doc-init {
	
	# Create directory
    if (-not (Test-Path -Path $DOCUMENTS_DIR)) {
		New-Item -Path "$DOCUMENTS_DIR" -ItemType Directory | Out-Null
	} else {
		Write-Host "$DOCUMENTS_DIR already exists."
	}
	
	$content = 
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signum Cryptocurrency Resources</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
        }
        h1 {
            text-align: center;
        }
        .section {
            margin-bottom: 20px;
        }
        .section h2 {
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 5px 0;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Signum Cryptocurrency Resources</h1>
    
    <div class="section">
        <h2>Documentation & Development</h2>
        <ul>
            <li><a href="https://github.com/deleterium/SmartC/blob/v2.1/docs%2FREADME.md">SmartC README</a></li>
            <li><a href="https://docs.signum.network/ecosystem/resources-for-developers">Developer Resources</a></li>
            <li><a href="https://wiki.signum.network/signum-software/index.htm">Signum Software Wiki</a></li>
            <li><a href="https://github.com/signum-network/signumj">SignumJ GitHub</a></li>
        </ul>
    </div>
    
    <div class="section">
        <h2>Research & Papers</h2>
        <ul>
            <li><a href="https://www.signum.network/wp/Signum_Business_Whitepaper.pdf">Signum Business Whitepaper</a></li>
            <li><a href="https://indecs.eu/2024/indecs2024-pp738-762.pdf">Blockchain for IoT Devices</a></li>
            <li><a href="https://www.whitehouse.gov/wp-content/uploads/2022/09/09-2022-Crypto-Assets-and-Climate-Report.pdf">Crypto-Assets and Climate Report</a></li>
        </ul>
    </div>
    
    <div class="section">
        <h2>Community & Social Media</h2>
        <ul>
            <li><a href="https://discord.com/invite/QHZkF4KHDS">Signum Discord</a></li>
            <li><a href="https://x.com/signum_official">Signum X</a></li>
            <li><a href="https://t.me/signumnetwork">Signum Network Telegram</a></li>
            <li><a href="https://t.me/Signum_Russia">Signum Russia Telegram</a></li>
            <li><a href="https://t.me/signumchain">Signum Chain Telegram</a></li>
            <li><a href="https://t.me/Signum_HK">Signum HK Telegram</a></li>
            <li><a href="https://t.me/signa_holders">Signa Holders Telegram</a></li>
        </ul>
    </div>
    
    <div class="section">
        <h2>Tools & Services</h2>
        <ul>
            <li><a href="https://miningpoolstats.stream/signa">Mining Pool Stats</a></li>
            <li><a href="http://ciyam.org/at/">CIYAM AT</a></li>
            <li><a href="https://signum.dappository.world/">Signum Dappository</a></li>
            <li><a href="https://signum-neo-node.pages.dev/">Signum Neo Node</a></li>
            <li><a href="https://docs.signum.network/signumswap/add-a-customised-icon">SignumSwap Custom Icon</a></li>
            <li><a href="https://explorer.signum.network/">Signum Explorer</a></li>
        </ul>
    </div>
    
    <div class="section">
        <h2>External Resources</h2>
        <ul>
            <li><a href="https://coindar.org/en/coin/signum">Coindar Signum</a></li>
            <li><a href="https://bitcointalk.org/index.php?action=profile;u=364787">BitcoinTalk Profile</a></li>
            <li><a href="https://xeggex.com/market/SIGNA_BTC">Xeggex Market SIGNA/BTC</a></li>
            <li><a href="https://fomplo.com/signum-subscriptions">Signum Subscriptions</a></li>
            <li><a href="https://signum.network/">Signum Network</a></li>
            <li><a href="https://www.signumart.io/">NFT Portal</a></li>
        </ul>
    </div>
</body>
</html>
"@
	
	# Create Signum link collection page
	if (-not (Test-Path $SIGNUM_LINK_COLLECTION_PATH)) {
		
		# Create Signum-Link-Collection.html file with the desired content
		$content | Out-File -FilePath $SIGNUM_LINK_COLLECTION_PATH -Force
		Write-Host "${SIGNUM_LINK_COLLECTION_PATH} successfully created."
		
	} else {
		
		Write-Host "File already exists: ${SIGNUM_LINK_COLLECTION_PATH}"
		$fileContent = Get-Content -Path $SIGNUM_LINK_COLLECTION_PATH -Raw
		# Compare the content
		
		if ($fileContent.TrimEnd() -eq $content.TrimEnd()) {
			
			Write-Output "The contents are the same."
			
		} else {
			
			Write-Output "The contents are different."
			Write-Output "Update $SIGNUM_LINK_COLLECTION."
			$content | Out-File -FilePath $SIGNUM_LINK_COLLECTION_PATH -Force
			
		}
	}
	
	if (-not (Test-Path -Path $WHITEPAPER_DOC_PATH)) {
		Write-Host "Downloading $WHITEPAPER_DOC_NAME"
		Invoke-WebRequest -Uri $WHITEPAPER_URL -OutFile $WHITEPAPER_DOC_PATH
	} else {
		Write-Host "$WHITEPAPER_DOC_PATH already exists."
	}
	
	if (-not (Test-Path -Path $WHITEHOUSE_DOC_PATH)) {
		Write-Host "Downloading $WHITEHOUSE_DOC_NAME"
		Invoke-WebRequest -Uri $WHITEHOUSE_URL -OutFile $WHITEHOUSE_DOC_PATH
	} else {
		Write-Host "$WHITEHOUSE_DOC_PATH already exists."
	}
	
	if (-not (Test-Path -Path $INDECS_DOC_PATH)) {
		Write-Host "Downloading $INDECS_DOC_NAME"
		Invoke-WebRequest -Uri $INDECS_URL -OutFile $INDECS_DOC_PATH
	} else {
		Write-Host "$INDECS_DOC_PATH already exists."
	}

	Write-Host "Documents downloaded successfully"
	
}

function install-doc {
	
	install-doc-init

	Pause
	Show-InstallMenu
	
}

function Install-SignumMainnet {
    Write-Host "Installing Signum Mainnet ..."

    # Create mainnet/testnet directory
    if (-not (Test-Path -Path "${SIGNUM_NODE_MAINNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_NODE_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_NODE_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_NODE_MAINNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_ZIP}") {
        Write-Host "${SIGNUM_NODE_MAINNET_ZIP} already downloaded."
    } else {
        # Download the Signum mainnet zip file
        Write-Host "Downloading Signum from GitHub ..."
        # Start-BitsTransfer -Source "${SIGNUM_NODE_MAINNET_URL}" -Destination "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_ZIP}"
		Invoke-WebRequest -Uri ${SIGNUM_NODE_MAINNET_URL} -OutFile ${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_ZIP}

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_ZIP}")) {
            Write-Host "Error: Failed to download Signum."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}") {
        Write-Host "${SIGNUM_NODE_MAINNET_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP} ..."
        Expand-Archive -Path "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_ZIP}" -DestinationPath "${SIGNUM_NODE_MAINNET_DIR_PATH}\${SIGNUM_NODE_MAINNET_UNZIP}" -Force
    }

	if (Test-Path -Path "${SIGNUM_NODE_MAINNET_PROPERTIES_PATH}") {
        Write-Host "${SIGNUM_NODE_MAINNET_PROPERTIES_PATH} already exists."
    } else {
        # Copy node-default.properties to node.properties
		Write-Host "Copying ${SIGNUM_NODE_MAINNET_DEFAULT_PROPERTIES_PATH} to ${SIGNUM_NODE_MAINNET_PROPERTIES_PATH} ..."
		Copy-Item -Path "${SIGNUM_NODE_MAINNET_DEFAULT_PROPERTIES_PATH}" -Destination "${SIGNUM_NODE_MAINNET_PROPERTIES_PATH}"
	}
	
<# #this true by default	
	# Add node.indirectIncomingService.enable = true propertie
	$content = Get-Content -Path $SIGNUM_NODE_MAINNET_PROPERTIES_PATH
	
	$content = $content | ForEach-Object {
        if ($_ -match "node.indirectIncomingService.enable = true") {
            $matchFound = $true
            Write-Host "node.indirectIncomingService.enable = true already set"
		}
    }

    if (-not $matchFound) {
        Write-Host "Add inode.indirectIncomingService.enable = true to node.properties"
        $content += "node.indirectIncomingService.enable = true"
    }

	# Write the updated content back to the file
	Set-Content -Path $SIGNUM_NODE_MAINNET_PROPERTIES_PATH -Value $content
#>
<#
	# Install NeoClassic wallet
	Write-Host "Install NeoClassic wallet."
	if (-not (Test-Path -Path "${SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH}")) {
        New-Item -Path "${SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH}"
    }
#>
	
	# Insall Signum NeoClassic Wallet if not installed yet
	if (Test-Path $SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH) {
		Write-Host "Signum NeoClassic Wallet already installed."
		question-prompt "Reinstall" "NeoClassic Wallet" {Install-NeoClassic-MAINNET-Wallet}
	} else {
		Write-Host "Signum NeoClassic Wallet is not yet installed."
		question-prompt "Install" "NeoClassic Wallet" {Install-NeoClassic-MAINNET-Wallet}
		# Pause
	}

    # Create starter ps1
    signum-starter-ps1 "Mainnet" ${SIGNUM_NODE_MAINNET_STARTER_PS1_PATH} 8125
	
	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_NODE_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_NODE_STARTER_EXEC} ${SIGNUM_NODE_MAINNET_STARTER_EXEC_PATH}

    # Install MariaDB
	if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
		question-prompt "Reinstall" "MariaDB" {install_mariadb}
    } else {
		Write-Host "MariaDB is not yet installed."
		question-prompt "Install" "MariaDB" {install_mariadb}
	}

    # Setup MariaDB for Mainnet
	question-prompt "Setup" "MariaDB for Signum Mainnet Node" {setup_mariadb "Signum Node Mainnet" "signum-node-mainnet" "signumuser_node_mainnet" "signumpassword"}
	
	if ($global:UserResponse -eq "yes") {	
		# Update database information in node.properties
		setup_db_node_properties ${SIGNUM_NODE_MAINNET_PROPERTIES_PATH}
	}

	# TODO Create start-node-v8.2.0-mariadb-v10.20.0.bat in root to start specific versions
	# TODO start-node-node.bat should be bat and start-mariadb.bat should be bat as well and OS spacific or ps1 + ps1 executer bat
	
	# Question prompt check if installed

    Write-Host "Signum Mainnet Node Installation complete."
    # Pause
<#
    if (-not (Test-Path -Path "${SIGNUM_NODE_TESTNET_STARTER_PS1_PATH}")) {
        question-prompt "Install" "Signum Node Testnet" Install-SignumTestnet
    }
#>
}

function Install-NeoClassic-MAINNET-Wallet {
	
	# Download NeoClassic
    if (Test-Path -Path "${SIGNUM_WALLET_MAINNET_NEOCLASSIC_ZIP_PATH}") {
        Write-Host "${SIGNUM_WALLET_NEOCLASSIC_ZIP} already downloaded."
    } else {
        # Download the Signum mainnet zip file
        Write-Host "Downloading Signum NeoClassic Wallet from GitHub ..."
		Invoke-WebRequest -Uri $SIGNUM_WALLET_MAINNET_NEOCLASSIC_URL -OutFile $SIGNUM_WALLET_MAINNET_NEOCLASSIC_ZIP_PATH
		
        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_WALLET_MAINNET_NEOCLASSIC_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum NeoClassic Wallet."
            Pause
            # Install-Menu
            # return
        }
    }
	
	# Unzip NeoClassic
	if (Test-Path -Path "${SIGNUM_WALLET_MAINNET_NEOCLASSIC_UNZIP_PATH}\src") {
        Write-Host "Signum NeoClassic Wallet already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum NeoClassic Wallet to ${SIGNUM_WALLET_MAINNET_UI_DIR_PATH} ..."
        Expand-Archive -Path "${SIGNUM_WALLET_MAINNET_NEOCLASSIC_ZIP_PATH}" -DestinationPath "${SIGNUM_WALLET_MAINNET_UI_DIR_PATH}\${SIGNUM_WALLET_NEOCLASSIC_DIR}" -Force
	
		# Setup index.html
		Write-Host "Setup index.html"
		
		# Check index.html if NeoClassic is added
		$foundNeoClassic = $false
		$content = Get-Content -Path ${SIGNUM_WALLET_MAINNET_UI_DIR_PATH}\index.html
		
		$content = $content | ForEach-Object {
			if ($_ -match $SIGNUM_WALLET_NEOCLASSIC_DIR) {
				$foundNeoClassic = $true
				Write-Host "index.html setup is ready"
			}
		}
		
		if (-not $foundNeoClassic) {
			$content = Get-Content -Path ${SIGNUM_WALLET_MAINNET_UI_DIR_PATH}\index.html
			
			# Define the HTML content to insert
			$newLine = 
@"
		<a class="card" id="neoclassic-link" href="./${SIGNUM_WALLET_NEOCLASSIC_DIR}/index.html" onclick="selectedWallet('neoclassic')">
			<div class="center-text">
				<img src="./assets/signum-logomark-white.svg">
				<h2 class="card__title">NeoClassic</h2>
			</div>
		</a>
"@
			
			for ($i = 0; $i -lt $content.Count; $i++) {

				# Get the current line
				$line = $content[$i]

				if ($line -match '^\s*</div>') {
					if ($content[$i+1] -match "^\s*</a>") {
						# Insert the new line after $content[$i+1]
						$content = $content[0..($i+1)] + $newLine + $content[($i+2)..($content.Count - 1)]
						break
					}
				}
			}

			# Write the changes back to the file
			$content | Set-Content -Path ${SIGNUM_WALLET_MAINNET_UI_DIR_PATH}\index.html
		}
	}
}

function Install-NeoClassic-TESTNET-Wallet {
	
	# Download NeoClassic
    if (Test-Path -Path "${SIGNUM_WALLET_TESTNET_NEOCLASSIC_ZIP_PATH}") {
        Write-Host "${SIGNUM_WALLET_NEOCLASSIC_ZIP} already downloaded."
    } else {
        # Download the Signum mainnet zip file
        Write-Host "Downloading Signum NeoClassic Wallet from GitHub ..."
		Invoke-WebRequest -Uri $SIGNUM_WALLET_TESTNET_NEOCLASSIC_URL -OutFile $SIGNUM_WALLET_TESTNET_NEOCLASSIC_ZIP_PATH
		
        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_WALLET_TESTNET_NEOCLASSIC_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum NeoClassic Wallet."
            Pause
            # Install-Menu
            # return
        }
    }
	
	# Unzip NeoClassic
	if (Test-Path -Path "${SIGNUM_WALLET_TESTNET_NEOCLASSIC_UNZIP_PATH}\src") {
        Write-Host "Signum NeoClassic Wallet already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum NeoClassic Wallet to ${SIGNUM_WALLET_TESTNET_UI_DIR_PATH} ..."
        Expand-Archive -Path "${SIGNUM_WALLET_TESTNET_NEOCLASSIC_ZIP_PATH}" -DestinationPath "${SIGNUM_WALLET_TESTNET_UI_DIR_PATH}\${SIGNUM_WALLET_NEOCLASSIC_DIR}" -Force
	
		# Setup index.html
		Write-Host "Setup index.html"
		
		# Check index.html if NeoClassic is added
		$foundNeoClassic = $false
		$content = Get-Content -Path ${SIGNUM_WALLET_TESTNET_UI_DIR_PATH}\index.html
		
		$content = $content | ForEach-Object {
			if ($_ -match $SIGNUM_WALLET_NEOCLASSIC_DIR) {
				$foundNeoClassic = $true
				Write-Host "index.html setup is ready"
			}
		}
		
		if (-not $foundNeoClassic) {
			$content = Get-Content -Path ${SIGNUM_WALLET_TESTNET_UI_DIR_PATH}\index.html
			
			# Define the HTML content to insert
			$newLine = 
@"
		<a class="card" id="neoclassic-link" href="./${SIGNUM_WALLET_NEOCLASSIC_DIR}/index.html" onclick="selectedWallet('neoclassic')">
			<div class="center-text">
				<img src="./assets/signum-logomark-white.svg">
				<h2 class="card__title">NeoClassic</h2>
			</div>
		</a>
"@
			
			for ($i = 0; $i -lt $content.Count; $i++) {

				# Get the current line
				$line = $content[$i]

				if ($line -match '^\s*</div>') {
					if ($content[$i+1] -match "^\s*</a>") {
						# Insert the new line after $content[$i+1]
						$content = $content[0..($i+1)] + $newLine + $content[($i+2)..($content.Count - 1)]
						break
					}
				}
			}

			# Write the changes back to the file
			$content | Set-Content -Path ${SIGNUM_WALLET_TESTNET_UI_DIR_PATH}\index.html
		}
	}
}

function Install-SignumTestnet {
    Write-Host "Installing Signum Testnet ..."

    # Create mainnet/testnet directory
    if (-not (Test-Path -Path "${SIGNUM_NODE_TESTNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_NODE_TESTNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_NODE_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_NODE_TESTNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_ZIP}") {
        Write-Host "${SIGNUM_NODE_TESTNET_ZIP} already downloaded."
    } else {
        # Download the Signum testnet zip file
        Write-Host "Downloading Signum from GitHub ..."
		# TODO try out Invoke-WebRequest or System.Net.Http.HttpClient
        # Start-BitsTransfer -Source "${SIGNUM_NODE_TESTNET_URL}" -Destination "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_ZIP}"
		Invoke-WebRequest -Uri $SIGNUM_NODE_TESTNET_URL -OutFile ${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_ZIP}

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_ZIP}")) {
            Write-Host "Error: Failed to download Signum."
            Exit
        }
    }

    if (Test-Path -Path "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}") {
        Write-Host "${SIGNUM_NODE_TESTNET_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP} ..."
        Expand-Archive -Path "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_ZIP}" -DestinationPath "${SIGNUM_NODE_TESTNET_DIR_PATH}\${SIGNUM_NODE_TESTNET_UNZIP}" -Force
    }

	if (Test-Path -Path "${SIGNUM_NODE_TESTNET_PROPERTIES_PATH}") {
        Write-Host "${SIGNUM_NODE_TESTNET_PROPERTIES_PATH} already exists."
    } else {
        # Copy node-default.properties to node.properties
		Write-Host "Copying ${SIGNUM_NODE_TESTNET_DEFAULT_PROPERTIES_PATH} to ${SIGNUM_NODE_TESTNET_PROPERTIES_PATH} ..."
		Copy-Item -Path "${SIGNUM_NODE_TESTNET_DEFAULT_PROPERTIES_PATH}" -Destination "${SIGNUM_NODE_TESTNET_PROPERTIES_PATH}"
	}


    # Update node.properties with new database information
    Write-Host "Updating ${SIGNUM_NODE_TESTNET_PROPERTIES_PATH} with Testnet configurations ..."
    (Get-Content -Path $SIGNUM_NODE_TESTNET_PROPERTIES_PATH) -replace '# node.network = signum.net.TestnetNetwork', 'node.network = signum.net.TestnetNetwork' | Set-Content -Path $SIGNUM_NODE_TESTNET_PROPERTIES_PATH
	
<# #this true by default
	# Add node.indirectIncomingService.enable = true propertie
	$content = Get-Content -Path $SIGNUM_NODE_TESTNET_PROPERTIES_PATH
	
	$content = $content | ForEach-Object {
        if ($_ -match "node.indirectIncomingService.enable = true") {
            $matchFound = $true
            Write-Host "node.indirectIncomingService.enable = true already set"
		}
    }

    if (-not $matchFound) {
        Write-Host "Add node.indirectIncomingService.enable = true to node.properties"
        $content += "node.indirectIncomingService.enable = true"
    }

	# Write the updated content back to the file
	Set-Content -Path $SIGNUM_NODE_TESTNET_PROPERTIES_PATH -Value $content
#>

    Write-Host "Update complete."
	
	# Insall Signum NeoClassic Wallet if not installed yet
	if (Test-Path $SIGNUM_WALLET_TESTNET_NEOCLASSIC_UNZIP_PATH) {
		Write-Host "Signum NeoClassic Wallet already installed."
		question-prompt "Reinstall" "NeoClassic Wallet" {Install-NeoClassic-TESTNET-Wallet}
	} else {
		Write-Host "Signum NeoClassic Wallet is not yet installed."
		question-prompt "Install" "NeoClassic Wallet" {Install-NeoClassic-TESTNET-Wallet}
		# Pause
	}

    # Install Signum Testnet starter batch
    signum-starter-ps1 "Testnet" ${SIGNUM_NODE_TESTNET_STARTER_PS1_PATH} 6876
	
	# OS dependent start-node
	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_NODE_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_NODE_STARTER_EXEC} ${SIGNUM_NODE_TESTNET_STARTER_EXEC_PATH}

    # Install MariaDB
	if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
		question-prompt "Reinstall" "MariaDB" {install_mariadb}
    } else {
		Write-Host "MariaDB is not yet installed."
		question-prompt "Install" "MariaDB" {install_mariadb}
	}

    # Setup MariaDB for Testnet
    question-prompt "Setup" "MariaDB for Signum Testnet Node" {setup_mariadb "Signum Node Testnet" "signum-node-testnet" "signumuser_node_testnet" "signumpassword"}
	
	# Update database information in node.properties
	setup_db_node_properties ${SIGNUM_NODE_TESTNET_PROPERTIES_PATH}

    Write-Host "Signum Testnet Node Installation complete."
    # Pause

<#
    if (-not (Test-Path -Path "${SIGNUM_NODE_MAINNET_STARTER_PS1_PATH}")) {
        question-prompt "Install" "Signum Node Mainnet" {Install-SignumMainnet}
    }
#>
}

function Install-SignumPoolMainnet {
    Write-Host "Installing Signum Pool Mainnet ..."

	# install-process $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH "Signum Mainnet" {Install-SignumMainnet}

    # Create Pool directory
    if (-not (Test-Path -Path "${SIGNUM_POOL_MAINNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_POOL_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_POOL_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_POOL_MAINNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_POOL_MAINNET_ZIP_PATH}") {
        Write-Host "${SIGNUM_POOL_MAINNET_ZIP_PATH} already downloaded."
    } else {
        # Download the Signum Pool Mainnet zip file
        Write-Host "Downloading Signum Pool from GitHub ..."
        # Start-BitsTransfer -Source "${SIGNUM_POOL_MAINNET_URL}" -Destination "${SIGNUM_POOL_MAINNET_ZIP_PATH}"
		Invoke-WebRequest -Uri $SIGNUM_POOL_MAINNET_URL -OutFile $SIGNUM_POOL_MAINNET_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_POOL_MAINNET_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum Pool."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_POOL_MAINNET_UNZIP_PATH}") {
        Write-Host "${SIGNUM_POOL_MAINNET_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_POOL_MAINNET_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_POOL_MAINNET_ZIP_PATH}" -DestinationPath "${SIGNUM_POOL_MAINNET_DIR_PATH}" -Force
    }
	
	# Create jre directory
    if (-not (Test-Path -Path "${JAVA_POOL_MAINNET_DIR_PATH}")) {
        New-Item -Path "${JAVA_POOL_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${JAVA_POOL_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${JAVA_POOL_MAINNET_DIR_PATH}"
    }
	
	# download java
	if (Test-Path -Path "${JAVA_POOL_MAINNET_ZIP_PATH}") {
        Write-Host "${JAVA_POOL_MAINNET_ZIP_PATH} already downloaded."
    } else {
        # Download Java zip file
        Write-Host "Downloading Java ..."
        # Start-BitsTransfer -Source "${JAVA_POOL_MAINNET_URL}" -Destination "${JAVA_POOL_MAINNET_ZIP_PATH}"
		Invoke-WebRequest -Uri $JAVA_POOL_MAINNET_URL -OutFile $JAVA_POOL_MAINNET_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${JAVA_POOL_MAINNET_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum Pool."
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip java
	if (Test-Path -Path "${JAVA_POOL_MAINNET_UNZIP_PATH}") {
        Write-Host "${JAVA_POOL_MAINNET_ZIP_PATH} already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Java to ${JAVA_POOL_MAINNET_UNZIP_PATH} ..."
        Expand-Archive -Path "${JAVA_POOL_MAINNET_ZIP_PATH}" -DestinationPath "${JAVA_POOL_MAINNET_DIR_PATH}" -Force
    }
	
	# Copy poopl.properties to pool-original.properties
	Write-Host "Copying ${SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_PATH} to ${SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_ORIGINAL_PATH} ..."
    Copy-Item -Path "${SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_PATH}" -Destination "${SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_ORIGINAL_PATH}"
	
	$port = 8000

	# Create starter ps1
	if (-not (Test-Path $SIGNUM_POOL_MAINNET_STARTER_PS1_PATH)) {
		# Create start-pool.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start Signum Node
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting MariaDB ...'

# Start MariaDB
..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$MARIADB_STARTER_PS1_PATH" "-WindowStyle Minimized"
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-File", "..\..\..\$MARIADB_STARTER_PS1_PATH" -WindowStyle Minimized

Write-Host 'Starting Signum Node Mainnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$SIGNUM_NODE_MAINNET_STARTER_PS1_PATH" "-WindowStyle Minimized"

Write-Host 'Starting Signum Pool Mainnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

# Start Signum Pool
# Start-Process -FilePath "jre\${JAVA_POOL_MAINNET_UNZIP}\bin\java" -ArgumentList "-jar", "signum-pool.jar" -WindowStyle Minimized
# Last OK
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'Signum Pool Mainnet'; jre\${JAVA_POOL_MAINNET_UNZIP}\bin\java -jar signum-pool.jar"

Write-Host 'Starting Signum Pool Mainnet ...'
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'Signum Pool Mainnet'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'Signum Pool Mainnet is already running.'
			exit
		} else {
			# Start Signum Pool Mainnet
			Start-Process "http://localhost:$port"
			.\jre\${JAVA_POOL_MAINNET_UNZIP}\bin\java -jar signum-pool.jar
		}
    } catch {
        Write-Host 'An error occurred while starting Signum Pool Mainnet: `$_'
    } finally {
        # Always set the title to 'Signum Pool Mainnet Stopped' after Signum Pool Mainnet exits
        ```$host.UI.RawUI.WindowTitle = 'Signum Pool Mainnet Stopped'
    }
"`@ ``
    -WindowStyle Minimized

# TODO check
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\jre\bin\java -jar signum-node.jar -WindowStyle Minimized
# "jre\bin\java" "-jar" "signum-node.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "Set-Title 'Signum Mainnet Node'; Start-Process -NoNewWindow -FilePath 'jre\bin\java' -ArgumentList '-jar', 'signum-node.jar'"

exit
"@

		$content | Out-File -FilePath $SIGNUM_POOL_MAINNET_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_POOL_MAINNET_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_POOL_MAINNET_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_POOL_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_POOL_STARTER_EXEC} ${SIGNUM_POOL_MAINNET_STARTER_EXEC_PATH}

    # Install MariaDB
	if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
		question-prompt "Reinstall" "MariaDB" {install_mariadb}
    } else {
		Write-Host "MariaDB is not yet installed."
		question-prompt "Install" "MariaDB" {install_mariadb}
	}

    # Setup MariaDB for Signum Pool Mainnet
    question-prompt "Setup" "MariaDB for Signum Pool Mainnet" {setup_mariadb "Signum Pool Mainnet" "signum-pool-mainnet" "signumuser_pool_mainnet" "signumpassword"}
	
	if ($global:UserResponse -eq "yes") {	
		# Update database information in pool.properties
		setup_db_pool_properties ${SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_PATH}
	}
	
	# Setup pool.properties
	question-prompt "Setup" "Signum Pool Mainnet Properties" {setup_signumpool $SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_PATH  $SIGNUM_POOL_SIGNUM_NODE_MAINNET_PROPERTIES_ORIGINAL_PATH "mainnet"}

	# TODO Create start-node-v8.2.0-mariadb-v10.20.0.bat in root to start specific versions
	# TODO start-node-node.bat should be bat and start-mariadb.bat should be bat as well and OS spacific or ps1 + ps1 executer bat

    Write-Host "Signum Pool Mainnet Installation complete."
    # Pause
	
	# Insall Signum Mainnet if not installed yet
	if (Test-Path $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH) {
		Write-Host "Signum Node Mainnet $SIGNUM_NODE_MAINNET_VERSION already installed."
		question-prompt "Reinstall" "Signum Node Mainnet" {Install-SignumMainnet}
	} else {
		Write-Host "Signum Node Mainnet $SIGNUM_NODE_MAINNET_VERSION is not yet installed."
		question-prompt "Install" "Signum Node Mainnet" {Install-SignumMainnet}
		# Pause
	}

<#	
	if (-not (Test-Path -Path "${SIGNUM_POOL_TESTNET_STARTER_PS1_PATH}")) {
        question-prompt "Install" "Signum Pool Testnet" Install-SignumPoolTestnet
    }
#>	
}

# TODO parameterize every function to use only once
# Currently by default installer use MariaDB -> maybe later multiple installation could be configured assigne with specific application

function Install-SignumPoolTestnet {
    Write-Host "Installing Signum Pool Testnet ..."

	# install-process $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH "Signum Testnet" {Install-SignumMainnet}

    # Create Pool directory
    if (-not (Test-Path -Path "${SIGNUM_POOL_TESTNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_POOL_TESTNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_POOL_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_POOL_TESTNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_POOL_TESTNET_ZIP_PATH}") {
        Write-Host "${SIGNUM_POOL_TESTNET_ZIP_PATH} already downloaded."
    } else {
        # Download the Signum Pool Testnet zip file
        Write-Host "Downloading Signum Pool from GitHub ..."
        # Start-BitsTransfer -Source "${SIGNUM_POOL_TESTNET_URL}" -Destination "${SIGNUM_POOL_TESTNET_ZIP_PATH}"
		Invoke-WebRequest -Uri $SIGNUM_POOL_TESTNET_URL -OutFile $SIGNUM_POOL_TESTNET_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_POOL_TESTNET_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum Pool."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_POOL_TESTNET_UNZIP_PATH}") {
        Write-Host "${SIGNUM_POOL_TESTNET_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_POOL_TESTNET_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_POOL_TESTNET_ZIP_PATH}" -DestinationPath "${SIGNUM_POOL_TESTNET_DIR_PATH}" -Force
    }
	
	# Create jre directory
    if (-not (Test-Path -Path "${JAVA_POOL_TESTNET_DIR_PATH}")) {
        New-Item -Path "${JAVA_POOL_TESTNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${JAVA_POOL_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${JAVA_POOL_TESTNET_DIR_PATH}"
    }
	
	# download java
	if (Test-Path -Path "${JAVA_POOL_TESTNET_ZIP_PATH}") {
        Write-Host "${JAVA_POOL_TESTNET_ZIP_PATH} already downloaded."
    } else {
        # Download the Signum Pool Testnet zip file
        Write-Host "Downloading Java ..."
        # Start-BitsTransfer -Source "${JAVA_POOL_TESTNET_URL}" -Destination "${JAVA_POOL_TESTNET_ZIP_PATH}"
		Invoke-WebRequest -Uri $JAVA_POOL_TESTNET_URL -OutFile $JAVA_POOL_TESTNET_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${JAVA_POOL_TESTNET_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum Pool."
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip java
	if (Test-Path -Path "${JAVA_POOL_TESTNET_UNZIP_PATH}") {
        Write-Host "${JAVA_POOL_TESTNET_ZIP_PATH} already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Java to ${JAVA_POOL_TESTNET_UNZIP_PATH} ..."
        Expand-Archive -Path "${JAVA_POOL_TESTNET_ZIP_PATH}" -DestinationPath "${JAVA_POOL_TESTNET_DIR_PATH}" -Force
    }
	
	# Copy poopl.properties to pool-original.properties
	Write-Host "Copying ${SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_PATH} to ${SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_ORIGINAL_PATH} ..."
    Copy-Item -Path "${SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_PATH}" -Destination "${SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_ORIGINAL_PATH}"

	$port = 8001

	# Create starter ps1
	if (-not (Test-Path $SIGNUM_POOL_TESTNET_STARTER_PS1_PATH)) {
		# Create start-pool.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start Signum Pool Testnet
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting MariaDB ...'

# Start MariaDB
..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$MARIADB_STARTER_PS1_PATH" "-WindowStyle Minimized"
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-File", "..\..\..\$MARIADB_STARTER_PS1_PATH" -WindowStyle Minimized

Write-Host 'Starting Signum Node Testnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$SIGNUM_NODE_TESTNET_STARTER_PS1_PATH" "-WindowStyle Minimized"

Write-Host 'Starting Signum Pool Testnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

# Start Signum Pool
# Start-Process -FilePath "jre\${JAVA_POOL_TESTNET_UNZIP}\bin\java" -ArgumentList "-jar", "signum-pool.jar" -WindowStyle Minimized
# Last OK
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'Signum Pool Testnet'; jre\${JAVA_POOL_MAINNET_UNZIP}\bin\java -jar signum-pool.jar"

Write-Host 'Starting Signum Pool Testnet ...'
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'Signum Pool Testnet'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'Signum Pool Testnet is already running.'
			exit
		} else {
			# Start Signum Pool Testnet
			Start-Process "http://localhost:$port"
			.\jre\${JAVA_POOL_TESTNET_UNZIP}\bin\java -jar signum-pool.jar
		}
    } catch {
        Write-Host 'An error occurred while starting Signum Pool Testnet: `$_'
    } finally {
        # Always set the title to 'Signum Pool Testnet Stopped' after Signum Pool Testnet exits
        ```$host.UI.RawUI.WindowTitle = 'Signum Pool Testnet Stopped'
    }
"`@ ``
    -WindowStyle Minimized

# TODO check
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\jre\bin\java -jar signum-node.jar -WindowStyle Minimized
# "jre\bin\java" "-jar" "signum-node.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "Set-Title 'Signum Testnet Node'; Start-Process -NoNewWindow -FilePath 'jre\bin\java' -ArgumentList '-jar', 'signum-node.jar'"

exit
"@

		$content | Out-File -FilePath $SIGNUM_POOL_TESTNET_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_POOL_TESTNET_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_POOL_TESTNET_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_POOL_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_POOL_STARTER_EXEC} ${SIGNUM_POOL_TESTNET_STARTER_EXEC_PATH}

    # Install MariaDB
	if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
		question-prompt "Reinstall" "MariaDB" {install_mariadb}
    } else {
		Write-Host "MariaDB is not yet installed."
		question-prompt "Install" "MariaDB" {install_mariadb}
	}

    # Setup MariaDB for Signum Pool Testnet
    question-prompt "Setup" "MariaDB for Signum Pool Testnet" {setup_mariadb "Signum Pool Testnet" "signum-pool-testnet" "signumuser_pool_testnet" "signumpassword"}
	
	if ($global:UserResponse -eq "yes") {	
		# Update database information in pool.properties
		setup_db_pool_properties ${SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_PATH}
	}
	
	# Setup pool.properties
	question-prompt "Setup" "Signum Pool Testnet Properties" {setup_signumpool $SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_PATH $SIGNUM_POOL_SIGNUM_NODE_TESTNET_PROPERTIES_ORIGINAL_PATH "testnet"}

	# TODO Create start-node-v8.2.0-mariadb-v10.20.0.bat in root to start specific versions
	# TODO start-node-node.bat should be bat and start-mariadb.bat should be bat as well and OS spacific or ps1 + ps1 executer bat

    Write-Host "Signum Pool Testnet Installation complete."
    # Pause
	
	# Insall Signum Testnet if not installed yet
	if (Test-Path $SIGNUM_NODE_TESTNET_STARTER_PS1_PATH) {
		Write-Host "Signum Node Testnet $SIGNUM_NODE_TESTNET_VERSION already installed."
		question-prompt "Reinstall" "Signum Node Testnet" {Install-SignumTestnet}
	} else {
		Write-Host "Signum Node Testnet $SIGNUM_NODE_TESTNET_VERSION is not yet installed."
		question-prompt "Install" "Signum Node Testnet" {Install-SignumTestnet}
		Pause
	}
	
<#	
	if (-not (Test-Path -Path "${SIGNUM_POOL_MAINNET_STARTER_PS1_PATH}")) {
        question-prompt "Install" "Signum Pool Mainnet" Install-SignumPoolMainnet
    }
#>		
}

function Install-SignumExplorerMainnet {
    Write-Host "Installing Signum Exporer Mainnet ..."

	# install-process $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH "Signum Mainnet" {Install-SignumMainnet}

    # Create Explorer directory
    if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_EXPLORER_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_EXPLORER_MAINNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_ZIP_PATH}") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_ZIP_PATH} already downloaded."
    } else {
        # Download the Signum Explorer Mainnet zip file
        Write-Host "Downloading Signum Explorer from GitHub ..."
        # Start-BitsTransfer -Source "${SIGNUM_EXPLORER_MAINNET_URL}" -Destination "${SIGNUM_EXPLORER_MAINNET_ZIP_PATH}"
		Invoke-WebRequest -Uri $SIGNUM_EXPLORER_MAINNET_URL -OutFile $SIGNUM_EXPLORER_MAINNET_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum Explorer."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum Explorer to ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_MAINNET_ZIP_PATH}" -DestinationPath "${SIGNUM_EXPLORER_MAINNET_DIR_PATH}" -Force
    }
	<#
	# Create python directory
    if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH}")) {
        New-Item -Path "${JAVA_POOL_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${JAVA_POOL_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${JAVA_POOL_MAINNET_DIR_PATH}"
    }
	#>
	
	# download python
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH}") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH} already downloaded."
    } else {
        # Download the python zip file
        Write-Host "Downloading Python ..."
        # Start-BitsTransfer -Source "${SIGNUM_EXPLORER_MAINNET_PYTHON_URL}" -Destination "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH}"
		Invoke-WebRequest -Uri $SIGNUM_EXPLORER_MAINNET_PYTHON_URL -OutFile $SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Python."
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip python
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\python.exe") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH} already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Python to ${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH}" -DestinationPath "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}" -Force
    }
	
	# unzip python310.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\python310") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_ZIP_PATH}\python310.zip already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Python310.zip to ${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\python310.zip" -DestinationPath "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\python310" -Force
    }
	
	# download get-pip.py from here: https://bootstrap.pypa.io/get-pip.py
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\get-pip.py") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\get-pip.py already downloaded."
    } else {
        # Download the get-pip.py file
        Write-Host "Downloading get-pip.py ..."
        # Start-BitsTransfer -Source "${SIGNUM_EXPLORER_MAINNET_PYTHON_GETPIP_URL}" -Destination "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\get-pip.py"
		Invoke-WebRequest -Uri $SIGNUM_EXPLORER_MAINNET_PYTHON_GETPIP_URL -OutFile ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\get-pip.py

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\get-pip.py")) {
            Write-Host "Error: Failed to download get-pip.py."
            Pause
            # Install-Menu
            return
        }
    }
	
	# download and unzipdownload and unzip to .\static
	# https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.2/fontawesome-free-6.5.2-web.zip
	# https://github.com/FortAwesome/Font-Awesome/releases/download/6.2.1/fontawesome-free-6.2.1-web.zip	
	
	# download fontawesome-free-6.5.2-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip already downloaded."
    } else {
        # Download the fontawesome-free-6.5.2-web.zip file
        Write-Host "Downloading fontawesome-free-6.5.2-web.zip ..."
        # Start-BitsTransfer -Source "https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.2/fontawesome-free-6.5.2-web.zip" -Destination "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip"
		Invoke-WebRequest -Uri "https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.2/fontawesome-free-6.5.2-web.zip" -OutFile ${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip")) {
            Write-Host "Error: Failed to download fontawesome-free-6.5.2-web.zip"
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip fontawesome-free-6.5.2-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping fontawesome-free-6.5.2-web to ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\static ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip" -DestinationPath "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static" -Force
    }
	
		# download fontawesome-free-6.2.1-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip already downloaded."
    } else {
        # Download the fontawesome-free-6.2.1-web.zip file
        Write-Host "Downloading fontawesome-free-6.2.1-web.zip ..."
        # Start-BitsTransfer -Source "https://github.com/FortAwesome/Font-Awesome/releases/download/6.2.1/fontawesome-free-6.2.1-web.zip" -Destination "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip"
		Invoke-WebRequest -Uri "https://github.com/FortAwesome/Font-Awesome/releases/download/6.2.1/fontawesome-free-6.2.1-web.zip" -OutFile ${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip")) {
            Write-Host "Error: Failed to download fontawesome-free-6.2.1-web.zip"
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip fontawesome-free-6.2.1-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping fontawesome-free-6.2.1-web to ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\static ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_MAINNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip" -DestinationPath "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\static" -Force
    }
	
	# run pyton get-pip.py command
	Write-Host "Installing get-pip.py"
	& "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\python.exe" "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\get-pip.py"
	
	# uncomment import site from python310._pth
	Write-Host "Setup python310._pth file"
	$content = Get-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\python310._pth
	
	$content = $content | ForEach-Object {
		$_ -replace "#import site", "import site"
	}

	# Write the changes back to the file
	$content | Set-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\python310._pth
	
	# installation
	& "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\Scripts\pip.exe" install setuptools
	& "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\Scripts\pip.exe" install maturin
	& "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\Scripts\pip.exe" install supervisor-win
	& "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\Scripts\pip.exe" install waitress
	& "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\Scripts\pip.exe" install -r ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\requirements.txt
	
	# create ./tmp/supervisord.pid if not exists
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\tmp\supervisord.pid") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\tmp\supervisord.pid already exists."
    } else {
		Write-Host "Create ./tmp/supervisord.pid file"
		New-Item -ItemType Directory -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\tmp" -Force | Out-Null
		New-Item -ItemType File -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\tmp\supervisord.pid" -Force | Out-Null
    }

	# copy supervisord.conf to supervisord_original.conf
	if (Test-Path -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\supervisord_original.conf") {
        Write-Host "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\supervisord_original.conf already exists."
    } else {
		Write-Host "Copy supervisord.conf to supervisord_original.conf file"
		Copy-Item -Path "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\supervisord.conf" -Destination "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\supervisord_original.conf"
    }
	
	# TODO setup supervisord username and password and change port if testnet is also running
<#
	[inet_http_server]
	port = 9000
	username = dummy
	password = changeme
#>
	
	# change supervisord.conf file
	Write-Host "Setup supervisord.conf file"
	
	$foundExplorer = $false
	$foundPeers = $false
	$foundTasks = $false
	$foundSNR = $false
	
	$content = Get-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\supervisord.conf
	$rowCount = $content.Count
	for ($i = 0; $i -lt $rowCount; $i++) {

		# Get the current line
		$line = $content[$i]
				
		if ($line -match "^\[program:Explorer\]") {
			$foundExplorer = $true
			$foundPeers = $false
			$foundTasks = $false
			$foundSNR = $false
		}
		
		if ($line -match "^\[program:Peers\]") {	
			$foundExplorer = $false
			$foundPeers = $true
			$foundTasks = $false
			$foundSNR = $false
		}
		
		if ($line -match "^\[program:Tasks\]") {
			$foundExplorer = $false
			$foundPeers = $false
			$foundTasks = $true
			$foundSNR = $false
		}
		
		if ($line -match "^\[program:SNR\]") {
			$foundExplorer = $false
			$foundPeers = $false
			$foundTasks = $false
			$foundSNR = $true
			$line = $line -replace "^\[program:SNR\]", ";[program:SNR]"
		}
		
		if ($foundExplorer) {
			if ($line -match "^stdout_logfile = /dev/stdout") {
				$line = ($line -replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout") + "`nstdout_logfile = explorer_stdout.log" + "`n;stdout_logfile = CON"
			}
		} 
		
		if ($foundPeers) {
			if ($line -match "^stdout_logfile = /dev/stdout") {
				$line = ($line -replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout") + "`nstdout_logfile = peers_stdout.log" + "`n;stdout_logfile = CON"
			}
		} 
		
		if ($foundTasks) {
			if ($line -match "^stdout_logfile = /dev/stdout") {
				$line = ($line -replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout") + "`nstdout_logfile = tasks_stdout.log" + "`n;stdout_logfile = CON"
			}
		} 
		
		if ($foundSNR) {
			$line = $line `
				-replace "^command =bash -c ""/path/to/your/snr/runSNR.sh\""", ";command =bash -c ""/path/to/your/snr/runSNR.sh""" `
				-replace "^autostart = true", ";autostart = true" `
				-replace "^autorestart = true", ";autorestart = true" `
				-replace "^startsecs = 1", ";startsecs = 1" `
				-replace "^redirect_stderr = true", ";redirect_stderr = true" `
				-replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout" `
				-replace "^stdout_logfile_maxbytes = 0", ";stdout_logfile_maxbytes = 0"
		
		}

		$line = $line `
			-replace "^\[unix_http_server\]", ";[unix_http_server]" `
			-replace "^port = 9001", "port = 9000" `
			-replace "^username = dummy", ";username = dummy" `
			-replace "^password = changeme", ";password = changeme" `
			-replace "^file = /tmp/supervisor.sock", ";file = ./tmp/supervisor.sock" `
			-replace "^pidfile = /tmp/supervisord.pid", "pidfile = ./tmp/supervisord.pid" `
			-replace "^chmod = 0700", ";chmod = 0700" `
			-replace "^serverurl = unix:///tmp/supervisor.sock", "serverurl = ./tmp/supervisor.sock" `
			-replace "^directory=.*", "directory=./" `
			-replace "^command = gunicorn config.wsgi -c gunicorn.conf.py", "command = ./python.exe run_waitress.py" `
			-replace "^command = python3 manage.py peers", "command = ./python.exe manage.py peers" `
			-replace "^command = python3 manage.py tasks", "command = ./python.exe manage.py tasks" `
			-replace "^logfile = /dev/null", ";logfile = /dev/null"

		$content[$i] = $line

	}
	
	# Write the changes back to the file
	$content | Set-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\supervisord.conf
	
	# Create run_waitress.py
	if (-not (Test-Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\run_waitress.py)) {
		# Create run_waitress.py file with the desired content
		$content = 
@"
import os
import multiprocessing
from waitress import serve
from dotenv import load_dotenv
load_dotenv()
from config.wsgi import application  # Adjust this import to point to your WSGI application

# Calculate optimal workers and threads
cpu_count = multiprocessing.cpu_count()
threads = 3 * cpu_count
timeout = 60

# Start waitress server
serve(
	application,
	host="0.0.0.0",
	port=5000,
	threads=threads,
	connection_limit=1000,  # Equivalent to Gunicorn's max_requests
	asyncore_use_poll=True,
	channel_timeout=timeout,
)
"@

		$content | Out-File -FilePath ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\run_waitress.py -Force

	Write-Host "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\run_waitress.py successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\run_waitress.py"
	}	
	
	# Create .env file
	if (-not (Test-Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env)) {
		# Create .env file with the desired content
		$content = 
@"
#APP_ENV=development
APP_ENV=production

# change secret key!
SECRET_KEY=secret_key

# mysql configuration
## ENGINE=django.db.backends.mysql
## OPTIONS={"init_command": "SET sql_mode='STRICT_TRANS_TABLES'", "charset": "utf8mb4"}
# DB_JAVA_WALLET required read-only access.

COINGECKO_PRICE_ID=SIGNUM

COINGECKO_PRICE_USD=0.000
COINGECKO_PRICE_BTC=0.000
COINGECKO_MKT_USD=0.000

COIN_SYMBOL=SIGNA
ADDRESS_PREFIX=S-

SITE_TITLE=Signum Explorer
#TEST_NET=true

DB_DEFAULT_ENGINE=django.db.backends.mysql
DB_DEFAULT_HOST=127.0.0.1
DB_DEFAULT_PORT=3306
DB_DEFAULT_NAME=signum-explorer-mainnet
DB_DEFAULT_USER=signumuser_explorer_mainnet
DB_DEFAULT_PASSWORD=signumpassword
DB_DEFAULT_OPTIONS={"init_command": "SET sql_mode='STRICT_TRANS_TABLES'", "charset": "utf8mb4"}

DB_JAVA_WALLET_ENGINE=django.db.backends.mysql
DB_JAVA_WALLET_HOST=127.0.0.1
DB_JAVA_WALLET_PORT=3306
DB_JAVA_WALLET_NAME=signum-node-mainnet
DB_JAVA_WALLET_USER=signumuser_node_mainnet_readonly
DB_JAVA_WALLET_PASSWORD=signumpassword
DB_JAVA_WALLET_OPTIONS={}

CACHE_DEFAULT_HOST=localhost
CACHE_DEFAULT_PORT=6379
CACHE_DEFAULT_DB=0

CELERY_BROKER_HOST=localhost
CELERY_BROKER_PORT=6379
CELERY_BROKER_DB=1

GOOGLE_TRACKING_ID=
SENTRY_DSN=
SIGNUM_NODE=localhost
WALLET_URL=https://signumwallet.ddns.net:8128/
BRS_BOOTSTRAP_PEERS=["signumwallet.ddns.net:8123", "taylorforce.synology.me:8123", "zwurg.feste-ip.net:51940", "zmail.cloudns.ph:8123"]
DEFAULT_P2P_PORT=8123
DEFAULT_API_V1_PORT=8125

BRS_P2P_VERSION = $SIGNUM_NODE_MAINNET_VERSION
MIN_PEER_VERSION = 3.8.0

#FEATURED_ASSETS=["12402415494995249540", "13240027460799312630", "11955007191311588286"]
#PHISHING_ASSETS=["SIGNA", "SIGNUM", "BTC", "USDT", "BNB", "BURST", "SIGNAINU"]
#BLOCKED_ASSETS=["NIGGERS", "CHLDPORN", "YWNBAW"]

PEERS_SCAN_DELAY=90
MIN_PEER_VERSION = 1.1.1

# Delay between task.py execution
TASKS_SCAN_DELAY=60
"@

		$content | Out-File -FilePath ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env -Force

		Write-Host "${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env"
	}
	
	# Comment out redis from settings.py
	Write-Host "Setup settings.py"
	
	$content = Get-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\config\settings.py
	
	for ($i = 0; $i -lt $content.Count; $i++) {

		# Get the current line
		$line = $content[$i]

		if ($line -match '^\s*"OPTIONS": \{"CLIENT_CLASS": "django_redis\.client\.DefaultClient"\},') {
			if ($content[$i+2] -match "\}$")
				{
					$content[$i+2] = "$($content[$i + 2])'''"
				}
		}

		# Apply replacements to the line
		$content[$i] = $line `
			-replace "^\s*from sentry_sdk.integrations.redis import RedisIntegration", "#    from sentry_sdk.integrations.redis import RedisIntegration" `
			-replace "^\s*RedisIntegration\(\),", "#            RedisIntegration()," `
			-replace "^CACHES = \{", "'''CACHES = {" 
	}

	# Write the changes back to the file
	$content | Set-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\config\settings.py

	$port = 5000
	$port1 = 9000

	# Create starter ps1
	if (-not (Test-Path $SIGNUM_EXPLORER_MAINNET_STARTER_PS1_PATH)) {
		# Create start-explorer.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start Signum Node
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting MariaDB ...'

# Start MariaDB
..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$MARIADB_STARTER_PS1_PATH" "-WindowStyle Minimized"
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-File", "..\..\..\$MARIADB_STARTER_PS1_PATH" -WindowStyle Minimized

Write-Host 'Starting Signum Node Mainnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$SIGNUM_NODE_MAINNET_STARTER_PS1_PATH" "-WindowStyle Minimized"

Write-Host 'Starting Signum Explorer Mainnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

# Start Signum Explorer
# Start-Process -FilePath "jre\${JAVA_POOL_MAINNET_UNZIP}\bin\java" -ArgumentList "-jar", "signum-pool.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", ".\Scripts\supervisord.exe -n -c .\supervisord.conf" -WindowStyle Hidden
# Last OK
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'Signum Explorer Mainnet'; .\Scripts\supervisord.exe -n -c .\supervisord.conf" -WindowStyle Minimized
# Start-Process -FilePath ".\Scripts\supervisord.exe -n -c .\supervisord.conf" -WindowStyle Minimized

Write-Host 'Starting Signum Explorer Mainnet ...'
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'Signum Explorer Mainnet'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'Signum Explorer Mainnet is already running.'
			exit
		} else {
			# Start Signum Explorer Mainnet
			Start-Process "http://localhost:$port1"
			Start-Process "http://localhost:$port"
			.\Scripts\supervisord.exe -n -c .\supervisord.conf
		}
    } catch {
        Write-Host 'An error occurred while starting Signum Explorer Mainnet: `$_'
    } finally {
        # Always set the title to 'Signum Explorer Mainnet Stopped' after Signum Explorer Mainnet exits
        ```$host.UI.RawUI.WindowTitle = 'Signum Explorer Mainnet Stopped'
    }
"`@ ``
    -WindowStyle Minimized

# TODO check
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\jre\bin\java -jar signum-node.jar -WindowStyle Minimized
# "jre\bin\java" "-jar" "signum-node.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "Set-Title 'Signum Mainnet Node'; Start-Process -NoNewWindow -FilePath 'jre\bin\java' -ArgumentList '-jar', 'signum-node.jar'"

exit
"@

		$content | Out-File -FilePath $SIGNUM_EXPLORER_MAINNET_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_EXPLORER_MAINNET_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_EXPLORER_MAINNET_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_EXPLORER_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_EXPLORER_STARTER_EXEC} ${SIGNUM_EXPLORER_MAINNET_STARTER_EXEC_PATH}

    # Install MariaDB
	if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
		question-prompt "Reinstall" "MariaDB" {install_mariadb}
    } else {
		Write-Host "MariaDB is not yet installed."
		question-prompt "Install" "MariaDB" {install_mariadb}
	}

    # Setup MariaDB for Signum Pool Mainnet
    question-prompt "Setup" "MariaDB for Signum Explorer Mainnet" {setup_mariadb_explorer "Signum Explorer Mainnet" "signum-explorer-mainnet" "signumuser_explorer_mainnet" "signumpassword"}
	
	if ($global:UserResponse -eq "yes") {
		# Setup .env file with the Signum Explorer database values
		$content = Get-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env
		
		$content = $content | ForEach-Object {
					$_  -replace "^DB_DEFAULT_NAME=.*", "DB_DEFAULT_NAME=$global:DATABASE_NAME" `
						-replace "^DB_DEFAULT_USER=.*", "DB_DEFAULT_USER=$global:DATABASE_USERNAME" `
						-replace "^DB_DEFAULT_PASSWORD=.*", "DB_DEFAULT_PASSWORD=$global:DATABASE_PASSWORD"
				}

		# Write the changes back to the file
		$content | Set-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env
	}
	
	# At this point you have to have Signum Node to install
	if (Test-Path $SIGNUM_NODE_MAINNET_STARTER_PS1_PATH) {
		Write-Host "Signum Node Mainnet $SIGNUM_NODE_MAINNET_VERSION already installed."
		question-prompt "Reinstall" "Signum Node Mainnet" {Install-SignumMainnet}
	} else {
		Write-Host "Signum Node Mainnet $SIGNUM_NODE_MAINNET_VERSION is not yet installed."
		question-prompt "Install" "Signum Node Mainnet" {Install-SignumMainnet}
		# Pause
	}
	
	Write-Host "Populate database informations from installed Signum Node Mainnet properties."

	# Read the node.properties file content
	$content = Get-Content -Path $SIGNUM_NODE_MAINNET_PROPERTIES_PATH
	
	# Initialize variables
	$dbName = $null
	$username = $null
	$password = $null
	
	# Extract the database information fom node.properties
	$content | ForEach-Object {
		if ($_ -match '^DB\.Url=jdbc:mariadb://.+/(.+)') {
			$dbName = $matches[1]
		}
		elseif ($_ -match '^DB\.Username=(.+)') {
			$username = $matches[1]
		}
		elseif ($_ -match '^DB\.Password=(.+)') {
			$password = $matches[1]
		}
	}

	# Display the extracted information
	Write-Output "Signum Mainnet Node Database Name: $dbName"
	# Write-Output "Signum Mainnet Node Database Username: $username"
	# Write-Output "Signum Mainnet Node Database Password: $password"

	# Create Read Only User for Signum Node Mainnet database access for explorer
	Write-Host "Create Read Only User for Signum Node Mainnet database access for explorer"
	question-prompt "Setup" "MariaDB for Signum Explorer Mainnet Read Only Node connection" {setup_mariadb_readonly "Signum Explorer Mainnet Node connection" "$dbName" "signumuser_node_mainnet_readonly" "signumpassword"}

	if ($global:UserResponse -eq "yes") {	
		# Setup .env file with the Signum Explorer database values
		$content = Get-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env
		
		$content = $content | ForEach-Object {
					$_  -replace "^DB_JAVA_WALLET_NAME=.*", "DB_JAVA_WALLET_NAME=$global:DATABASE_NAME" `
						-replace "^DB_JAVA_WALLET_USER=.*", "DB_JAVA_WALLET_USER=$global:DATABASE_USERNAME" `
						-replace "^DB_JAVA_WALLET_PASSWORD=.*", "DB_JAVA_WALLET_PASSWORD=$global:DATABASE_PASSWORD"
				}
			
		# Write the changes back to the file
		$content | Set-Content -Path ${SIGNUM_EXPLORER_MAINNET_UNZIP_PATH}\.env
	}
	
	# TODO further setup of .env and run_waitress.py if want

    Write-Host "Signum Explorer Mainnet Installation complete."
	
}

function Install-SignumExplorerTestnet {
    Write-Host "Installing Signum Exporer Testnet ..."

	# install-process $SIGNUM_NODE_TESTNET_STARTER_PS1_PATH "Signum Testnet" {Install-SignumTestnet}

    # Create Explorer directory
    if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_EXPLORER_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_EXPLORER_TESTNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_ZIP_PATH}") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_ZIP_PATH} already downloaded."
    } else {
        # Download the Signum Explorer Testnet zip file
        Write-Host "Downloading Signum Explorer from GitHub ..."
        # Start-BitsTransfer -Source "${SIGNUM_EXPLORER_TESTNET_URL}" -Destination "${SIGNUM_EXPLORER_TESTNET_ZIP_PATH}"
		Invoke-WebRequest -Uri ${SIGNUM_EXPLORER_TESTNET_URL} -OutFile ${SIGNUM_EXPLORER_TESTNET_ZIP_PATH}

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum Explorer."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum Explorer to ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_TESTNET_ZIP_PATH}" -DestinationPath "${SIGNUM_EXPLORER_TESTNET_DIR_PATH}" -Force
    }
	<#
	# Create python directory
    if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}")) {
        New-Item -Path "${JAVA_POOL_TESTNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${JAVA_POOL_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${JAVA_POOL_TESTNET_DIR_PATH}"
    }
	#>
	
	# download python
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH} already downloaded."
    } else {
        # Download the python zip file
        Write-Host "Downloading Python ..."
        # Start-BitsTransfer -Source "${SIGNUM_EXPLORER_TESTNET_PYTHON_URL}" -Destination "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}"
		Invoke-WebRequest -Uri ${SIGNUM_EXPLORER_TESTNET_PYTHON_URL} -OutFile ${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Python."
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip python
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\python.exe") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH} already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Python to ${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}" -DestinationPath "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}" -Force
    }
	
	# unzip python310.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\python310") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_ZIP_PATH}\python310.zip already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Python310.zip to ${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\python310.zip" -DestinationPath "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\python310" -Force
    }
	
	# download get-pip.py from here: https://bootstrap.pypa.io/get-pip.py
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\get-pip.py") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\get-pip.py already downloaded."
    } else {
        # Download the get-pip.py file
        Write-Host "Downloading get-pip.py ..."
        # Start-BitsTransfer -Source "${SIGNUM_EXPLORER_TESTNET_PYTHON_GETPIP_URL}" -Destination "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\get-pip.py"
		Invoke-WebRequest -Uri ${SIGNUM_EXPLORER_TESTNET_PYTHON_GETPIP_URL} -OutFile ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\get-pip.py

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\get-pip.py")) {
            Write-Host "Error: Failed to download get-pip.py."
            Pause
            # Install-Menu
            return
        }
    }
	
	# download and unzipdownload and unzip to .\static
	# https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.2/fontawesome-free-6.5.2-web.zip
	# https://github.com/FortAwesome/Font-Awesome/releases/download/6.2.1/fontawesome-free-6.2.1-web.zip	
	
	# download fontawesome-free-6.5.2-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip already downloaded."
    } else {
        # Download the fontawesome-free-6.5.2-web.zip file
        Write-Host "Downloading fontawesome-free-6.5.2-web.zip ..."
        # Start-BitsTransfer -Source "https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.2/fontawesome-free-6.5.2-web.zip" -Destination "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip"
		Invoke-WebRequest -Uri "https://github.com/FortAwesome/Font-Awesome/releases/download/6.5.2/fontawesome-free-6.5.2-web.zip" -OutFile ${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip
		
        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip")) {
            Write-Host "Error: Failed to download fontawesome-free-6.5.2-web.zip"
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip fontawesome-free-6.5.2-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping fontawesome-free-6.5.2-web to ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\static ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.5.2-web.zip" -DestinationPath "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static" -Force
    }
	
		# download fontawesome-free-6.2.1-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip already downloaded."
    } else {
        # Download the fontawesome-free-6.2.1-web.zip file
        Write-Host "Downloading fontawesome-free-6.2.1-web.zip ..."
        # Start-BitsTransfer -Source "https://github.com/FortAwesome/Font-Awesome/releases/download/6.2.1/fontawesome-free-6.2.1-web.zip" -Destination "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip"
		Invoke-WebRequest -Uri "https://github.com/FortAwesome/Font-Awesome/releases/download/6.2.1/fontawesome-free-6.2.1-web.zip" -OutFile ${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip
		
        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip")) {
            Write-Host "Error: Failed to download fontawesome-free-6.2.1-web.zip"
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip fontawesome-free-6.2.1-web.zip
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping fontawesome-free-6.2.1-web to ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\static ..."
        Expand-Archive -Path "${SIGNUM_EXPLORER_TESTNET_PYTHON_UNZIP_PATH}\static\fontawesome-free-6.2.1-web.zip" -DestinationPath "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\static" -Force
    }
	
	# run pyton get-pip.py command
	Write-Host "Installing get-pip.py"
	& "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\python.exe" "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\get-pip.py"
	
	# uncomment import site from python310._pth
	Write-Host "Setup python310._pth file"
	$content = Get-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\python310._pth
	
	$content = $content | ForEach-Object {
		$_ -replace "#import site", "import site"
	}

	# Write the changes back to the file
	$content | Set-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\python310._pth
	
	# installation
	& "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\Scripts\pip.exe" install setuptools
	& "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\Scripts\pip.exe" install maturin
	& "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\Scripts\pip.exe" install supervisor-win
	& "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\Scripts\pip.exe" install waitress
	& "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\Scripts\pip.exe" install -r ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\requirements.txt
	
	# create ./tmp/supervisord.pid if not exists
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\tmp\supervisord.pid") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\tmp\supervisord.pid already exists."
    } else {
		Write-Host "Create ./tmp/supervisord.pid file"
		New-Item -ItemType Directory -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\tmp" -Force | Out-Null
		New-Item -ItemType File -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\tmp\supervisord.pid" -Force | Out-Null
    }

	# copy supervisord.conf to supervisord_original.conf
	if (Test-Path -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\supervisord_original.conf") {
        Write-Host "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\supervisord_original.conf already exists."
    } else {
		Write-Host "Copy supervisord.conf to supervisord_original.conf file"
		Copy-Item -Path "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\supervisord.conf" -Destination "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\supervisord_original.conf"
    }
	
	# change supervisord.conf file
	Write-Host "Setup supervisord.conf file"
	
	$foundExplorer = $false
	$foundPeers = $false
	$foundTasks = $false
	$foundSNR = $false
	
	$content = Get-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\supervisord.conf
	
	$rowCount = $content.Count
	for ($i = 0; $i -lt $rowCount; $i++) {

		# Get the current line
		$line = $content[$i]

		if ($line -match "^\[program:Explorer\]") {
			$foundExplorer = $true
			$foundPeers = $false
			$foundTasks = $false
			$foundSNR = $false
		}
		
		if ($line -match "^\[program:Peers\]") {	
			$foundExplorer = $false
			$foundPeers = $true
			$foundTasks = $false
			$foundSNR = $false
		}
		
		if ($line -match "^\[program:Tasks\]") {
			$foundExplorer = $false
			$foundPeers = $false
			$foundTasks = $true
			$foundSNR = $false
		}
		
		if ($line -match "^\[program:SNR\]") {
			$foundExplorer = $false
			$foundPeers = $false
			$foundTasks = $false
			$foundSNR = $true
			$line = $line -replace "^\[program:SNR\]", ";[program:SNR]"
		}
		
		if ($foundExplorer) {
			if ($line -match "^stdout_logfile = /dev/stdout") {
				$line = ($line -replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout") + "`nstdout_logfile = explorer_stdout.log" + "`n;stdout_logfile = CON"
			}
		}
		
		if ($foundPeers) {
			if ($line -match "^stdout_logfile = /dev/stdout") {
				$line = ($line -replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout") + "`nstdout_logfile = peers_stdout.log" + "`n;stdout_logfile = CON"
			}
		}
		
		if ($foundTasks) {
			if ($line -match "^stdout_logfile = /dev/stdout") {
				$line = ($line -replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout") + "`nstdout_logfile = tasks_stdout.log" + "`n;stdout_logfile = CON"
			}
		}
		
		if ($foundSNR) {
			
			$line = $line `
				-replace "^command =bash -c ""/path/to/your/snr/runSNR.sh\""", ";command =bash -c ""/path/to/your/snr/runSNR.sh""" `
				-replace "^autostart = true", ";autostart = true" `
				-replace "^autorestart = true", ";autorestart = true" `
				-replace "^startsecs = 1", ";startsecs = 1" `
				-replace "^redirect_stderr = true", ";redirect_stderr = true" `
				-replace "^stdout_logfile = /dev/stdout", ";stdout_logfile = /dev/stdout" `
				-replace "^stdout_logfile_maxbytes = 0", ";stdout_logfile_maxbytes = 0"
		
		}

		$line = $line `
			-replace "^\[unix_http_server\]", ";[unix_http_server]" `
			-replace "^username = dummy", ";username = dummy" `
			-replace "^password = changeme", ";password = changeme" `
			-replace "^file = /tmp/supervisor.sock", ";file = ./tmp/supervisor.sock" `
			-replace "^pidfile = /tmp/supervisord.pid", "pidfile = ./tmp/supervisord.pid" `
			-replace "^chmod = 0700", ";chmod = 0700" `
			-replace "^serverurl = unix:///tmp/supervisor.sock", "serverurl = ./tmp/supervisor.sock" `
			-replace "^directory=.*", "directory=./" `
			-replace "^command = gunicorn config.wsgi -c gunicorn.conf.py", "command = ./python.exe run_waitress.py" `
			-replace "^command = python3 manage.py peers", "command = ./python.exe manage.py peers" `
			-replace "^command = python3 manage.py tasks", "command = ./python.exe manage.py tasks" `
			-replace "^logfile = /dev/null", ";logfile = /dev/null"

			$content[$i] = $line

	}
	
	# Write the changes back to the file
	$content | Set-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\supervisord.conf
	
	# Create run_waitress.py
	if (-not (Test-Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\run_waitress.py)) {
		# Create run_waitress.py file with the desired content
		$content = 
@"
import os
import multiprocessing
from waitress import serve
from dotenv import load_dotenv
load_dotenv()
from config.wsgi import application  # Adjust this import to point to your WSGI application

# Calculate optimal workers and threads
cpu_count = multiprocessing.cpu_count()
threads = 3 * cpu_count
timeout = 60

# Start waitress server
serve(
	application,
	host="0.0.0.0",
	port=5001,
	threads=threads,
	connection_limit=1000,  # Equivalent to Gunicorn's max_requests
	asyncore_use_poll=True,
	channel_timeout=timeout,
)
"@

		$content | Out-File -FilePath ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\run_waitress.py -Force

	Write-Host "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\run_waitress.py successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\run_waitress.py"
	}	
	
	# Create .env file
	if (-not (Test-Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env)) {
		# Create .env file with the desired content
		$content = 
@"
#APP_ENV=development
APP_ENV=production

# change secret key!
SECRET_KEY=secret_key

# mysql configuration
## ENGINE=django.db.backends.mysql
## OPTIONS={"init_command": "SET sql_mode='STRICT_TRANS_TABLES'", "charset": "utf8mb4"}
# DB_JAVA_WALLET required read-only access.

COINGECKO_PRICE_ID=SIGNUM

COINGECKO_PRICE_USD=0.000
COINGECKO_PRICE_BTC=0.000
COINGECKO_MKT_USD=0.000

COIN_SYMBOL=SIGNA
ADDRESS_PREFIX=S-

SITE_TITLE=Signum Explorer
TEST_NET=true

DB_DEFAULT_ENGINE=django.db.backends.mysql
DB_DEFAULT_HOST=127.0.0.1
DB_DEFAULT_PORT=3306
DB_DEFAULT_NAME=signum-explorer-testnet
DB_DEFAULT_USER=signumuser_explorer_testnet
DB_DEFAULT_PASSWORD=signumpassword
DB_DEFAULT_OPTIONS={"init_command": "SET sql_mode='STRICT_TRANS_TABLES'", "charset": "utf8mb4"}

DB_JAVA_WALLET_ENGINE=django.db.backends.mysql
DB_JAVA_WALLET_HOST=127.0.0.1
DB_JAVA_WALLET_PORT=3306
DB_JAVA_WALLET_NAME=signum-node-testnet
DB_JAVA_WALLET_USER=signumuser_node_testnet_readonly
DB_JAVA_WALLET_PASSWORD=signumpassword
DB_JAVA_WALLET_OPTIONS={}

CACHE_DEFAULT_HOST=localhost
CACHE_DEFAULT_PORT=6379
CACHE_DEFAULT_DB=0

CELERY_BROKER_HOST=localhost
CELERY_BROKER_PORT=6379
CELERY_BROKER_DB=1

GOOGLE_TRACKING_ID=
SENTRY_DSN=
SIGNUM_NODE=localhost
WALLET_URL=https://signumwallettestnet.ddns.net:8138/
BRS_BOOTSTRAP_PEERS=["signumwallettestnet.ddns.net:8138"]
DEFAULT_P2P_PORT=7123
DEFAULT_API_V1_PORT=6876

BRS_P2P_VERSION = $SIGNUM_NODE_TESTNET_VERSION
MIN_PEER_VERSION = 3.8.0

#FEATURED_ASSETS=["12402415494995249540", "13240027460799312630", "11955007191311588286"]
#PHISHING_ASSETS=["SIGNA", "SIGNUM", "BTC", "USDT", "BNB", "BURST", "SIGNAINU"]
#BLOCKED_ASSETS=["NIGGERS", "CHLDPORN", "YWNBAW"]

PEERS_SCAN_DELAY=90
MIN_PEER_VERSION = 1.1.1

# Delay between task.py execution
TASKS_SCAN_DELAY=60
"@

		$content | Out-File -FilePath ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env -Force

		Write-Host "${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env"
	}
	
	# Comment out redis from settings.py
	Write-Host "Setup settings.py"
	
	$content = Get-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\config\settings.py
	
	for ($i = 0; $i -lt $content.Count; $i++) {
		# Get the current line
		$line = $content[$i] 

		if ($line -match '^\s*"OPTIONS": \{"CLIENT_CLASS": "django_redis\.client\.DefaultClient"\},') {
			if ($content[$i+2] -match "\}$")
				{
					$content[$i+2] = "$($content[$i + 2])'''"
				}
		}

		# Apply replacements to the line
		$content[$i] = $line `
			-replace "^\s*from sentry_sdk.integrations.redis import RedisIntegration", "#    from sentry_sdk.integrations.redis import RedisIntegration" `
			-replace "^\s*RedisIntegration\(\),", "#            RedisIntegration()," `
			-replace "^CACHES = \{", "'''CACHES = {" 
	}

	# Write the changes back to the file
	$content | Set-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\config\settings.py

	$port = 5001
	$port1 = 9001

	# Create starter ps1
	if (-not (Test-Path $SIGNUM_EXPLORER_TESTNET_STARTER_PS1_PATH)) {
		# Create start-explorer.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start Signum Node
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting MariaDB ...'

# Start MariaDB
..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$MARIADB_STARTER_PS1_PATH" "-WindowStyle Minimized"
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-File", "..\..\..\$MARIADB_STARTER_PS1_PATH" -WindowStyle Minimized

Write-Host 'Starting Signum Node Testnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$SIGNUM_NODE_TESTNET_STARTER_PS1_PATH" "-WindowStyle Minimized"

Write-Host 'Starting Signum Explorer Testnet ...'

Start-Sleep -Seconds $SLEEP_SECONDS

# Start Signum Explorer
# Start-Process -FilePath "jre\${JAVA_POOL_TESTNET_UNZIP}\bin\java" -ArgumentList "-jar", "signum-pool.jar" -WindowStyle Minimized
# Last OK
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'Signum Explorer Testnet'; .\Scripts\supervisord.exe -n -c .\supervisord.conf" -WindowStyle Minimized
# & ..\..\..\$POWERSHELL_EXEC_PATH -ArgumentList "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'Signum Explorer Testnet'; .\Scripts\supervisord.exe -n -c .\supervisord.conf" -WindowStyle Minimized
# Start-Process -FilePath ".\Scripts\supervisord.exe -n -c .\supervisord.conf" -WindowStyle Minimized

Write-Host 'Starting Signum Explorer Testnet ...'
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'Signum Explorer Testnet'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'Signum Explorer Testnet is already running.'
			exit
		} else {
			# Start Signum Explorer Testnet
			Start-Process "http://localhost:$port1"
			Start-Process "http://localhost:$port"
			.\Scripts\supervisord.exe -n -c .\supervisord.conf
		}
    } catch {
        Write-Host 'An error occurred while starting Signum Explorer Testnet: `$_'
    } finally {
        # Always set the title to 'Signum Explorer Testnet Stopped' after Signum Explorer Testnet exits
        ```$host.UI.RawUI.WindowTitle = 'Signum Explorer Testnet Stopped'
    }
"`@ ``
    -WindowStyle Minimized

# TODO check
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\jre\bin\java -jar signum-node.jar -WindowStyle Minimized
# "jre\bin\java" "-jar" "signum-node.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "Set-Title 'Signum Testnet Node'; Start-Process -NoNewWindow -FilePath 'jre\bin\java' -ArgumentList '-jar', 'signum-node.jar'"

exit
"@

		$content | Out-File -FilePath $SIGNUM_EXPLORER_TESTNET_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_EXPLORER_TESTNET_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_EXPLORER_TESTNET_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_EXPLORER_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_EXPLORER_STARTER_EXEC} ${SIGNUM_EXPLORER_TESTNET_STARTER_EXEC_PATH}

    # Install MariaDB
	if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
		question-prompt "Reinstall" "MariaDB" {install_mariadb}
    } else {
		Write-Host "MariaDB is not yet installed."
		question-prompt "Install" "MariaDB" {install_mariadb}
	}

    # Setup MariaDB for Signum Pool Testnet
    question-prompt "Setup" "MariaDB for Signum Explorer Testnet" {setup_mariadb_explorer "Signum Explorer Testnet" "signum-explorer-testnet" "signumuser_explorer_testnet" "signumpassword"}
	
	if ($global:UserResponse -eq "yes") {	
		# Setup .env file with the Signum Explorer database values
		$content = Get-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env
		
		$content = $content | ForEach-Object {
					$_  -replace "^DB_DEFAULT_NAME=.*", "DB_DEFAULT_NAME=$global:DATABASE_NAME" `
						-replace "^DB_DEFAULT_USER=.*", "DB_DEFAULT_USER=$global:DATABASE_USERNAME" `
						-replace "^DB_DEFAULT_PASSWORD=.*", "DB_DEFAULT_PASSWORD=$global:DATABASE_PASSWORD"
				}

		# Write the changes back to the file
		$content | Set-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env
	}
	
	# At this point you have to have Signum Node to install
	if (Test-Path $SIGNUM_NODE_TESTNET_STARTER_PS1_PATH) {
		Write-Host "Signum Node Testnet $SIGNUM_NODE_TESTNET_VERSION already installed."
		question-prompt "Reinstall" "Signum Node Testnet" {Install-SignumTestnet}
	} else {
		Write-Host "Signum Node Testnet $SIGNUM_NODE_TESTNET_VERSION is not yet installed."
		question-prompt "Install" "Signum Node Testnet" {Install-SignumTestnet}
		Pause
	}
	
	Write-Host "Populate database informations from installed Signum Node Testnet properties."
	
	# Read the node.properties file content
	$content = Get-Content -Path $SIGNUM_NODE_TESTNET_PROPERTIES_PATH

	# Initialize variables
	$dbName = $null
	$username = $null
	$password = $null
	
	# Extract the database information
	$content | ForEach-Object {
		if ($_ -match '^DB\.Url=jdbc:mariadb://.+/(.+)') {
			$dbName = $matches[1]
		}
		elseif ($_ -match '^DB\.Username=(.+)') {
			$username = $matches[1]
		}
		elseif ($_ -match '^DB\.Password=(.+)') {
			$password = $matches[1]
		}
	}

	# Display the extracted information
	Write-Output "Signum Mainnet Node Database Name: $dbName"
	# Write-Output "Signum Mainnet Node Database Username: $username"
	# Write-Output "Signum Mainnet Node Database Password: $password"
	
	# Create Read Only User for Signum Node Testnet database access for explorer
	Write-Host "Create Read Only User for Signum Node Testnet database access for explorer"
	question-prompt "Setup" "MariaDB for Signum Explorer Testnet Read Only Node connection" {setup_mariadb_readonly "Signum Explorer Testnet Node connection" "$dbName" "signumuser_node_testnet_readonly" "signumpassword"}
	
	if ($global:UserResponse -eq "yes") {	
		# Setup .env file with the Signum Explorer database values
		$content = Get-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env
		
		$content = $content | ForEach-Object {
					$_  -replace "^DB_JAVA_WALLET_NAME=.*", "DB_JAVA_WALLET_NAME=$global:DATABASE_NAME" `
						-replace "^DB_JAVA_WALLET_USER=.*", "DB_JAVA_WALLET_USER=$global:DATABASE_USERNAME" `
						-replace "^DB_JAVA_WALLET_PASSWORD=.*", "DB_JAVA_WALLET_PASSWORD=$global:DATABASE_PASSWORD"
				}
				
		# Write the changes back to the file
		$content | Set-Content -Path ${SIGNUM_EXPLORER_TESTNET_UNZIP_PATH}\.env	
	}
	
	# TODO further setup of .env and run_waitress.py if want

    Write-Host "Signum Explorer Testnet Installation complete."
	
}

function install-smartc-web-ui {
    Write-Host "Installing SmartC WEB UI Smart Contract Compiler ..."
	
	# Create SmartContract directory
    if (-not (Test-Path "${SMART_CONTRACT_DIR}")) {
        New-Item -ItemType Directory -Path "${SMART_CONTRACT_DIR}" | Out-Null
        Write-Host "Created directory: ${SMART_CONTRACT_DIR}"
    } else {
        Write-Host "Directory already exists: ${SMART_CONTRACT_DIR}"
    }

    if (Test-Path -Path "${SMARTC_WEB_UI_ZIP_PATH}") {
        Write-Host "${SMARTC_WEB_UI_ZIP_PATH} already downloaded."
    } else {
        # Download SmartC zip file
        Write-Host "Downloading SmartC WEB UI from GitHub ..."
        # Start-BitsTransfer -Source "${SMARTC_WEB_UI_URL}" -Destination "${SMARTC_WEB_UI_ZIP_PATH}"
		Invoke-WebRequest -Uri $SMARTC_WEB_UI_URL -OutFile $SMARTC_WEB_UI_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SMARTC_WEB_UI_ZIP_PATH}")) {
            Write-Host "Error: Failed to download SMARTC WEB UI."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SMARTC_WEB_UI_UNZIP_PATH}") {
        Write-Host "${SMARTC_WEB_UI_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SMARTC_WEB_UI_UNZIP_PATH} ..."
        Expand-Archive -Path "${SMARTC_WEB_UI_ZIP_PATH}" -DestinationPath "${SMART_CONTRACT_DIR}" -Force
		Rename-Item -Path $SMARTC_WEB_UI_ZIP_NAME_PATH -NewName $SMARTC_WEB_UI_UNZIP
    }
	
	# Initialize package.json
	Write-Host "Initialize package.json"	
	$content = Get-Content -Path $SMARTC_WEB_UI_UNZIP_PATH\package.json

		# Process each line using regex to add '#' only if there's no '#' before the target
		$content = $content | ForEach-Object {
			$_ 	-replace "npm run dev", "npm run build" `
				-replace '"dev": "TARGET=dev', '"dev": "set TARGET=dev'
		}

		# Write the changes back to the file
		$content | Set-Content -Path $SMARTC_WEB_UI_UNZIP_PATH\package.json
			
	Write-Host "package.json configuration initialized"	
	
	# Install node.js portable with npm
	install_nodejs
	
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
	# $NODEJS_UNZIP_PATH\npm config set prefix ./npm-global
	# $NODEJS_UNZIP_PATH\npm config set cache ./npm-cache
	
	# npm istall smarc web ui
	Write-Host "npm install SmarC packages"

	Set-Location .\$SMARTC_WEB_UI_UNZIP_PATH
	& ..\..\${NODEJS_UNZIP_PATH}\npm.cmd install
	
	Set-Location -Path $PSScriptRoot
	
	$port = 7000

	# Create starter ps1
	if (-not (Test-Path $SMARTC_WEB_UI_STARTER_PS1_PATH)) {
		# Create start-smartc.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start SmartC WEB UI
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting SmartC WEB UI ...'

Start-Process -FilePath "..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'SmartC WEB UI'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'SmartC WEB UI is already running.'
			exit
		} else {
			Write-Host 'Stop SmartC WEB UI: ctrl + c'
			# Start SmartC WEB UI
			Start-Process "http://localhost:$port"
			Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
			..\..\$NODEJS_UNZIP_PATH\npm.cmd run start
		}
    } catch {
        Write-Host 'An error occurred while starting SmartC WEB UI: `$_'
    } finally {
        # Always set the title to 'SmartC WEB UI Stopped' after SmartC WEB UI exits
        ```$host.UI.RawUI.WindowTitle = 'SmartC WEB UI Stopped'
    }
"`@ ``
    -WindowStyle Minimized

exit
"@

		$content | Out-File -FilePath $SMARTC_WEB_UI_STARTER_PS1_PATH -Force

		Write-Host "${SMARTC_WEB_UI_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SMARTC_WEB_UI_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SMARTC_WEB_UI_STARTER_PS1} ..\..\${POWERSHELL_EXEC_PATH} ${SMARTC_WEB_UI_STARTER_EXEC} ${SMARTC_WEB_UI_STARTER_EXEC_PATH}

}

function install-smartc-retro-ui {
    Write-Host "Installing SmartC RETRO UI Smart Contract Compiler ..."
	
	# Create SmartContract directory
    if (-not (Test-Path "${SMART_CONTRACT_DIR}")) {
        New-Item -ItemType Directory -Path "${SMART_CONTRACT_DIR}" | Out-Null
        Write-Host "Created directory: ${SMART_CONTRACT_DIR}"
    } else {
        Write-Host "Directory already exists: ${SMART_CONTRACT_DIR}"
    }

    if (Test-Path -Path "${SMARTC_RETRO_UI_ZIP_PATH}") {
        Write-Host "${SMARTC_RETRO_UI_ZIP_PATH} already downloaded."
    } else {
        # Download SmartC zip file
        Write-Host "Downloading SmartC RETRO UI from GitHub ..."
        # Start-BitsTransfer -Source "${SMARTC_RETRO_UI_URL}" -Destination "${SMARTC_RETRO_UI_ZIP_PATH}"
		Invoke-WebRequest -Uri $SMARTC_RETRO_UI_URL -OutFile $SMARTC_RETRO_UI_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SMARTC_RETRO_UI_ZIP_PATH}")) {
            Write-Host "Error: Failed to download SMARTC RETRO UI."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SMARTC_RETRO_UI_UNZIP_PATH}") {
        Write-Host "${SMARTC_RETRO_UI_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SMARTC_RETRO_UI_UNZIP_PATH} ..."
        Expand-Archive -Path "${SMARTC_RETRO_UI_ZIP_PATH}" -DestinationPath "${SMART_CONTRACT_DIR}" -Force
		Rename-Item -Path $SMARTC_RETRO_UI_ZIP_NAME_PATH -NewName $SMARTC_RETRO_UI_UNZIP
    }
	
	# Chanage port from 7000 to 7001
	Write-Host "Initialize package.json"	
	$content = Get-Content -Path $SMARTC_RETRO_UI_UNZIP_PATH\package.json

		# Process each line using regex to add '#' only if there's no '#' before the target
		$content = $content | ForEach-Object {
			$_ 	-replace "-p 7000", "-p 7001" `
				-replace "npm run dev", "npm run build" `
				-replace '"dev": "TARGET=dev', '"dev": "set TARGET=dev'
		}

		# Write the changes back to the file
		$content | Set-Content -Path $SMARTC_RETRO_UI_UNZIP_PATH\package.json
			
	Write-Host "package.json configuration initialized"	
	
	# Install node.js portable with npm
	install_nodejs
	
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
	# $NODEJS_UNZIP_PATH\npm config set prefix ./npm-global
	# $NODEJS_UNZIP_PATH\npm config set cache ./npm-cache
	
	# npm istall smarc web ui
	Write-Host "npm install SmarC packages"

	Set-Location .\$SMARTC_RETRO_UI_UNZIP_PATH
	& ..\..\${NODEJS_UNZIP_PATH}\npm.cmd install
	
	Set-Location -Path $PSScriptRoot
	
	$port = 7001

	# Create starter ps1
	if (-not (Test-Path $SMARTC_RETRO_UI_STARTER_PS1_PATH)) {
		# Create start-smartc.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start SmartC RETRO UI
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting SmartC RETRO UI ...'

Start-Process -FilePath "..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'SmartC RETRO UI'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'SmartC RETRO UI is already running.'
			exit
		} else {
			Write-Host 'Stop SmartC RETRO UI: ctrl + c'
			# Start SmartC RETRO UI
			Start-Process "http://localhost:$port"
			Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
			..\..\$NODEJS_UNZIP_PATH\npm.cmd run start
		}
    } catch {
        Write-Host 'An error occurred while starting SmartC RETRO UI: `$_'
    } finally {
        # Always set the title to 'SmartC RETRO UI Stopped' after SmartC RETRO UI exits
        ```$host.UI.RawUI.WindowTitle = 'SmartC RETRO UI Stopped'
    }
"`@ ``
    -WindowStyle Minimized

exit
"@

		$content | Out-File -FilePath $SMARTC_RETRO_UI_STARTER_PS1_PATH -Force

		Write-Host "${SMARTC_RETRO_UI_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SMARTC_RETRO_UI_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SMARTC_RETRO_UI_STARTER_PS1} ..\..\${POWERSHELL_EXEC_PATH} ${SMARTC_RETRO_UI_STARTER_EXEC} ${SMARTC_RETRO_UI_STARTER_EXEC_PATH}

}

function install-smartc-signum-decompiler {
    Write-Host "Installing SmartC SIGNUM Smart Contract Decompiler ..."
	
	# Create SmartContract directory
    if (-not (Test-Path "${SMART_CONTRACT_DIR}")) {
        New-Item -ItemType Directory -Path "${SMART_CONTRACT_DIR}" | Out-Null
        Write-Host "Created directory: ${SMART_CONTRACT_DIR}"
    } else {
        Write-Host "Directory already exists: ${SMART_CONTRACT_DIR}"
    }

    if (Test-Path -Path "${SMARTC_SIGNUM_DECOMPILER_ZIP_PATH}") {
        Write-Host "${SMARTC_SIGNUM_DECOMPILER_ZIP_PATH} already downloaded."
    } else {
        # Download SmartC zip file
        Write-Host "Downloading SmartC SIGNUM DECOMPILER from GitHub ..."
        # Start-BitsTransfer -Source "${SMARTC_SIGNUM_DECOMPILER_URL}" -Destination "${SMARTC_SIGNUM_DECOMPILER_ZIP_PATH}"
		Invoke-WebRequest -Uri $SMARTC_SIGNUM_DECOMPILER_URL -OutFile $SMARTC_SIGNUM_DECOMPILER_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SMARTC_SIGNUM_DECOMPILER_ZIP_PATH}")) {
            Write-Host "Error: Failed to download SMARTC SIGNUM DECOMPILER."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH}") {
        Write-Host "${SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH} ..."
        Expand-Archive -Path "${SMARTC_SIGNUM_DECOMPILER_ZIP_PATH}" -DestinationPath "${SMART_CONTRACT_DIR}" -Force
		Rename-Item -Path $SMARTC_SIGNUM_DECOMPILER_ZIP_NAME_PATH -NewName $SMARTC_SIGNUM_DECOMPILER_UNZIP
    }
	
	# Initialize package.json
	Write-Host "Initialize package.json"	
	$content = Get-Content -Path $SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH\package.json

		# Process each line using regex to add '#' only if there's no '#' before the target
		$content = $content | ForEach-Object {
			$_ 	-replace "-p 7001", "-p 7002" `
				-replace "npm run dev", "npm run build" `
				-replace '"dev": "TARGET=dev', '"dev": "set TARGET=dev'
		}

		# Write the changes back to the file
		$content | Set-Content -Path $SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH\package.json
			
	Write-Host "package.json configuration initialized"	
	
	# Install node.js portable with npm
	install_nodejs
	
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
	# $NODEJS_UNZIP_PATH\npm config set prefix ./npm-global
	# $NODEJS_UNZIP_PATH\npm config set cache ./npm-cache
	
	# npm istall smarc web ui
	Write-Host "npm install SmarC decompiler packages"

	Set-Location .\$SMARTC_SIGNUM_DECOMPILER_UNZIP_PATH
	& ..\..\${NODEJS_UNZIP_PATH}\npm.cmd install
	
	Set-Location -Path $PSScriptRoot
	
	$port = 7002

	# Create starter ps1
	if (-not (Test-Path $SMARTC_SIGNUM_DECOMPILER_STARTER_PS1_PATH)) {
		# Create start-smartc-decompiler.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start SmartC SIGNUM DECOMPILER
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting SmartC SIGNUM DECOMPILER ...'

Start-Process -FilePath "..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'Signum Pool Mainnet'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'SmartC SIGNUM DECOMPILER is already running.'
			exit
		} else {
			Write-Host 'Stop SmartC SIGNUM DECOMPILER: ctrl + c'
			# Start SmartC SIGNUM DECOMPILER
			Start-Process "http://localhost:$port/tester.html"
			Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
			..\..\$NODEJS_UNZIP_PATH\npm.cmd run webpage
		}
    } catch {
        Write-Host 'An error occurred while starting SmartC SIGNUM DECOMPILER: `$_'
    } finally {
        # Always set the title to 'Signum SmartC Decompiler Stopped' after SmartC SIGNUM DECOMPILER exits
        ```$host.UI.RawUI.WindowTitle = 'SmartC SIGNUM DECOMPILER Stopped'
    }
"`@ ``
    -WindowStyle Minimized

exit
"@

		$content | Out-File -FilePath $SMARTC_SIGNUM_DECOMPILER_STARTER_PS1_PATH -Force

		Write-Host "${SMARTC_SIGNUM_DECOMPILER_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SMARTC_SIGNUM_DECOMPILER_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SMARTC_SIGNUM_DECOMPILER_STARTER_PS1} ..\..\${POWERSHELL_EXEC_PATH} ${SMARTC_SIGNUM_DECOMPILER_STARTER_EXEC} ${SMARTC_SIGNUM_DECOMPILER_STARTER_EXEC_PATH}

}

function install-sc-simulator {
    Write-Host "Installing SC Simulator ..."
	
	# Create SmartContract directory
    if (-not (Test-Path "${SMART_CONTRACT_DIR}")) {
        New-Item -ItemType Directory -Path "${SMART_CONTRACT_DIR}" | Out-Null
        Write-Host "Created directory: ${SMART_CONTRACT_DIR}"
    } else {
        Write-Host "Directory already exists: ${SMART_CONTRACT_DIR}"
    }

    if (Test-Path -Path "${SC_SIMULATOR_ZIP_PATH}") {
        Write-Host "${SC_SIMULATOR_ZIP_PATH} already downloaded."
    } else {
        # Download SC Simulator zip file
        Write-Host "Downloading SC Simulator from GitHub ..."
        # Start-BitsTransfer -Source "${SC_SIMULATOR_URL}" -Destination "${SC_SIMULATOR_ZIP_PATH}"
		Invoke-WebRequest -Uri $SC_SIMULATOR_URL -OutFile $SC_SIMULATOR_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SC_SIMULATOR_ZIP_PATH}")) {
            Write-Host "Error: Failed to download SC Simulator."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SC_SIMULATOR_UNZIP_PATH}") {
        Write-Host "${SC_SIMULATOR_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SC_SIMULATOR_UNZIP_PATH} ..."
        Expand-Archive -Path "${SC_SIMULATOR_ZIP_PATH}" -DestinationPath "${SMART_CONTRACT_DIR}" -Force
		Rename-Item -Path $SC_SIMULATOR_ZIP_NAME_PATH -NewName $SC_SIMULATOR_UNZIP
    }
	
	# Initialize package.json
	Write-Host "Initialize package.json"
	$content = Get-Content -Path $SC_SIMULATOR_UNZIP_PATH\package.json

		# Process each line using regex to add '#' only if there's no '#' before the target
		$content = $content | ForEach-Object {
			$_ 	-replace "-p 7000", "-p 7003" `
				-replace '"dev": "TARGET=dev', '"dev": "set TARGET=dev' `
				-replace '9999\.9\.4', $SMARTC_SIGNUM_COMPILER_VERSION
		}

		# Write the changes back to the file
		$content | Set-Content -Path $SC_SIMULATOR_UNZIP_PATH\package.json
			
	Write-Host "package.json configuration initialized"
	
	# Initialize try.html
	Write-Host "Initialize try.html"
	$content = Get-Content -Path $SC_SIMULATOR_UNZIP_PATH\try.html

		# Process each line using regex to add '#' only if there's no '#' before the target
		$content = $content | ForEach-Object {
			$_ 	-replace '9999\.9\.4', $SMARTC_SIGNUM_COMPILER_VERSION
		}

		# Write the changes back to the file
		$content | Set-Content -Path $SC_SIMULATOR_UNZIP_PATH\try.html
			
	Write-Host "try.html initialized"	
	
	# Install node.js portable with npm
	install_nodejs
	
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
	# $NODEJS_UNZIP_PATH\npm config set prefix ./npm-global
	# $NODEJS_UNZIP_PATH\npm config set cache ./npm-cache
	
	# npm istall smarc web ui
	Write-Host "npm install SmarC packages"

	Set-Location .\$SC_SIMULATOR_UNZIP_PATH
	& ..\..\${NODEJS_UNZIP_PATH}\npm.cmd install
	& ..\..\${NODEJS_UNZIP_PATH}\npm.cmd run build
	
	Set-Location -Path $PSScriptRoot
	
	$port = 7003

	# Create starter ps1
	if (-not (Test-Path $SC_SIMULATOR_STARTER_PS1_PATH)) {
		# Create start-smartc.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start SC Simulator
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting SC Simulator ...'

Start-Process -FilePath "..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'SC Simulator'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'SC Simulator is already running.'
			exit
		} else {
			Write-Host 'Stop SC Simulator: ctrl + c'
			# Start SC Simulator
			Start-Process "http://localhost:$port"/try.html
			Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
			..\..\$NODEJS_UNZIP_PATH\npm.cmd run start
		}
    } catch {
        Write-Host 'An error occurred while starting SC Simulator: `$_'
    } finally {
        # Always set the title to 'SC Simulator Stopped' after SC Simulator exits
        ```$host.UI.RawUI.WindowTitle = 'SC Simulator Stopped'
    }
"`@ ``
    -WindowStyle Minimized

exit
"@

		$content | Out-File -FilePath $SC_SIMULATOR_STARTER_PS1_PATH -Force

		Write-Host "${SC_SIMULATOR_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SC_SIMULATOR_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SC_SIMULATOR_STARTER_PS1} ..\..\${POWERSHELL_EXEC_PATH} ${SC_SIMULATOR_STARTER_EXEC} ${SC_SIMULATOR_STARTER_EXEC_PATH}

}

function install-signum-d-or {
    Write-Host "Installing Signum-D-OR ..."
	
	# Create SmartContract directory
    if (-not (Test-Path "${SMART_CONTRACT_DIR}")) {
        New-Item -ItemType Directory -Path "${SMART_CONTRACT_DIR}" | Out-Null
        Write-Host "Created directory: ${SMART_CONTRACT_DIR}"
    } else {
        Write-Host "Directory already exists: ${SMART_CONTRACT_DIR}"
    }

    if (Test-Path -Path "${SIGNUM_D_OR_ZIP_PATH}") {
        Write-Host "${SIGNUM_D_OR_ZIP_PATH} already downloaded."
    } else {
        # Download Signum-D-OR zip file
        Write-Host "Downloading Signum-D-OR from GitHub ..."
        # Start-BitsTransfer -Source "${SIGNUM_D_OR_URL}" -Destination "${SIGNUM_D_OR_ZIP_PATH}"
		Invoke-WebRequest -Uri $SIGNUM_D_OR_URL -OutFile $SIGNUM_D_OR_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_D_OR_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Signum-D-OR."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_D_OR_UNZIP_PATH}") {
        Write-Host "${SIGNUM_D_OR_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_D_OR_UNZIP_PATH} ..."
        Expand-Archive -Path "${SIGNUM_D_OR_ZIP_PATH}" -DestinationPath "${SMART_CONTRACT_DIR}" -Force
		Rename-Item -Path $SIGNUM_D_OR_ZIP_NAME_PATH -NewName $SIGNUM_D_OR_UNZIP
    }	

	# Create starter ps1
	if (-not (Test-Path $SIGNUM_D_OR_STARTER_PS1_PATH)) {
		# Create start-smartc.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start SC Simulator
Set-Location -Path `$PSScriptRoot

Write-Host 'Starting Signum-D-OR ...'

Start-Process ./signum-d-or.html

exit
"@

		$content | Out-File -FilePath $SIGNUM_D_OR_STARTER_PS1_PATH -Force

		Write-Host "${SIGNUM_D_OR_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SIGNUM_D_OR_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SIGNUM_D_OR_STARTER_PS1} ..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_D_OR_STARTER_EXEC} ${SIGNUM_D_OR_STARTER_EXEC_PATH}

}

function install-smartj-compiler {
    Write-Host "Installing SmartJ SIGNUM Smart Contract Compiler ..."
	
	# Create SmartContract directory
    if (-not (Test-Path "${SMART_CONTRACT_DIR}")) {
        New-Item -ItemType Directory -Path "${SMART_CONTRACT_DIR}" | Out-Null
        Write-Host "Created directory: ${SMART_CONTRACT_DIR}"
    } else {
        Write-Host "Directory already exists: ${SMART_CONTRACT_DIR}"
    }

    if (Test-Path -Path "${SMARTJ_ZIP_PATH}") {
        Write-Host "${SMARTJ_ZIP_PATH} already downloaded."
    } else {
        # Download SmartC zip file
        Write-Host "Downloading SmartJ SIGNUM COMPILER from GitHub ..."
        # Start-BitsTransfer -Source "${SMARTJ_URL}" -Destination "${SMARTJ_ZIP_PATH}"
		Invoke-WebRequest -Uri $SMARTJ_URL -OutFile $SMARTJ_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${SMARTJ_ZIP_PATH}")) {
            Write-Host "Error: Failed to download SMARTC SIGNUM DECOMPILER."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SMARTJ_UNZIP_PATH}") {
        Write-Host "${SMARTJ_UNZIP_PATH} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SMARTJ_UNZIP_PATH} ..."
        Expand-Archive -Path "${SMARTJ_ZIP_PATH}" -DestinationPath "${SMART_CONTRACT_DIR}" -Force
		Rename-Item -Path $SMARTJ_ZIP_NAME_PATH -NewName $SMARTJ_UNZIP
    }
	
	# Rename build.gradle to build-original.gradle
	if (Test-Path -Path "$SMARTJ_UNZIP_PATH\build-original.gradle") {
        Write-Host "build-original.gradle already installed."
    } else {
        # Rename build.gradle to build-original.gradle
        Write-Host "Rename build.gradle to build-original.gradle"
        Rename-Item -Path $SMARTJ_UNZIP_PATH\build.gradle -NewName "build-original.gradle"
    }
	
	# Initialize build.gradle
	Write-Host "Initialize build.gradle"	
		$content = 
@"
plugins {
    id 'java'
    id 'maven'
    id 'com.github.johnrengelman.shadow' version '6.1.0'
}
// Publishing stuff
group = 'com.github.jjos2372'
sourceCompatibility = 1.8
targetCompatibility = 1.8
repositories {
    jcenter()
    mavenCentral()
    maven { url 'https://jitpack.io' }
}
dependencies {
    implementation 'org.ow2.asm:asm-tree:7.1'
    implementation 'com.github.signum-network:signumj:f2522b5480'
    implementation 'io.reactivex.rxjava2:rxjava:2.2.15'
    implementation 'com.github.jiconfont:jiconfont-swing:1.0.0'
    implementation 'com.github.jiconfont:jiconfont-font_awesome:4.7.0.1'
    implementation 'org.apache.logging.log4j:log4j-api:2.15.0'
    implementation 'org.apache.logging.log4j:log4j-core:2.15.0'
    testImplementation 'junit:junit:4.12'
    implementation group: 'org.apache.commons', name: 'commons-lang3', version: '3.0'
}
task sourcesJar(type: Jar, dependsOn: classes) {
    classifier = 'sources'
    from sourceSets.main.allSource
}
task javadocJar(type: Jar, dependsOn: javadoc) {
    classifier = 'javadoc'
    from javadoc.destinationDir
}
artifacts {
    archives sourcesJar
    archives javadocJar
}
shadowJar {
    archiveClassifier.set('')
    manifest {
        attributes 'Main-Class': 'bt.sample.Auction'
        attributes 'Multi-Release': 'true'
    }
}
build.dependsOn shadowJar
"@

	$content | Out-File -FilePath $SMARTJ_UNZIP_PATH\build.gradle -Force
	Write-Host "build.gradle successfully initialized."
	
	# Create jre directory
    if (-not (Test-Path -Path "${JAVA_SMARTJ_DIR_PATH}")) {
        New-Item -Path "${JAVA_SMARTJ_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${JAVA_SMARTJ_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${JAVA_SMARTJ_DIR_PATH}"
    }
	
	# download java
	if (Test-Path -Path "${JAVA_SMARTJ_ZIP_PATH}") {
        Write-Host "${JAVA_SMARTJ_ZIP_PATH} already downloaded."
    } else {
        # Download Java zip file
        Write-Host "Downloading Java ..."
        # Start-BitsTransfer -Source "${JAVA_SMARTJ_URL}" -Destination "${JAVA_SMARTJ_ZIP_PATH}"
		Invoke-WebRequest -Uri $JAVA_SMARTJ_URL -OutFile $JAVA_SMARTJ_ZIP_PATH

        # Check if download was successful
        if (-not (Test-Path -Path "${JAVA_SMARTJ_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Java."
            Pause
            # Install-Menu
            return
        }
    }
	
	# unzip java
	if (Test-Path -Path "${JAVA_SMARTJ_UNZIP_PATH}") {
        Write-Host "${JAVA_SMARTJ_ZIP_PATH} already unzipped."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Java to ${JAVA_SMARTJ_UNZIP_PATH} ..."
        Expand-Archive -Path "${JAVA_SMARTJ_ZIP_PATH}" -DestinationPath "${JAVA_SMARTJ_DIR_PATH}" -Force
    }
	
	# Copy gradlew.bat to gradlew-original.bat
	if (Test-Path -Path "$SMARTJ_UNZIP_PATH\gradlew-original.bat") {
        Write-Host "gradlew-original.bat already installed."
    } else {
        # Copy build.gradle to build-original.gradle
        Write-Host "Copy gradlew.bat to gradlew-original.bat"
        Copy-Item -Path $SMARTJ_UNZIP_PATH\gradlew.bat -Destination $SMARTJ_UNZIP_PATH\gradlew-original.bat
    }

	# Initialize gradlew.bat
	
	# Load the content of the file
	$content = Get-Content -Path $SMARTJ_UNZIP_PATH\gradlew.bat
	
	# Process each line using regex to add '#' only if there's no '#' before the target
	$content = $content | ForEach-Object {
		$_ -replace "^\s*if defined JAVA_HOME goto findJavaFromJavaHome", "@rem if defined JAVA_HOME goto findJavaFromJavaHome" `
		   -replace "^\s*set JAVA_EXE=java.exe", "set JAVA_EXE=.\jre\${JAVA_SMARTJ_UNZIP}\bin\java.exe"
	}

	# Write the changes back to the file
	$content | Set-Content -Path $SMARTJ_UNZIP_PATH\gradlew.bat
	
	Write-Host "gradlew.bat initialized"	

	Set-Location .\$SMARTJ_UNZIP_PATH
	.\gradlew.bat clean shadowJar
	
	Set-Location -Path $PSScriptRoot

	# Create starter ps1
	if (-not (Test-Path $SMARTJ_STARTER_PS1_PATH)) {
		# Create start-smartc-decompiler.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start SmartJ SIGNUM COMPILER
Set-Location -Path `$PSScriptRoot

Write-Host 'Instructions in case You want to run a different java Smart Contract:'
Write-Host '1. If You want to run a different java Smart Contract You should update the line:'
Write-Host '`tattributes ''Main-Class'': ''bt.sample.Auction'' with the proper java file within build.grandle'
Write-Host '2. Run .\gradlew.bat clean shadowJar command from CMD to build java application, or select "yes" for the question:'
Write-Host '`t"Do you want to build java application? (yes/no)"'
Write-Host '3. Run application from CMD, Start SmartJ from installer, run $SMARTJ_STARTER_EXEC, or run $SMARTJ_STARTER_PS1'
Write-Host ''

`$userChoice = Read-Host 'Do you want to build java application? (yes/no)'
if (`$userChoice -match '^(yes|y|Y)$') {
	.\gradlew.bat clean shadowJar
}

Write-Host 'Starting SmartJ SIGNUM Smart Contract Compiler ...'

.\jre\${JAVA_SMARTJ_UNZIP}\bin\java -jar .\build\libs\blocktalk.jar

"@

		$content | Out-File -FilePath $SMARTJ_STARTER_PS1_PATH -Force

		Write-Host "${SMARTJ_STARTER_PS1_PATH} successfully created."
	} else {
		Write-Host "File already exists: ${SMARTJ_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${SMARTJ_STARTER_PS1} ..\..\${POWERSHELL_EXEC_PATH} ${SMARTJ_STARTER_EXEC} ${SMARTJ_STARTER_EXEC_PATH}

}

function signum-starter-ps1 ($name, $file, $port) {

    if (-not (Test-Path $file)) {

        # Create start-node.ps1 file with the desired content
        $content = 
@"
# PowerShell script to start Signum Node
Set-Location -Path `$PSScriptRoot

# Start MariaDB
Write-Host 'Starting MariaDB ...'
..\..\..\$POWERSHELL_EXEC_PATH -ExecutionPolicy Bypass -File "..\..\..\$MARIADB_STARTER_PS1_PATH" "-WindowStyle Minimized"
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" -ArgumentList "-ExecutionPolicy Bypass", "-File", "..\..\..\$MARIADB_STARTER_PS1_PATH" -WindowStyle Minimized

Start-Sleep -Seconds $SLEEP_SECONDS

# Start Signum Node
# Start-Process -FilePath "jre\bin\java" -ArgumentList "-jar", "signum-node.jar" -WindowStyle Minimized
# Last OK
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'Signum Node $name'; jre\bin\java -jar signum-node.jar"

# TODO check
# & ..\..\..\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -NoExit -Command .\jre\bin\java -jar signum-node.jar -WindowStyle Minimized
# "jre\bin\java" "-jar" "signum-node.jar" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\$POWERSHELL_EXEC_PATH" -ArgumentList "-NoExit", "-Command", "Set-Title 'Signum Mainnet Node'; Start-Process -NoNewWindow -FilePath 'jre\bin\java' -ArgumentList '-jar', 'signum-node.jar'"

Write-Host 'Starting Signum Node $name ...'
Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'Signum Node $name'
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
			Write-Host 'Signum Node $name is already running.'
			exit
		} else {
			# Start Signum Node $name
			Start-Process "http://localhost:$port"
			.\jre\bin\java -jar signum-node.jar
		}
    } catch {
        Write-Host 'An error occurred while starting Signum Node ${name}: `$_'
    } finally {
        # Always set the title to 'Signum Node $name Stopped' after Signum Node $name exits
        ```$host.UI.RawUI.WindowTitle = 'Signum Node $name Stopped'
    }
"`@ ``
    -WindowStyle Minimized
exit
"@

        $content | Out-File -FilePath $file -Force

        Write-Host "${file} successfully created."
    } else {
        Write-Host "File already exists: ${file}"
    }
}

function create-starter-ps1-exec (${file-ps1}, ${powershell_exec_path}, ${file-exec}, ${file-exec-path}){

    if (-not (Test-Path ${file-exec-path})) {
        # Create start-node batch file with the desired content
        $content = 
@"
cd %~dp0
${powershell_exec_path} -ExecutionPolicy Bypass -File ".\${file-ps1}"
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
        # Start-BitsTransfer -Source "${HEIDISQL_URL}" -Destination "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}"
		Invoke-WebRequest -Uri ${HEIDISQL_URL} -OutFile ${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}

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
		# Create start-node.ps1 file with the desired content
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
	create-starter-ps1-exec ${HEIDISQL_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${HEIDISQL_STARTER_EXEC} ${HEIDISQL_STARTER_EXEC_PATH}

	Write-Host "HeidiSQL installed successfully."
		
}

function install_DBeaver {
    # Create DBeaver directory
    if (-not (Test-Path "${TOOLS_DIR}\${DBEAVER_DIR}")) {
        New-Item -ItemType Directory -Path "${TOOLS_DIR}\${DBEAVER_DIR}" | Out-Null
        Write-Host "Created directory: ${DBEAVER_DIR}"
    } else {
        Write-Host "Directory already exists: ${DBEAVER_DIR}"
    }

    if (Test-Path "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_ZIP}") {
        Write-Host "${DBEAVER_ZIP} already downloaded."
    } else {
        # Download DBeaver
        Write-Host "Downloading DBeaver ..."
        # Start-BitsTransfer -Source "${DBEAVER_URL}" -Destination "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_ZIP}"
		Invoke-WebRequest -Uri ${DBEAVER_URL} -OutFile ${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_ZIP}

        # Check if download was successful
        if (-not (Test-Path "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_ZIP}")) {
            Write-Host "Error: Failed to download DBeaver."
            Pause
            return
        }
    }

    if (Test-Path "${TOOLS_DIR}\${DBEAVER_DIR}\${DBEAVER_UNZIP}") {
        Write-Host "${DBEAVER_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping DBeaver to $TOOLS_DIR\$DBEAVER_DIR\$DBEAVER_UNZIP ..."
        Expand-Archive -Path "$TOOLS_DIR\$DBEAVER_DIR\$DBEAVER_ZIP" -DestinationPath "$TOOLS_DIR\$DBEAVER_DIR" -Force
		# Rename the folder
		Rename-Item -Path $TOOLS_DIR\$DBEAVER_DIR\dbeaver -NewName "$DBEAVER_UNZIP"
	}
		
	# Create starter ps1
	if (-not (Test-Path $DBEAVER_STARTER_PS1_PATH)) {
		# Create start-node.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start DBeaver
Set-Location -Path `$PSScriptRoot

# Start DBeaver
Start-Process -FilePath "$DBEAVER_EXEC"

exit
"@

		$content | Out-File -FilePath $DBEAVER_STARTER_PS1_PATH -Force

		Write-Host "${DBEAVER_STARTER_PS1_PATH} successfully created."
	} else {
			Write-Host "File already exists: ${DBEAVER_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${DBEAVER_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${DBEAVER_STARTER_EXEC} ${DBEAVER_STARTER_EXEC_PATH}

	Write-Host "DBeaver installed successfully."
		
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
        # Start-BitsTransfer -Source "${NOTEPAD_URL}" -Destination "${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_ZIP}"
		Invoke-WebRequest -Uri ${NOTEPAD_URL} -OutFile ${TOOLS_DIR}\${NOTEPAD_DIR}\${NOTEPAD_ZIP}

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
	create-starter-ps1-exec ${NOTEPAD_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${NOTEPAD_STARTER_EXEC} ${NOTEPAD_STARTER_EXEC_PATH}

	Write-Host "Notepad installed successfully."
	
}

function install_nodejs {
    # Create NodeJS directory
    if (-not (Test-Path "${NODEJS_DIR_PATH}")) {
        New-Item -ItemType Directory -Path "${NODEJS_DIR_PATH}" | Out-Null
        Write-Host "Created directory: ${NODEJS_DIR}"
    } else {
        Write-Host "Directory already exists: ${NODEJS_DIR}"
    }

    if (Test-Path "${NODEJS_ZIP_PATH}") {
        Write-Host "${NODEJS_ZIP_PATH} already downloaded."
    } else {
        # Download NodeJs
        Write-Host "Downloading NodeJS ..."
        # Start-BitsTransfer -Source "${NODEJS_URL}" -Destination "${NODEJS_ZIP_PATH}"
		Invoke-WebRequest -Uri ${NODEJS_URL} -OutFile ${NODEJS_ZIP_PATH}

        # Check if download was successful
        if (-not (Test-Path "${NODEJS_ZIP_PATH}")) {
            Write-Host "Error: Failed to download Notepad."
            Pause
            return
        }
    }

    if (Test-Path "${NODEJS_UNZIP_PATH}") {
        Write-Host "${NODEJS_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Notepad to $NODEJS_UNZIP_PATH ..."
        Expand-Archive -Path "$NODEJS_ZIP_PATH" -DestinationPath "$NODEJS_DIR_PATH" -Force
    }

	# Create starter ps1
	if (-not (Test-Path $NODEJS_STARTER_PS1_PATH)) {
		# Create start-nodejs.ps1 file with the desired content
		$content = 
@"
# PowerShell script to start NodeJS
Set-Location -Path `$PSScriptRoot

# Start NodeJS
Start-Process -FilePath "$NODEJS_EXEC"

exit
"@

		$content | Out-File -FilePath $NODEJS_STARTER_PS1_PATH -Force

		Write-Host "${NODEJS_STARTER_PS1_PATH} successfully created."
	} else {
			Write-Host "File already exists: ${NODEJS_STARTER_PS1_PATH}"
	}

	# Create starter batch
	create-starter-ps1-exec ${NODEJS_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${NODEJS_STARTER_EXEC} ${NODEJS_STARTER_EXEC_PATH}

	Write-Host "NodeJS installed successfully."
	
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
        # Start-BitsTransfer -Source "${NGINX_URL}" -Destination "${TOOLS_DIR}\${NGINX_DIR}\${NGINX_ZIP}"
		Invoke-WebRequest -Uri ${NGINX_URL} -OutFile ${TOOLS_DIR}\${NGINX_DIR}\${NGINX_ZIP}

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
	create-starter-ps1-exec ${NGINX_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${NGINX_STARTER_EXEC} ${NGINX_STARTER_EXEC_PATH}

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
        # Start-BitsTransfer -Source $SIGNUM_MINER_MAINNET_URL -Destination $SIGNUM_MINER_MAINNET_EXEC_PATH
		Invoke-WebRequest -Uri ${SIGNUM_MINER_MAINNET_URL} -OutFile ${SIGNUM_MINER_MAINNET_EXEC_PATH}

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
        # Start-BitsTransfer -Source $SIGNUM_MINER_MAINNET_CONF_URL -Destination $SIGNUM_MINER_MAINNET_CONF_PATH
		Invoke-WebRequest -Uri ${SIGNUM_MINER_MAINNET_CONF_URL} -OutFile ${SIGNUM_MINER_MAINNET_CONF_PATH}

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
	create-starter-ps1-exec ${SIGNUM_MINER_MAINNET_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_MINER_MAINNET_EXEC} ${SIGNUM_MINER_MAINNET_STARTER_EXEC_PATH}
		
    Write-Host "Signum Miner Mainnet installed successfully."
	
	setup_signumminer "$SIGNUM_MINER_MAINNET_VERSION_DIR_PATH\config.yaml" $SIGNUM_MINER_MAINNET_CONF_URL "mainnet"
	
}

function setup_signumminer($config_path, $config_url, $net_type) {
	
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
					if ($net_type -eq "mainnet") {
						$choice_node_url = "http://localhost:8125"
					} else {
						$choice_node_url = "http://localhost:6876"
					}
					$choice_node_url = Read-Host "Enter Signum node url (default: $choice_node_url)"
					if ($choice_node_url -eq "")
					{
						if ($net_type -eq "mainnet") {
							$choice_node_url = "http://localhost:8125"
						} else {
							$choice_node_url = "http://localhost:6876"
						}
							
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
						setup_signumminer $config_path $config_url $net_type
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
					setup_signumminer $config_path $config_url $net_type
				}
				default {
					Write-Host "Invalid choice! Please try again."
					Pause
					setup_signumminer $config_path $config_url $net_type
				}
			}
        }
		"3" {
			# Restore Configuration
			Write-Host "Downloading Configuration file ..."
			# Start-BitsTransfer -Source $config_url -Destination $config_path
			Invoke-WebRequest -Uri ${config_url} -OutFile ${config_path}

			if (-not (Test-Path $config_path)) {
				Write-Host "Error: Failed to download Configuration file."
				Read-Host "Press Enter to continue"
				Pause
				setup_signumminer $config_path $config_url $net_type
				return
			}
			Write-Host "Configuration restored"
			Pause
            setup_signumminer $config_path $config_url $net_type
			Return
        }
		"4" {
			# Exit Setup
			Return
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            setup_signumminer $config_path $config_url $net_type
        }
    }
}

# TODO make a setup menu entry from main menu to open setup menu
# TODO after installation ask for start the installed application
function setup_signumpool($config_path, $config_original_path, $net_type) {
	
	Clear-Host
    Write-Host "====================================================="

	if ($net_type -eq "mainnet") {
	Write-Host "            Setup Signum Pool Mainnet                "
	} else {
	Write-Host "            Setup Signum Pool Testnet                "
	}

    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] `tEdit Configuration file"
    Write-Host "[2] `tSetup Pool Configuration"
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
			<#$content = Get-Content -Path $config_path

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
					if ($net_type -eq "mainnet") {
						$choice_node_url = "http://localhost:8125"
					} else {
						$choice_node_url = "http://localhost:6876"
					}
					$choice_node_url = Read-Host "Enter Signum node url (default: $choice_node_url)"
					if ($choice_node_url -eq "")
					{
						if ($net_type -eq "mainnet") {
							$choice_node_url = "http://localhost:8125"
						} else {
							$choice_node_url = "http://localhost:6876"
						}
							
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
						setup_signumpool $config_path $config_original_path $net_type
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
					setup_signumpool $config_path $config_original_path $net_type
				}
				default {
					Write-Host "Invalid choice! Please try again."
					Pause
					setup_signumpool $config_path $config_original_path $net_type
				}
			}#>
			# The port to run the server on, use 443 if you enalbe the letsencrypt thing (see below)
			$serverPort = "8000"
			$nodeAddresses = "http://localhost:8125"
			$poolName = "SIGNUM POOL"
			$miningURL = "http://localhost:8000"
			$passphrase = "YOUR POOL PASSPHRASE GOES HERE"
			$feeRecipient = "S-W5YR-ZZQC-KUBJ-G78KB"
			$donationRecipient = "S-JJQS-MMA4-GHB4-4ZNZU"
			
			if ($net_type -eq "mainnet") {
				$serverPort = "8000" 
			} else {
					$serverPort = "8001" 
			}
			
			$serverPort = Read-Host "Enter Signum Pool Server Port to run the server (or press Enter for default ${serverPort})"
			if (-not $serverPort) { 
				if ($net_type -eq "mainnet") {
					$serverPort = "8000" 
				} else {
					$serverPort = "8001" 
				}
			}
			Write-Host "serverPort = $serverPort"

			if ($net_type -eq "mainnet") {
				$nodeAddresses = "http://localhost:8125"
			} else {
				$nodeAddresses = "http://localhost:6876"
			}
			
			$nodeAddresses = Read-Host "Enter Signum Node Address (or press Enter for default $nodeAddresses)"
			if (-not $nodeAddresses) { 
				if ($net_type -eq "mainnet") {
					$nodeAddresses = "http://localhost:8125"
				} else {
					$nodeAddresses = "http://localhost:6876"
				}
			}
			Write-Host "Signum Node Address: $nodeAddresses"

			# The name of the pool
			$poolName = Read-Host "Enter the name of the pool (or press Enter for default $poolName)"
			if (-not $poolName) { $poolName = "SIGNUM POOL" }
			Write-Host "The name of the pool: ${poolName}"

			if ($net_type -eq "mainnet") {
				$miningURL = "http://localhost:8000"
			} else {
				$miningURL = "http://localhost:8001"
			}

			# The URL miners should point their miner to
			$miningURL = Read-Host "Enter URL miners should point their miner to (or press Enter for skip)"
			if (-not $miningURL) { 
				if ($net_type -eq "mainnet") {
					$miningURL = "http://localhost:8000"
				} else {
					$miningURL = "http://localhost:8001"
				}
			}
			Write-Host "The URL miners should point their miner to: ${miningURL}"

			# The passphrase of the pool account
			$passphrase = Read-Host "Enter the passphrase of the pool account (or press Enter for skip)"
			if (-not $passphrase) { $passphrase = "YOUR POOL PASSPHRASE GOES HERE" }
			Write-Host "Passphrase of the pool account: ${passphrase}"
			
			# Recipient of pool fees
			$feeRecipient = Read-Host "Enter the recipient of pool fees (or press Enter for skip)"
			if (-not $feeRecipient) { $feeRecipient = "S-W5YR-ZZQC-KUBJ-G78KB" }
			Write-Host "Recipient of pool fees: ${feeRecipient}"
			
			# Recipient of donations
			$donationRecipient = Read-Host "Enter the recipient of donations (or press Enter for skip)"
			if (-not $donationRecipient) { $donationRecipient = "S-JJQS-MMA4-GHB4-4ZNZU" }
			Write-Host "Recipient of donations: ${donationRecipient}"
			
			Write-Host "Updating pool.properties with new configurations ..."
			(Get-Content -Path $config_path) -replace '^serverPort = 8000', "serverPort = $serverPort" `
				-replace '^nodeAddresses = http://localhost:8125;', "nodeAddresses = $nodeAddresses;" `
				-replace '^poolName = SIGNUM POOL', "poolName = $poolName" `
				-replace '^miningURL = http://testnet.btfg.space:9000', "miningURL = $miningURL" `
				-replace '^passphrase = YOUR POOL PASSPHRASE GOES HERE', "passphrase = $passphrase" `
				-replace '^feeRecipient=S-W5YR-ZZQC-KUBJ-G78KB', "feeRecipient=$feeRecipient" `
				-replace '^donationRecipient=S-JJQS-MMA4-GHB4-4ZNZU', "donationRecipient=$donationRecipient" | Set-Content -Path $config_path

			if ($net_type -eq "mainnet") {
				
			} else {
				"testnet = true" | Out-File -FilePath $config_path -Append
			}
			Write-Host "Update complete."
        }
		"3" {
			# Restore Configuration
			Write-Host "Restore Configuration file ..."
			
			# Copy poopl.properties to pool-original.properties
			Write-Host "Copying ${config_original_path} to ${config_path} ..."
			Copy-Item -Path "${config_original_path}" -Destination "${config_path}"

			Write-Host "Configuration restored"
			Pause
            setup_signumpool $config_path $config_original_path $net_type
			Return
        }
		"4" {
			# Exit Setup
			Return
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            setup_signumpool $config_path $config_original_path $net_type
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
        # Start-BitsTransfer -Source $SIGNUM_MINER_TESTNET_URL -Destination $SIGNUM_MINER_TESTNET_EXEC_PATH
		Invoke-WebRequest -Uri ${SIGNUM_MINER_TESTNET_URL} -OutFile ${SIGNUM_MINER_TESTNET_EXEC_PATH}

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
        # Start-BitsTransfer -Source $SIGNUM_MINER_TESTNET_CONF_URL -Destination $SIGNUM_MINER_TESTNET_CONF_PATH
		Invoke-WebRequest -Uri ${SIGNUM_MINER_TESTNET_CONF_URL} -OutFile ${SIGNUM_MINER_TESTNET_CONF_PATH}

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
	create-starter-ps1-exec ${SIGNUM_MINER_TESTNET_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUM_MINER_TESTNET_EXEC} ${SIGNUM_MINER_TESTNET_STARTER_EXEC_PATH}
		
    Write-Host "Signum Miner Testnet installed successfully."
	
	setup_signumminer "$SIGNUM_MINER_TESTNET_VERSION_DIR_PATH\config.yaml" $SIGNUM_MINER_TESTNET_CONF_URL "testnet"
	
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
        # Start-BitsTransfer -Source $BTDEX_URL -Destination $BTDEX_EXEC_PATH
		Invoke-WebRequest -Uri ${BTDEX_URL} -OutFile ${BTDEX_EXEC_PATH}

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
	create-starter-ps1-exec ${BTDEX_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${BTDEX_STARTER_EXEC} ${BTDEX_STARTER_EXEC_PATH}
	
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
        # Start-BitsTransfer -Source $PHOENIX_URL -Destination $PHOENIX_EXEC_PATH
		Invoke-WebRequest -Uri ${PHOENIX_URL} -OutFile ${PHOENIX_EXEC_PATH}

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
	create-starter-ps1-exec ${PHOENIX_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${PHOENIX_STARTER_EXEC} ${PHOENIX_STARTER_EXEC_PATH}
		
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
        # Start-BitsTransfer -Source $SIGNUMPLOTTER_URL -Destination $SIGNUMPLOTTER_EXEC_PATH
		Invoke-WebRequest -Uri ${SIGNUMPLOTTER_URL} -OutFile ${SIGNUMPLOTTER_EXEC_PATH}

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
	create-starter-ps1-exec ${SIGNUMPLOTTER_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${SIGNUMPLOTTER_STARTER_EXEC} ${SIGNUMPLOTTER_STARTER_EXEC_PATH}
		
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
        # Start-BitsTransfer -Source "${TURBOPLOTTER_URL}" -Destination "${TURBOPLOTTER_VERSION_ZIP}"
		Invoke-WebRequest -Uri ${TURBOPLOTTER_URL} -OutFile ${TURBOPLOTTER_VERSION_ZIP}

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
	create-starter-ps1-exec ${TURBOPLOTTER_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${TURBOPLOTTER_STARTER_EXEC} ${TURBOPLOTTER_STARTER_EXEC_PATH}
		
    Write-Host "TurboPlotter installed successfully."
        
}

function install_mariadb {
    install_heidisql

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}")) {
        New-Item -ItemType Directory -Force -Path "${DATABASE_DIR}\${MARIADB_DIR}" | Out-Null
    } else {
        Write-Host "Directory already exists: ${DATABASE_DIR}\${MARIADB_DIR}"
    }

    if (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}") {
        Write-Host "${MARIADB_ZIP} already downloaded."
    } else {
        Write-Host "Downloading MariaDB version ${MARIADB_VERSION} ..."
        # Start-BitsTransfer -Source $MARIADB_URL -Destination "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}"
		Invoke-WebRequest -Uri ${MARIADB_URL} -OutFile ${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}

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

	$port = 3306

    if (-not (Test-Path $MARIADB_STARTER_PS1_PATH)) {
        $content = 
@"
# PowerShell script to start MariaDB
Set-Location -Path `$PSScriptRoot

# TODO find out how to run mariadb 1 within a powershell window, or 2 without powershell within mariadb own terminal window. Use the chosen soluton for 
# mariadb setup as well currently mariadb within powershell is used in mariadb setup
# 1:
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" "-Command", ".\bin\${MARIADBD_EXEC} --no-defaults" -WindowStyle Hidden
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" "-Command", ".\bin\${MARIADBD_EXEC} --no-defaults --console" -WindowStyle Hidden
# Last OK
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" "-NoExit", "-Command", "```$host.UI.RawUI.WindowTitle = 'MariaDB'; .\bin\${MARIADBD_EXEC} --no-defaults --console" -WindowStyle Minimized
# Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" "-Command", ".\bin\${MARIADBD_EXEC} --no-defaults"
# 2: If I can set powershell window title it is ok as well
# Start-Process -FilePath ".\bin\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized

# & .\bin\${MARIADBD_EXEC} --no-defaults --console

Start-Process -FilePath "..\..\..\${POWERSHELL_EXEC_PATH}" ``
    -ArgumentList "-NoExit", "-Command", `@"
    try {
        ```$host.UI.RawUI.WindowTitle = 'MariaDB'
        # Check if MariaDB is already running
		```$portInUse = Get-NetTCPConnection | Where-Object { ```$_.LocalPort -eq $port -and ```$_.State -eq 'Listen' }
        if (```$portInUse) {
            Write-Host 'MariaDB is already running.'
			exit
        } else {
			# Start MariaDB
			.\bin\mariadbd.exe --no-defaults --console
		}
    } catch {
        Write-Host 'An error occurred while starting MariaDB: ```$_'
    } finally {
        # Always set the title to 'MariaDB Stopped' after MariaDB exits
        ```$host.UI.RawUI.WindowTitle = 'MariaDB Stopped'
    }
"`@ ``
    -WindowStyle Minimized
exit
"@
        $content | Out-File -FilePath $MARIADB_STARTER_PS1_PATH -Force
        Write-Host "${MARIADB_STARTER_PS1_PATH} successfully created."
    } else {
        Write-Host "File already exists: ${MARIADB_STARTER_PS1_PATH}"
    }
	
	# Create OS specific starter
	create-starter-ps1-exec ${MARIADB_STARTER_PS1} ..\..\..\${POWERSHELL_EXEC_PATH} ${MARIADB_STARTER_EXEC} ${MARIADB_STARTER_EXEC_PATH}
	
	Write-Host "MariaDB installed successfully."
}

function setup_mariadb ($name, $database, $user, $password) {
	
	$DATABASE_NAME = ""
	$DATABASE_USERNAME = ""
	$DATABASE_PASSWORD = ""
	
	$global:DATABASE_NAME = $null
	$global:DATABASE_USERNAME = $null
	$global:DATABASE_PASSWORD = $null
	
    $DATABASE_NAME = Read-Host "Enter Signum ${name} database name (or press Enter for default ${database})"
    if (-not $DATABASE_NAME) { $DATABASE_NAME = $database }
    Write-Host "Database name: ${DATABASE_NAME}"

    $DATABASE_USERNAME = Read-Host "Enter the username (or press Enter for default ${user})"
    if (-not $DATABASE_USERNAME) { $DATABASE_USERNAME = $user }
    Write-Host "Username: ${DATABASE_USERNAME}"

    $DATABASE_PASSWORD = Read-Host "Enter the password (or press Enter for default ${password})"
    if (-not $DATABASE_PASSWORD) { $DATABASE_PASSWORD = $password }
    Write-Host "Password: ${DATABASE_PASSWORD}"

    Write-Host "Starting MariaDB server ..."
	# Last OK
    # Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults" -WindowStyle Minimized
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Hidden
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
	
	.\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -ExecutionPolicy Bypass -File ".\Database\MariaDB\mariadb-10.6.20-winx64\start-mariadb.ps1" "-WindowStyle Minimized"

    Start-Sleep -Seconds $SLEEP_SECONDS

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

function setup_mariadb_readonly ($name, $database, $user, $password) {
	
	$DATABASE_NAME = ""
	$DATABASE_USERNAME = ""
	$DATABASE_PASSWORD = ""
	
	$global:DATABASE_NAME = $null
	$global:DATABASE_USERNAME = $null
	$global:DATABASE_PASSWORD = $null
	
	$DATABASE_NAME = $database
    Write-Host "Database name: ${DATABASE_NAME}"

    $DATABASE_USERNAME = Read-Host "Enter the username (or press Enter for default ${user})"
    if (-not $DATABASE_USERNAME) { $DATABASE_USERNAME = $user }
    Write-Host "Username: ${DATABASE_USERNAME}"

    $DATABASE_PASSWORD = Read-Host "Enter the password (or press Enter for default ${password})"
    if (-not $DATABASE_PASSWORD) { $DATABASE_PASSWORD = $password }
    Write-Host "Password: ${DATABASE_PASSWORD}"

    Write-Host "Starting MariaDB server ..."
	# Last OK
    # Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults" -WindowStyle Minimized
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Hidden
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
	
	.\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -ExecutionPolicy Bypass -File ".\Database\MariaDB\mariadb-10.6.20-winx64\start-mariadb.ps1" "-WindowStyle Minimized"

    Start-Sleep -Seconds $SLEEP_SECONDS

    Write-Host "Creating user: ${DATABASE_USERNAME}"
	$createUserQuery = "CREATE USER IF NOT EXISTS '${DATABASE_USERNAME}'@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $createUserQuery

    Write-Host "Granting permissions to user ${DATABASE_USERNAME} on database ${DATABASE_NAME} ..."
	$grantPermissionsQuery = "GRANT SELECT, SHOW VIEW ON ``${DATABASE_NAME}``.* TO '${DATABASE_USERNAME}'@'localhost';"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $grantPermissionsQuery

<#
	# Indexing
	# SQL commands to execute
	$sqlCommands = 
@"
USE ``${DATABASE_NAME}``;
CREATE INDEX transaction_height_timestamp ON transaction(height, timestamp);
CREATE INDEX asset_height ON asset(height);
CREATE INDEX account_latest ON account(latest);
"@
	
	# Execute each SQL command
	& "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $sqlCommands
#>	
	
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e "FLUSH PRIVILEGES;"

	$global:DATABASE_NAME = $DATABASE_NAME
	$global:DATABASE_USERNAME = $DATABASE_USERNAME
	$global:DATABASE_PASSWORD = $DATABASE_PASSWORD

    Write-Host "MariaDB setup complete."
}


function setup_mariadb_explorer ($name, $database, $user, $password) {
	
	$DATABASE_NAME = ""
	$DATABASE_USERNAME = ""
	$DATABASE_PASSWORD = ""
	
	$global:DATABASE_NAME = $null
	$global:DATABASE_USERNAME = $null
	$global:DATABASE_PASSWORD = $null
	
    $DATABASE_NAME = Read-Host "Enter Signum ${name} database name (or press Enter for default ${database})"
    if (-not $DATABASE_NAME) { $DATABASE_NAME = $database }
    Write-Host "Database name: ${DATABASE_NAME}"

    $DATABASE_USERNAME = Read-Host "Enter the username (or press Enter for default ${user})"
    if (-not $DATABASE_USERNAME) { $DATABASE_USERNAME = $user }
    Write-Host "Username: ${DATABASE_USERNAME}"

    $DATABASE_PASSWORD = Read-Host "Enter the password (or press Enter for default ${password})"
    if (-not $DATABASE_PASSWORD) { $DATABASE_PASSWORD = $password }
    Write-Host "Password: ${DATABASE_PASSWORD}"

    Write-Host "Starting MariaDB server ..."
	# Last OK
    # Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults" -WindowStyle Minimized
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Hidden
	# Start-Process -FilePath "${MARIADB_BIN}\${MARIADBD_EXEC}" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
	
	.\PowerShell\PowerShell-7.4.6-win-x64\pwsh.exe -ExecutionPolicy Bypass -File ".\Database\MariaDB\mariadb-10.6.20-winx64\start-mariadb.ps1" "-WindowStyle Minimized"

    Start-Sleep -Seconds $SLEEP_SECONDS

    Write-Host "Creating database: ${DATABASE_NAME}"
	$createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS ``${DATABASE_NAME}``;"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $createDatabaseQuery

    Write-Host "Creating user: ${DATABASE_USERNAME}"
	$createUserQuery = "CREATE USER IF NOT EXISTS '${DATABASE_USERNAME}'@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $createUserQuery

    Write-Host "Granting permissions to user ${DATABASE_USERNAME} on database ${DATABASE_NAME} ..."
	$grantPermissionsQuery = "GRANT ALL PRIVILEGES ON ``${DATABASE_NAME}``.* TO '${DATABASE_USERNAME}'@'localhost';"
    & "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $grantPermissionsQuery

	# Define the SQL queries
	$sqlQueryGetUser = "SELECT '$DATABASE_USERNAME' FROM mysql.user;"

	$sqlQueryCreateTable = 
@"
USE $DATABASE_NAME;

CREATE TABLE scan_peermonitor (
	announced_address VARCHAR(255) PRIMARY KEY,
	real_ip VARCHAR(255),
	platform VARCHAR(255),
	application VARCHAR(255),
	version VARCHAR(255),
	height INTEGER,
	cumulative_difficulty VARCHAR(255),
	country_code CHAR(2),
	state SMALLINT,
	downtime INTEGER DEFAULT 0,
	lifetime INTEGER DEFAULT 0,
	availability FLOAT DEFAULT 0,
	last_online_at TIMESTAMP,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	reward_state VARCHAR(255) DEFAULT 'none',
	reward_time TIMESTAMP
);
"@

	# Run the queries
	Write-Host "Executing query to retrieve user details..."
	& "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $sqlQueryGetUser

	Write-Host "Creating table in the Signum ${name} database..."
	& "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e $sqlQueryCreateTable
	& "${MARIADB_BIN}\${MARIADB_EXEC}" --user=root --password= -e "FLUSH PRIVILEGES;"
	
	$global:DATABASE_NAME = $DATABASE_NAME
	$global:DATABASE_USERNAME = $DATABASE_USERNAME
	$global:DATABASE_PASSWORD = $DATABASE_PASSWORD

    Write-Host "MariaDB setup complete."
}

function setup_db_node_properties($file) {
	
	Write-Host "Updating node.properties with new database configurations ..."
	$content = Get-Content -Path $file
	
		for ($i = 0; $i -lt $content.Count; $i++) {

			# Get the current line
			$line = $content[$i]

			if ($content[$i] -match '# DB.Url=jdbc:mariadb:.*') {
				$content[$i] = "DB.Url=jdbc:mariadb://localhost:3306/${DATABASE_NAME}"
				$content[$i+1] = "DB.Username=${DATABASE_USERNAME}"
				$content[$i+2] = "DB.Password=${DATABASE_PASSWORD}"
				break
			}
		}

	# Write the changes back to the file
	$content | Set-Content -Path ${file}

	<#
    (Get-Content -Path $file) -replace '# DB.Url=jdbc:mariadb:.*', "DB.Url=jdbc:mariadb://localhost:3306/${DATABASE_NAME}" `
        -replace '# DB.Username=.*', "DB.Username=${DATABASE_USERNAME}" `
        -replace '# DB.Password=.*', "DB.Password=${DATABASE_PASSWORD}" | Set-Content -Path $file
	#>
    Write-Host "Update complete."
	
}

function setup_db_pool_properties($file) {
	
	Write-Host "Updating pool.properties with new database configurations ..."
    (Get-Content -Path $file) -replace 'dbUrl=jdbc:h2:file*', "# dbUrl=jdbc:h2:file:./db/pooldb.h2;DB_CLOSE_ON_EXIT=FALSE" `
        -replace '^dbUsername=', "# dbUsername=" `
        -replace '^dbPassword=', "# dbPassword=" `
		-replace '^#dbUrl=jdbc:mariadb://localhost:3306/pooldb*', "dbUrl=jdbc:mariadb://localhost:3306/${DATABASE_NAME}" `
        -replace '^#dbUsername=root', "dbUsername=${DATABASE_USERNAME}" `
        -replace '^#dbPassword=passw', "dbPassword=${DATABASE_PASSWORD}" | Set-Content -Path $file

    Write-Host "Update complete."
	
}

function question-prompt($process, $name, $installFunction) {
	# Initialize the global variable
	$global:UserResponse = $null
    $userChoice = Read-Host "Do you want to ${process} ${name} (yes/no)"
    if ($userChoice -match '^(yes|y|Y)$') {
		$global:UserResponse = "yes"
        &$installFunction
    } else {
		$global:UserResponse = "no"
        Write-Host "${name} ${process} canceled."
    }
}

function download-prompt($name, $url, $target_path, $file) {
	# Initialize the global variable
	$global:UserResponse = $null
    $userChoice = Read-Host "Do you want to download ${name} (yes/no)"
    if ($userChoice -match '^(yes|y|Y)$') {
		if (-not (Test-Path "${target_path}")) {
			$global:UserResponse = "yes"
			New-Item -Path "${target_path}" -ItemType Directory | Out-Null
		}
		Write-Host "Downloading ${name} ..."
		# Start-BitsTransfer -Source $url -Destination $file
		Invoke-WebRequest -Uri ${url} -OutFile ${file}
		Write-Host "${name} downloaded successfully."
		# Invoke-WebRequest -Uri $url -OutFile $file
		# Invoke-RestMethod -Uri $url -OutFile $file
    } else {
		$global:UserResponse = "no"
        Write-Host "${name} download canceled."
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
install-doc-init
Show-InstallMenu
