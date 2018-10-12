#!/bin/bash
# Based on:
# https://github.com/wikiwi/stackdriver-agent

PID_FILE=/var/run/stackdriver-agent.pid

set -eo pipefail

stopDaemon() {
  service stackdriver-agent stop
  kill -9 ${LOG_PID}
}

service stackdriver-agent start
trap stopDaemon SIGINT SIGTERM
touch /var/log/collectd.log
tail /var/log/collectd.log -f &
LOG_PID=$!

# echo Waiting for collectd daemon to start
while [ ! -f "${PID_FILE}" ] ; do
  sleep 1;
done

# Waiting for collectd daemon to stop
while [ -f "${PID_FILE}" ] ; do
  sleep 1;
done

