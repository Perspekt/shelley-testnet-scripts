#!/bin/bash

cardano-cli shelley address key-gen \
     --verification-key-file payment.vkey \
     --signing-key-file payment.skey
cat payment.vkey




cardano-cli shelley stake-address key-gen \
 --verification-key-file stake.vkey \
 --signing-key-file stake.skey
cat stake.vkey




cardano-cli shelley address build \
 --payment-verification-key-file payment.vkey \
 --stake-verification-key-file stake.vkey \
 --out-file payment.addr \
 --testnet-magic 42
sleep 5
cat payment.address





cardano-cli shelley query utxo \
--address $(cat payment.addr) \
--testnet-magic 42


echo""

cardano-cli shelley stake-address build \
 --stake-verification-key-file stake.vkey \
 --out-file stake.addr \
 --testnet-magic 42
cat stake.addr

