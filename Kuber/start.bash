#!/bin/bash

echo "1 - Launch application"
echo "2 - Remove all components"
echo "0 - Exit"
echo "Enter the command number:"

read arg0

while [ $arg0 != "0" ]; do
  if [[ $arg0 == "1" ]]; then

    cd ./Database/
    bash start.bash
    cd ../Info-service
    kubectl apply -f info-service.yaml
    x=$(kubectl describe po info-service | grep Ready: | grep -o True)
    while [[ "$x" != "True" ]]; do
      echo "Waiting 3 seconds"
      sleep 3
      x=$(kubectl describe po info-service | grep Ready: | grep -o True)
    done

    cd ../

  elif [[ $arg0 == "2" ]]; then
    kubectl delete services,deploy,pods,pv,pvc,secret,configmap -l project=docker-kubernetes
  fi

  echo "Done!"
  echo "Enter the command number:"
  read arg0
done
exit
