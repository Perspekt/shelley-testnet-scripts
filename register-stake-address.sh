#!/bin/bash

cardano-cli shelley stake-address registration-certificate \
--stake-verification-key-file stake.vkey \
--out-file stake.cert

cardano-cli shelley transaction calculate-min-fee \
--tx-in-count 1 \
--tx-out-count 1 \
--ttl 1685000 \
--testnet-magic 42 \
--signing-key-file payment.skey \
--signing-key-file stake.skey \
--certificate-file stake.cert \
--protocol-params-file protocol.json
