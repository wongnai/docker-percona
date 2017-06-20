# docker-percona
Percona Server with xtrabackup.

This docker image basically extends from https://hub.docker.com/_/percona/ and includes [xtrabackup](https://www.percona.com/doc/percona-xtrabackup/LATEST/index.html).

You need to mount volume to /backup to keep the backup files.

To backup file to /backup, just run 

    backup.sh

The script uses the following environment variables which are same as the Percona server's.

* MYSQL_USER 
* MYSQL_PASSWORD
* MYSQL_ROOT_PASSWORD (used if MYSQL_USER is root or undefined and not empty password)
* MYSQL_ALLOW_EMPTY_PASSWORD (used if MYSQL_USER is root or undefined)
