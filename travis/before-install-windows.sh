#!/bin/bash

mkdir -p bin

wget -c https://github.com/LoopPerfect/buckaroo/releases/download/$BUCKAROO_VERSION/buckaroo-windows.exe -O bin/buckaroo
chmod +x ./bin/buckaroo
cp ./bin/buckaroo /usr/bin/buckaroo
buckaroo version

choco install zip -y
choco install unzip -y
choco install gpg4win-vanilla -y
choco install git -y

if [ $BUCKAROO_USE_BAZEL ]
then

choco install bazel -y

else

choco install python2 -y
choco install ant -y
choco install jdk8 -y

powershell -Command 'refreshenv'

# wget -c https://github.com/njlr/buck-warp/releases/download/v0.3.0/buck-2019.01.10.01-windows.exe -O bin/buck
# chmod +x ./bin/buck
# cp ./bin/buck /usr/bin/buck

choco install buck -y

buck --version

powershell -Command 'set-executionpolicy unrestricted'
powershell -Command 'Install-Module -Name PSCX -AllowClobber -Force'
powershell -Command 'Install-Module -Name VSSetup -AllowClobber -Force'
powershell -Command 'Import-VisualStudioVars 2017 amd64'

fi
