#!/bin/bash

API="http://localhost:5000/health/status"

case "$1" in
  --check-all)
    curl -s $API
    ;;

  --watch)
    while true; do
      clear
      curl -s $API
      sleep 5
    done
    ;;

  --report)
    curl -s $API
    ;;
esac