#! /bin/bash

# Start the X system.
# Run as root

LOGFILE=/tmp/XLogs
rm -f "${LOGFILE}"
touch "${LOGFILE}"

(
    dbus_daemon
    export DISPLAY=:20
    Xvfb :20 -screen 0 1900x1200x16 &
    x11vnc -passwd frogfrog -ncache 10 -display :20 -N -forever &
) > "${LOGFILE}" 2>&1

# The Docker container just stays alive
while true ; do
    sleep 1000
done
