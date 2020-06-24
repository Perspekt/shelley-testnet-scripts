#!/bin/bash

NAME="relay02"
PID=$(pgrep -f relay02/db)

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

case "$1" in
    -d|--daemon)
        $0 < /dev/null &> /dev/null & disown
        exit 0
        ;;
    *)
        ;;
esac


#sudo rm -rf Pool/relay/db 

nohup cardano-node run --topology relay02/ff-topology.json --database-path relay02/db/ --socket-path relay02/db/node.socket --port 3002 --config relay02/ff-config.json > relay02.log

sleep 5

tail relay02.log
