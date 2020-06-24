#!/bin/bash

change=99499814963

cardano-cli shelley transaction build-raw \
--tx-in 1a5d6cc4e41a389c78cd0de76abe68c1c5735e3016fed9fc0a60fad189c41ab4#0 \
--tx-out $(cat ~/Wallet/wallet-01/payment.addr)+99499243654 \
--ttl 1686850 \
--fee 185037 \
--out-file tx.raw \
--certificate-file pool.cert \
--certificate-file delegation.cert 

cardano-cli shelley transaction sign \
--tx-body-file tx.raw \
--signing-key-file ~/Wallet/wallet-01/payment.skey \
--signing-key-file ~/Wallet/wallet-01/stake.skey \
--signing-key-file cold.skey \
--testnet-magic 42 \
--out-file tx.signed

cardano-cli shelley transaction submit \
--tx-file tx.signed \
--testnet-magic 42
