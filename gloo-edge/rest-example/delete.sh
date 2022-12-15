#!/bin/sh
kubectl delete -f rest-example.yaml
kubectl -n gloo-system delete gql default-rest-example-5000
kubectl delete -f rest-example-vs.yaml