#!/bin/sh -x
# Remove a potentially pre-existing server.pid for Rails.
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

chown -R consul:consul /var/www/consul
# Then exec the container's main process (what's set as CMD in the Dockerfile).
/usr/bin/sudo -EH -u consul "$@"

