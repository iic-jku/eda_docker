#!/bin/bash
# every exit != 0 fails the script
set -e

echo "Starting container..."
# shellcheck disable=SC1091
source "/generate_container_user.sh"
# shellcheck disable=SC1091
cd $HOME
export QT_X11_NO_MITSHM=1
xfce4-terminal -e /bin/tcsh --title="EDA Docker Terminal"

trap cleanup SIGINT SIGTERM
