#!/bin/bash

#
# MySQL System Init script
#
# Copyright (c) 2009-2011 Wayne E. Seguin <wayneeseguin@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the \"License\");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an \"AS IS\" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Function Definitions
#
# Helper functions, for more readable maintainable code
log() { printf "$*\n" ; }

fail() { log "ERROR: $*" ; exit 1 ; }

# mysql control functions.
mysql_start()
{
  log "Starting mysql Server"

  ( su - "${user}" -c "$control --datadir=\"$data_path\"" start >> "$log_file" 2>&1 )&
}

mysql_stop()
{
  log "Stopping mysql Server"

  if [[ -s "${pid_file}" ]] ; then
    kill -QUIT $(cat "${pid_file}")
  fi
}

mysql_restart()
{
  log "Restarting mysql Server"

  mysql_stop

  # TODO: wait for stop
  mysql_start
}

mysql_status()
{
  # TODO: look closer at this.
  if [[ -s "${pid_file}" ]] ; then
    read pid < "$pid_file"

    if kill -0 $pid 2>/dev/null ; then
      log_success_msg "MySQL running ($pid)"
      exit 0
    else
      log_failure_msg "MySQL is not running, but PID file exists"
      exit 1
    fi
  fi
}

usage()
{
  log "
Usage:

  $0 [action]

Actions:

  start   - Start server
  stop    - Stop server
  restart - Restart server
  status  - Display server status
"
}

#
# Configuration
#

# Load settings from mysql.conf
[[ -s /etc/conf.d/mysql.conf ]] && source /etc/conf.d/mysql.conf

# Ensure defaults are set.
true \
  "${prefix_path:="/usr/local/mysql"}" \
  "${data_path:="/var/db/mysql/data/data"}" \
  "${log_file:="${data_path}/server.log"}" \
  "${config_file:="/etc/mysql/my.cnf"}" \
  "${user:="mysql"}" \
  "${pid_file:="/var/db/mysql/data/$HOSTNAME.pid"}"

# The path that is to be used for the script
PATH="${prefix_path}/bin:/bin:/usr/bin:/usr/local/bin:${PATH}"

# What to use to shut down the mysqld
control="${prefix_path}/bin/mysqld_safe"

#
# Main Logic
#
[[ -x "$control" ]] ||
  fail "Could not find mysqld_safe or mysqld_safe is not executable."

#
# Parse CLI arguments.
#

set -e

case "$1" in

  start)
    mysql_start
    ;;

  stop)
    mysql_stop
    ;;

  restart)
    mysql_restart
    ;;

  status)
    mysql_status
    ;;

  help)
    usage
    ;;

  *)
    usage
    false
    ;;

esac

exit $?
