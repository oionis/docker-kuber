#!/bin/bash

echo "1 - Deploy database"
echo "2 - Remove all database components"
echo "0 - Exit"
echo "Enter the command number:"

read arg0

while [ $arg0 != "0" ]; do
  if [[ $arg0 == "1" ]]; then
    echo "Please write your postress password : "
    read arg1
    kubectl create secret generic postgres-secret --from-literal=POSTGRES_PASSWORD=$arg1
    kubectl label secret postgres-secret app=postgres
    kubectl label secret postgres-secret project=docker-kubernetes
    kubectl apply -f postgres-configmap.yaml
    kubectl apply -f postgres.yaml

    x=$(kubectl describe po postgres | grep Ready: | grep -o True)
    while [[ "$x" != "True" ]]; do
      sleep 3
      echo "Waiting 3 seconds"
      x=$(kubectl describe po postgres | grep Ready: | grep -o True)
    done

  elif [[ $arg0 == "2" ]]; then
    kubectl delete services,deploy,pods,pv,pvc,secret,configmap -l app=postgres
  fi

  echo "Done!"
  echo "Enter the command number:"
  read arg0
done
exit
