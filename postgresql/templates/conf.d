# Which port and socket to bind PostgreSQL
PGPORT="{{port}}"

# Allow *_TIMEOUT to run its course.
# Disable timeouts by changing to '-W' (capital W)
WAIT_FOR_START="-w"
WAIT_FOR_STOP="-w"

# How long to wait for server to start in seconds
START_TIMEOUT=60

# Ignore new connections and wait for clients to disconnect from server before
# shutting down.
# Set NICE_QUIT to "NO" to disable. NICE_TIMEOUT in seconds.
NICE_QUIT="YES"
NICE_TIMEOUT=60

# Forecfully disconnect clients from server and shut down. This is performed
# after NICE_QUIT. Terminating a client results in a rollback of open
# transactions for that client.
# Set RUDE_QUIT to "NO" to disable. RUDE_TIMEOUT in seconds.
RUDE_QUIT="YES"
RUDE_TIMEOUT=30

# If the server still fails to shutdown, you can force it to quit by setting
# this to yes and a recover-run will execute on the next startup.
# Set FORCE_QUIT to "YES" to enable. FORCE_TIMEOUT in seconds.
FORCE_QUIT="NO"
FORCE_TIMEOUT=2

# Extra options to run postmaster with, e.g.:
# -N is the maximal number of client connections
# -B is the number of shared buffers and has to be at least 2x the value for -N
# Please read the man-page to postmaster for more options. Many of
# these options can be set directly in the configuration file.
#PGOPTS="-N 512 -B 1024"

# Pass extra environment variables. If you have to export environment
# variables for the database process, this can be done here.
# Don't forget to escape quotes.
#PG_EXTRA_ENV="PGPASSFILE=\"/path/to/.pgpass\""

##############################################################################
#
# The following values should not be arbitrarily changed.
# emerge --config dev-db/postgresql-server:9.1 uses these values to
# determine where to create the data directory, where to place the
# configuration files and any additional options you'd like to pass to initdb.
#
# The init script also uses these variables to inform pg_ctl where to find
# the same data and configuration files.
#
##############################################################################

# Location of configuration files
PGDATA="{{service_data_path}}"

# Where the data directory is located/to be created
DATA_DIR="${PGDATA}"

# Additional options to pass to initdb.
# See 'man initdb' for available options.
PG_INITDB_OPTS="--encoding=utf8 --locale=C"
