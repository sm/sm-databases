#!/bin/sh

#
# /etc/conf.d/postgresql
#

# Postgresql installation location
prefix_path="{{packages_path}}/active"

# Data directory, note that the first /data is a symlink to the server version.
data_path="{{service_data_path}}/active/data"
export PG_DATA="{{service_data_path}}"

# Where to keep a log file
log_file="{{service_data_path}}/server.log"

# Who to run the postmaster as, usually "postgres".  (NOT "root")
user="postgres"

