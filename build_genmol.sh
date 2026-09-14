#!/bin/bash -e

#Set up cache folders
unset APPTAINER_BIND
APPTAINER_CACHEDIR=$(mktemp -d)
APPTAINER_TMPDIR=${APPTAINER_CACHEDIR}

#Build container and make readable to everyone 
apptainer build --force genmol.sif genmol.def
chmod 640 genmol.sif

#Should also be available via
# apptainer pull genmol.sif oras://ghcr.io/acsrc-shoc2/genmol/genmol:latest
