#!/bin/bash

DEST=$1
mkdir -p $DEST

docker exec db mysqldump -u user -ppass app > $DEST/db.sql

echo "Backup concluído!"    