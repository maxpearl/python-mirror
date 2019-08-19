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

# do the mirror in the background
python /usr/local/src/python_mirror --url=${URL} --path=/var/www/html/${DOMAIN} &

# start nginx
nginx -g "daemon off;"