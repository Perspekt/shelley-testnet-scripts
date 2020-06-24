#!/bin/bash

#nohup cardano-node run --topology node/ff-topology.json --database-path node/db/ --socket-path node/db/node.socket --port 3000 --config node/ff-config.json > node.log

PID=$(pgrep -f node/db)



echo "PID is: $PID"

echo "Killing process: $PID..."

kill $PID

echo "Starting Node..."


cardano-node run --topology node/shelley_testnet-topology.json --database-path node/db/ --socket-path node/db/node.socket --port 3000 --config node/shelley_testnet-config.json
