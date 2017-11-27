#!/bin/sh

# link the secure node tracker config, bail if not present
#if [ -f "/mnt/zen/secnode/stakeaddr" ]; then
  #echo "Secure node config found OK - linking..."
  #ln -s /mnt/zen/secnode /home/node/secnodetracker/config > /dev/null 2>&1 || true
#else
  #echo "No secure node config found. exiting"
  #exit 1
#fi

cd /home/node/secnodetracker

if [ -f ./config/stakeaddr ]; then
  echo "Secure node config found OK"
else
  echo "No secure node config found. Exiting"
  exit 1
fi

# Fix permissions of config files
chown -R node:node ./config

su-exec node "$@"
