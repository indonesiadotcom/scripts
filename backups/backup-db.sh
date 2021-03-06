#!/bin/bash
# Database Backup Script
# Originator    : Mirasz

# Global
DATE=$(date +%Y%m%d%H%M)

# MySQL
AUTH="-hlocalhost -uuser -pp4ssw0rd"
OPT="--opt --single-transaction"
OPT1="--no-data --no-create-db --routines --triggers --events"
DB="database"

# Directory & File
DIR="/data/backups/"
NAME="$DATE-$DB.sql.gz"
NAME1="$DATE-$DB-routines.sql"

# Execution
mysqldump $AUTH $OPT $DB | gzip > $DIR$NAME
mysqldump $AUTH $OPT $OPT1 $DB > $DIR$NAME1

# Clean Up
find $DIR -type f -iname '*'$DB'.sql*' -mtime +3 -exec rm {} \;
