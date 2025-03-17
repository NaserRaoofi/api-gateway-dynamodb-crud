Features

API Gateway with RESTful Endpoints:

POST /product: Inserts a new product into DynamoDB.

GET /product?id=xyz: Retrieves a product by ID.

DynamoDB Table:

Stores product information.

Configured with on-demand or provisioned capacity.

Supports TTL, Streams, and Server-Side Encryption.

Data Import Automation:

Reads data from a JSON file and inserts it into DynamoDB.

IAM Role Permissions:

Ensures API Gateway has correct access to DynamoDB.
