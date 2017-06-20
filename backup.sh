#!/bin/sh

set -x

mySqlUser="${MYSQL_USER:-root}"

userPasswordOptions="--user=${mySqlUser}"

if [ "${MYSQL_ALLOW_EMPTY_PASSWORD}" -ne "1" ]; then
    if [ "${MYSQL_PASSWORD}" = "" ]; then
        if [ "${mySqlUser}" = "root" ]; then
            mySqlPassword="${MYSQL_ROOT_PASSWORD}"
        fi
    else 
        mySqlPassword="${MYSQL_PASSWORD}"
    fi
    userPasswordOptions="${userPasswordOptions} --password=${mySqlPassword}" 
fi

xtrabackup --backup --target-dir=${BACKUP_DIR} ${userPasswordOptions} --datadir /var/lib/mysql 
# First prepare - selfheal innodb and apply binary log to make it consistent
xtrabackup --prepare --target-dir=${BACKUP_DIR}
# Second prepare - write logfiles for faster server startup
xtrabackup --prepare --target-dir=${BACKUP_DIR}
