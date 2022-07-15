# graphql-demos
This repo is a parking lot for common demo use cases. Generally speaking, each directory should be a standalone deployment that includes all the files you need to get that use case working.

### fragments
Example app that's useful to demonstrate language support for fragments in GraphQL.

### graphql-bookinfo
This is a local copy of bookinfo GQL example app that I hack on for specific demos. You should use the main repo instead for the most recent version:
https://github.com/solo-io/graphql-bookinfo

### mock-resolver
Demonstrates using a mock resolver to return data for a GraphQL query without any backing upstream APIs.

### rest-example
Basic REST API with OpenAPI 3 definition that's useful for demonstrating discovery/autogen. This one has mutations for creating/updating/deleting Track objects which makes it handy for showing off more GraphQL language features.

### stitching-grpc
Three gRPC APIs that leverage autogeneration to create GraphQL subgraphs, then we stitch them together into a single unified graph.

### petstore
GraphQL API for the classic REST petstore example

### remote-resolver
Demonstrates use of remote-resolver to incroporate an existing GraphQL API (Tracks API) into a Gloo GraphQL remote resolver.
