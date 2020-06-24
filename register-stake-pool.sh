#!/bin/bash

TTL=1431045
walletpath='~/Wallet/wallet-01/'

echo "TTL set to $TTL"

cardano-cli shelley stake-pool registration-certificate \
--cold-verification-key-file cold.vkey \
--vrf-verification-key-file vrf.vkey \
--pool-pledge 100000000000 \
--pool-cost 2500000000 \
--pool-margin 0.666 \
--pool-reward-account-verification-key-file ~/Wallet/wallet-01/stake.vkey \
--pool-owner-stake-verification-key-file ~/Wallet/wallet-01/stake.vkey \
--testnet-magic 42 \
--out-file pool.cert

cardano-cli shelley stake-address delegation-certificate \
--stake-verification-key-file ~/Wallet/wallet-01/stake.vkey \
--cold-verification-key-file cold.vkey \
--out-file delegation.cert

cardano-cli shelley transaction calculate-min-fee \
--tx-in-count 1 \
--tx-out-count 1 \
--ttl 1686850 \
--testnet-magic 42 \
--signing-key-file ~/Wallet/wallet-01/payment.skey \
--signing-key-file ~/Wallet/wallet-01/stake.skey \
--signing-key-file cold.skey \
--certificate-file pool.cert \
--certificate-file delegation.cert \
--protocol-params-file ~/Wallet/wallet-01/protocol.json
