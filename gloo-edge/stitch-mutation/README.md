# Stitched Mutations

## Kicking the tires
```
# Deploy the Foo and Bar GraphQL APIs that return mock responses
kubectl apply -f bar-api-gql.yaml
kubectl apply -f foo-api-gql.yaml

# Deploy a VS that points directly to bar
kubectl apply -f bookinfo-gql.yaml

# Port forward the gateway endpoint
kubectl port-forward -n gloo-system deploy/gateway-proxy 8080

# Verify mutation for Bar GraphQL API
curl -d "@mutation.json" http://localhost:8080/graphql

# Deploy stitched GraphQL API and point the VS to the stitched GraphQL API
kubectl apply -f stitched-gql.yaml
kubectl apply -f stitched-vs.yaml

# Run the mutation again and note that the request is rejected by the stitched schema
curl -d "@mutation.json" http://localhost:8080/graphql

# Note that query fields still work
curl -d "@query.json" http://localhost:8080/graphql



