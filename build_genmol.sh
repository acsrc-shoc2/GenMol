#!/bin/bash -e

#Set up cache folders
unset APPTAINER_BIND
export APPTAINER_CACHEDIR=$(mktemp -d)
export APPTAINER_TMPDIR=${APPTAINER_CACHEDIR}

#Confirm a valid NGC API key is available before attempting to log in / build
if ! "$(dirname "$0")/check_genmol_api_key.sh"; then
  echo "A valid NGC API key for genmol is required before building. Fix the key above and re-run this script." >&2
  exit 1
fi

#Log in to NVIDIA NGC registry (genmol requires an authenticated pull)
cat ~/.ngc/ngc_api_key.genmol | apptainer registry login --username '$oauthtoken' --password-stdin docker://nvcr.io

#Build container and make readable to everyone
apptainer build --force genmol.sif genmol.def
chmod 640 genmol.sif

#Should also be available via
# apptainer pull genmol.sif oras://ghcr.io/acsrc-shoc2/genmol/genmol:latest