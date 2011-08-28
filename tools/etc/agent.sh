#!/bin/bash
export PATH=$PATH:$HOME/.nvm/v0.4.11/bin
export NODE_PATH=$HOME/.nvm/v0.4.11/lib/node_modules/

APPDIR=$(dirname $0)/..
cd $APPDIR
exec node agent.js
