#!/bin/bash

sudo apt-get update -y

sudo apt-get install build-essential pkg-config libffi-dev libgmp-dev libssl-dev libtinfo-dev libsystemd-dev zlib1g-dev make g++ tmux git jq wget libncursesw5 -y
sudo apt-get install libsodium-dev pkg-config


git clone https://github.com/input-output-hk/libsodium

cd libsodium
git checkout 66f017f1
./autogen.sh
./configure
make
sudo make install

export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

# Build cardano-node cardano-cli

git clone https://github.com/input-output-hk/cardano-node.git

cd cardano-node
git fetch --all --tags
git tag
git checkout tags/1.14.0
rm ~/.cabal/bin/*
cabal install cardano-node cardano-cli

cabal build all

cp -p dist-newstyle/build/x86_64-linux/ghc-8.6.5/cardano-node-1.14.0/x/cardano-node/build/cardano-node/cardano-node ~/.local/bin/
cp -p dist-newstyle/build/x86_64-linux/ghc-8.6.5/cardano-cli-1.14.0/x/cardano-cli/build/cardano-cli/cardano-cli ~/.local/bin/
