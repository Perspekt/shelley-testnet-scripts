#!/bin/bash 

cardano-cli shelley transaction build-raw \
--tx-in a7fe0ead62c3bf014cccaefd671af36e911146c517fa571c6f10322b478f585b#0 \
--tx-out $(cat payment.addr)+99999428691 \
--ttl 1685000 \
--fee 171309 \
--out-file tx.raw \
--certificate-file stake.cert

cardano-cli shelley transaction sign \
--tx-body-file tx.raw \
--signing-key-file payment.skey \
--signing-key-file stake.skey \
--testnet-magic 42 \
--out-file tx.signed

cardano-cli shelley transaction submit \
--tx-file tx.signed \
--testnet-magic 42
