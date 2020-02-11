#!/bin/bash

# Install Dotnet SDK
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install apt-transport-https -y
apt-get update
apt-get install dotnet-sdk-2.2 -y
# Install Convenant
git clone --recurse-submodules https://github.com/cobbr/Covenant
cd Covenant/Covenant
dotnet build
