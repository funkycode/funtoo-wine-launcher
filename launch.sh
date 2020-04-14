#!/bin/bash
service dbus start >/dev/null 2>&1

# set up pulse config
install -d /etc/pulse
cat > /etc/pulse/client.conf << EOF
# Connect to the host's server using the mounted UNIX socket
default-server = ${PULSE_SERVER}

# Prevent a server running in the container
autospawn = no
daemon-binary = /bin/true

# Prevent the use of shared memory
enable-shm = false
EOF
