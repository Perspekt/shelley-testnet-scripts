# shelley-testnet-scripts

Find scripts to automate steps through settings up and running a Cardano Shelley Testnet node!!


Common Errors:

ApplyTxError [LedgerFailure (UtxowFailure (UtxoFailure (BadInputsUTxO (fromList [TxIn (TxId {_TxId = 139947551603
6f9cceb643a01fdb59704eafcffeec5562610a34d1d114d3c191}) 0])))),LedgerFailure (UtxowFailure (UtxoFailure (ValueNotC
onservedUTxO (Coin 0) (Coin 100000000000))))]

Solution: You might have bad inputs on the TX-in. Make sure your #0 or #1 is right based on your utxo
