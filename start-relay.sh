#!/bin/bash

NAME="relay"
PID=$(pgrep -f $NAME/db)

if [ -z "$PID" ]
then
      echo "$NAME is stopped..."
      echo "=========Starting $NAME=========="
else
      echo "=========$NAME is already started========="
      echo "PID is: $PID"
      echo "Killing process: $PID..."
      kill $PID
      echo "Restarting $NAME..."
fi


#sudo rm -rf Pool/relay/db 

cardano-node run --topology relay/shelley_testnet-topology.json --database-path relay/db/ --socket-path relay/db/node.socket --port 3001 --config relay/shelley_testnet-config.json


#nohup cardano-node run --topology relay/ff-topology.json --database-path relay/db/ --socket-path relay/db/node.socket --port 3001 --config relay/ff-config.json > relay.log
