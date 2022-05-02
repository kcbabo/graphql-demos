# Istio BookInfo API - GraphQL edition

## Files in this repo
- **kubernetes** : CRs to deploy GraphQL service and a Virtual Service
- **openapi** : OpenAPI definitions for the individual BookInfo microservices along with the original (consolidated) BookInfo REST API

## Kicking the tires
```
# Deploy the BookInfo sample application
kubectl apply -f kubernetes/bookinfo.yaml

# Deploy the GraphQL API
kubectl apply -f kubernetes/bookinfo-gql.yaml

# Deploy the Virtual Service
kubectl apply -f kubernetes/bookinfo-vs.yaml

# Port forward the gateway endpoint
kubectl port-forward -n gloo-system deploy/gateway-proxy 8080

# Query the GraphQL service
curl -d "@etc/query.json" http://localhost:8080/graphql
```

Or point your favorite GraphQL client at the following URL and have fun!

http://localhost:8080/graphql




