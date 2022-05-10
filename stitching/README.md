
*Step 1*
Deploy the upstream gRPC services
```
kubectl apply -f kubernetes/deploy.yaml
```

*Step 2*
Label the services for discovery so that GraphQL APIs can be automatically generated.
```
kubectl label service reviews discovery.solo.io/function_discovery=enabled
kubectl label service users discovery.solo.io/function_discovery=enabled
kubectl label service products discovery.solo.io/function_discovery=enabled
```
Wait a moment and then check to make sure that GraphQL APIs have been created.
```
kubectl -n gloo-system get gql 
```
*Step 3*
Deploy the stitched GraphQL API which combines all three GraphQL APIs into a single unified API.
```
kubectl apply -f kubernetes/gateway-gql.yaml
```

*Step 4*
Deploy a Virtual Service that defines routes for every GraphQL API. Note that in most cases you would only expose a route for the stitched GraphQL API and keep the subgraph APIs private. However, in this case we want to expose them all so we can test some differences between subgraphs and the stitched graph.
```
kubectl apply -f kubernetes/gateway-vs.yaml
```

*Step 5*
Let's try a query on the Products GraphQL API that returns product and user details for a given seller:
```
curl -d "@etc/product-api-request.json" localhost:8080/graphql-products 
```
```graphql
{"data":{"GetProductsSoldByUser":{"products":[{"name":"Refined Rubber Keyboard","id":5,"price":"278.00","seller":{"username":"isimon"}}]}}}
```
Now let's try a query against the stitched GraphQL API:
```
curl -d "@etc/stitched-api-request.json" localhost:8080/graphql  
```
```graphql
{"data":{"GetProductsSoldByUser":{"products":[{"name":"Refined Rubber Keyboard","id":5,"price":"278.00","seller":{"username":"isimon","first_name":"Ines","last_name":"Simon","country_code":"MM"}}]}}}
```
Note that the stiched API returns all the additional user information available through the Users GraphQL API subgraph that has been merged into the stitched API.