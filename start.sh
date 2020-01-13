#!/bin/sh

# define the default config file.
CONF_FILE="/etc/nginx/sites-available/default"

# Extract the domain
DOMAIN="$(echo $URL | sed -e 's/[^/]*\/\/\([^@]*@\)\?\([^:/]*\).*/\2/')"

# Substitute domain in configuration file
/bin/sed -i "s,<domain>,${DOMAIN}," ${CONF_FILE}

#change directories for the mirror
cd /var/www/html
mkdir ${DOMAIN}

# Encoding for Click
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# do the mirror in the background
python3 /usr/local/src/python_mirror.py --url=${URL} --path=/var/www/html/${DOMAIN} \
   --replace_urls_str=${REPLACE_URLS} --wait=${WAIT} &

# start nginx
nginx -g "daemon off;"