The remote-resolver example shows how to integrate an existing GraphQL API with Gloo's GraphQL support via a remote resolver. The example is completely self-contained with all components defined in this repo:
- The Tracks REST API implemented with JSON server
- The Tracks GraphQL API implemented with Apollo Server
- The Gloo GraphQL API configuration routing to Tracks GraphQL API using remote resolver

This provides a lot of flexibility in testing various setups with the original REST API and the GraphQL API implemented in Apollo. If you want to change the schema, returned data, etc. just update these components and deploy new container images to your container repo.

### Step by Step
Simplest way to get up and running is to use the existing REST and GraphQL API container images for the example.
1. **Deploy the REST and GraphQL APIs**
```
k apply -f kubernetes/graphql-api.yaml 
```
2. **Deploy the Gloo GraphQL API with remote resolver**
```
k apply -f kubernetes/graphql-remote.yaml 
```
3. **Deploy the Virtual Service to expose the original GraphQL API and the Gloo GraphQL API**
```
k apply -f kubernetes/graphql-remote-vs.yaml 

```
4. **Send a query to test it out**
```
curl -H "Content-Type: application/json" -d "@etc/query.json" http://localhost:8080/graphql
```

If you are debugging the interaction between Gloo GraphQL remote resolver and the original GraphQL API, then use the ```/graphql``` path to test the Gloo GraphQL API and the ```/tracks-graphql``` path to test the original GraphQL API.
