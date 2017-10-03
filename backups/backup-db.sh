#!/bin/bash
# Database Backup Script
# Originator    : Mirasz

DATE=$(date +%Y%m%d%H%M)

# MySQL
AUTH="-hlocalhost -uuser -pp4ssw0rd"
OPT="--opt --single-transaction"
DB="database"

# Directory & File
DIR="/data/backups/"
NAME="$DATE-$DB.sql.gz"

# Execution
mysqldump $AUTH $OPT $DB | gzip > $DIR$NAME
find $DIR -type f -iname '*'$DB'.sql*' -mtime +3 -exec rm {} \;
