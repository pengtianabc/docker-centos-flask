#!/bin/sh
if [ "$1" = 'app' ]; then
    (. /venvpy3/bin/activate && uwsgi  --ini /etc/uwsgi/uwsgi.ini --uid `whoami`)
else
  exec "$@"
fi
