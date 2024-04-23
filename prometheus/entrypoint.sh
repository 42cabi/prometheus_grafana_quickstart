#!/bin/sh

CONFIG_DIR="${CONFIG_DIR:-/etc/prometheus}"

for i in $(env | grep "^PM_"); do
    KEY=$(echo $i | cut -d '=' -f 1)
#   escape special characters
    VALUE=$(echo $i | cut -d '=' -f 2 | sed 's/[&/\]/\\&/g')
    echo "Replacing $KEY with $VALUE in configuration files"

    sed -i "s|%%$KEY%%|$VALUE|g" "$CONFIG_DIR/prometheus.yml"
    if [ -d "$CONFIG_DIR/rules" ]; then
        sed -i "s|%%$KEY%%|$VALUE|g" "$CONFIG_DIR/rules"/*.yml
    fi
done

exec /bin/prometheus "$@"
