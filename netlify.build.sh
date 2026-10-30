#!/usr/bin/env bash
set -e

## install latest .NET
pushd /tmp
wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh

chmod u+x /tmp/dotnet-install.sh
/tmp/dotnet-install.sh --channel 10.0
popd

export DOTNET_ROOT="/opt/buildhome/.dotnet"
export PATH="$DOTNET_ROOT:$PATH"

echo "Using dotnet:"
which dotnet
dotnet --version
dotnet --list-sdks

## publish project to known location for subsequent deployment by Netlify
dotnet publish -c Release -o release