#!/bin/bash

# check command (returns exit status 1 if dep not satisfied)
which doppler > /dev/null

# pass plain text Doppler config and token to container
VSCODE_FOLDER=$WORKSPACE_FOLDER/.vscode
echo $DOPPLER_CONFIG > $VSCODE_FOLDER/.DOPPLER_CONFIG
echo $(doppler configure get token --plain) > $VSCODE_FOLDER/.DOPPLER_TOKEN