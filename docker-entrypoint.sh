#!/bin/sh
if [ "$1" = 'app' ]; then
    cd /src/
    python3 app.py
else
  exec "$@"
fi
