#!/bin/bash

options=($(yq e '.tasks.'$repository.$task' | to_entries | .[] | .key' $DEVCONFIGS_YML))
for option in "${options[@]}"; do
    option_value=$(yq e '.tasks.'$repository.$task.$option $DEVCONFIGS_YML)
    case $option in
        directory)
            DIRECTORY_COMMAND="cd $option_value && "
            ;;
        doppler)
            DOPPLER_COMMAND="rm -rf .env && doppler run --mount .env -- "
            ;;
        port)
            PORT_COMMAND=" -p $option_value"
            ;;
    esac
done

TASK_COMMAND="${DIRECTORY_COMMAND}${DOPPLER_COMMAND}flask run${PORT_COMMAND}"
cat $TASK_DIRECTORY/_config.json > $TASK_DIRECTORY/config.json
jq -r --arg val "$TASK_COMMAND" '.command |= $val' $TASK_DIRECTORY/_config.json > $TASK_DIRECTORY/config.json