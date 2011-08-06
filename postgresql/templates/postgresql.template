#!/bin/bash

#
# PostgreSQL System Init script
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

usage()
{
  log "
Usage:

  $0 [action]

Actions:

  start   - Start server
  stop    - Stop server
  restart - Restart server
  reload  - Reload configuration file
  status  - Display server status
"
}

#
# Configuration
#

# Load settings from postgresql.conf
if [[ -s /etc/conf.d/postgresql.conf ]]
then
  source /etc/conf.d/postgresql.conf
fi

# Ensure defaults are set.
true \
  "${prefix_path:="/usr/local/postgresql/active"}" \
  "${data_path:="/var/db/postgresql/active/data"}" \
  "${log_file:="${data_path}/server.log"}" \
  "${user:="postgres"}"

# The path that is to be used for the script
PATH="${prefix_path}/bin:/bin:/usr/bin:/usr/local/bin:${PATH}"

# What to use to shut down the postmaster
daemon="${prefix_path}/bin/postmaster"
control="${prefix_path}/bin/pg_ctl"
export PGDATA="${data_path}"

#
# Main Logic
#
[[ -x "$daemon" ]] ||
  fail "Could not find postmaster or postmaster is not executable."

[[ -x "$control" ]] ||
  fail "Could not find pg_ctl or pg_ctl is not executable."

#
# Parse CLI arguments.
#

set -e

case "$1" in

  start)
    postgresql_start
    ;;

  stop)
    postgresql_stop
    ;;

  restart)
    postgresql_restart
    ;;

  reload)
    postgresql_reload
    ;;

  status)
    postgresql_status
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
