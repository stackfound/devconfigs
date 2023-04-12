#!/bin/bash

options=($(yq e '.tasks.'$repository.$task' | to_entries | .[] | .key' $DEVCONFIGS_YML))
for option in "${options[@]}"; do
    option_value=$(yq e '.tasks.'$repository.$task.$option $DEVCONFIGS_YML)
    case $option in
        repo)
            REPO=$option_value
            ;;
    esac
done

TASK_COMMAND="rm -rf ~/dotfiles && cd ~/ && git clone $REPO && cd dotfiles/ && ./install"
cat $TASK_DIRECTORY/_config.json > $TASK_DIRECTORY/config.json
jq -r --arg val "$TASK_COMMAND" '.command |= $val' $TASK_DIRECTORY/_config.json > $TASK_DIRECTORY/config.json

