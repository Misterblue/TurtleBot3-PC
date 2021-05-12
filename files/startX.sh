#! /bin/bash

XFCE4LOG=Xfce4-session.log
rm -f ${XFCE4LOG}

export DISPLAY=${DISPLAY:-:20}

startxfce4 > "${XFCE4LOG}" 2>&1 &

# turn off screen saver (blanking) as not needed for X session
( sleep 20 ; xset s off ) &
