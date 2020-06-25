# shelley-testnet-scripts

Find scripts to automate steps through settings up and running a Cardano Shelley Testnet node!!


Common Errors:

ApplyTxError [LedgerFailure (UtxowFailure (UtxoFailure (BadInputsUTxO (fromList [TxIn (TxId {_TxId = 139947551603
6f9cceb643a01fdb59704eafcffeec5562610a34d1d114d3c191}) 0])))),LedgerFailure (UtxowFailure (UtxoFailure (ValueNotC
onservedUTxO (Coin 0) (Coin 100000000000))))]

Solution: You might have bad inputs on the TX-in. Make sure your #0 or #1 is right based on your utxo



Building a new 1.4.1 pool, anyone seen this issue when trying to register pool? Error while submitting tx: Failed to submit Shelley transaction: ApplyTxError [LedgerFailureGB (DelegsFailure (DelplFailure (DelegFailure (StakeDelegationImpossibleDELEG (KeyHashObj (KeyHash fc168b115e**)
@Saketh Figured out this one. Stake key wasn't registered in blockchain.
