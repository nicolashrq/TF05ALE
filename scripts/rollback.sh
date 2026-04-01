#!/bin/bash

BACKUP=$1

echo "Rollback..."

cat $BACKUP/db.sql | docker exec -i db mysql -u user -ppass app

echo "Rollback concluído!"