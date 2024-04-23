#!/bin/sh

CONFIG_DIR="${CONFIG_DIR:-/etc/alertmanager}"

for i in $(env | grep "^AM_"); do
    KEY=$(echo $i | cut -d '=' -f 1)
#   escape special characters
    VALUE=$(echo $i | cut -d '=' -f 2 | sed 's/[&/\]/\\&/g')
    echo "Replacing $KEY with $VALUE in configuration files"

    sed -i "s|%%$KEY%%|$VALUE|g" "$CONFIG_DIR/config.yml"
    if [ -d "$CONFIG_DIR/template" ]; then
        sed -i "s|%%$KEY%%|$VALUE|g" "$CONFIG_DIR/template"/*.tmpl
    fi
done

exec /bin/alertmanager "$@"
