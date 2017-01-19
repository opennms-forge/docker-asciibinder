#!/bin/bash -e
# =====================================================================
# Build script running asciibinder build command
#
# Source: https://github.com/indigo423/docker-asciibinder
#
# =====================================================================

/opt/rh/rh-ruby22/root/usr/local/bin/asciibinder ${@}
