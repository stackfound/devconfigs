#!/bin/bash

DOPPLER_CONFIG=$(cat $WORKSPACE_FOLDER/.vscode/.DOPPLER_CONFIG)
DOPPLER_TOKEN=$(cat $WORKSPACE_FOLDER/.vscode/.DOPPLER_TOKEN)
DOPPLER_PROJECT_NAME="${WORKSPACE_FOLDER##*/}"

# remove no-longer-needed plain text token and config files
rm -rf $WORKSPACE_FOLDER/.vscode/.DOPPLER_CONFIG
rm -rf $WORKSPACE_FOLDER/.vscode/.DOPPLER_TOKEN

TASK_COMMAND="doppler setup --no-check-version --project $DOPPLER_PROJECT_NAME --config $DOPPLER_CONFIG --token $DOPPLER_TOKEN"
cat $TASK_DIRECTORY/_config.json > $TASK_DIRECTORY/config.json
jq -r --arg val "$TASK_COMMAND" '.command |= $val' $TASK_DIRECTORY/_config.json > $TASK_DIRECTORY/config.json

