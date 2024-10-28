#!/bin/bash

# Redirect standard out and standard error to a file.
exec &> /var/log/fix-unknown-pods.log
echo $(date +"%D %T")" Fixing any pods in Unknown state. Waiting 90s after boot..."

(
    sleep 90
    UNKNOWN_PODS=$(sudo kubectl get pods -A | grep Unknown)
    if [ -z "${UNKNOWN_PODS}" ]; then
      echo $(date +"%D %T")" No Unknown pods found."
    else  
      echo $(date +"%D %T")" 90s elapsed, finding and fixing all Unknown pods."
      for i in $(sudo k3s ctr c ls | awk '{print  $1}'); do sudo k3s ctr c rm $i; done
      sudo service k3s restart
      echo "All done - things should be back up and running in just a moment"
    fi
) &

exit 0
