FROM percona:5.7
MAINTAINER Suparit Krityakien

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A && \
    echo "deb http://repo.percona.com/apt vivid main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y percona-xtrabackup && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /target

ENV BACKUP_DIR
    
COPY backup.sh /usr/bin
