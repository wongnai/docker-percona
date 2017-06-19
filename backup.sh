#!/bin/sh

echo "MYSQL_USER = ${MYSQL_USER}"
echo "MYSQL_PASSWORD = ${MYSQL_PASSWORD}"
echo "BACKUP_DIR = ${BACKUP_DIR}" 

xtrabackup --backup --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --datadir /var/lib/mysql --target-dir=${BACKUP_DIR}
# First prepare - selfheal innodb and apply binary log to make it consistent
xtrabackup --prepare --target-dir=${BACKUP_DIR}
# Second prepare - write logfiles for faster server startup
xtrabackup --prepare --target-dir=${BACKUP_DIR}
