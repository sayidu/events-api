# Mock: Events API
Events API contains API endpoints which allows users to create, edit, retrieve and delete events.

## API ENDPOINTS
Access for the endpoints are restricted based on the Authorization token assigned to the user.
Users are assigned a token on creation and login to the system, this token is therefore used
to authorise access to the API endpoints.

**Users**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/api/users](#create-users) | Create a new user
GET | [/api/users](#get-users) | Get all users
GET | [/api/users/:id](#get-a-user) | Get details of a specific user
PUT | [/api/users/:id](#update-user) | Edit user details
DELETE | [/api/users/:id](#delete-user) | Remove a user fro0m storage
POST | [/api/auth](#login) | To log a user in
POST | [/api/auth](#logout) | Log a user out

**Roles**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/roles](#create-a-role) | Create a new role
GET | [/roles](#get-roles) | Get all created roles
PUT | [/roles/:id](#update-a-role) | Update a new role
DELETE | [/roles/:id](#delete-a-role) | Delete a role

**Documents**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/documents](#create-a-document) | Create a new document
GET | [/documents](#get-documents) | Retrieve all documents
GET | [/documents/:id](#get-a-document) | Retrieve a specific document
GET | [/api/users/:id/documents](#get-documents-by-user) | Retrieve all documents created by a user
GET | [/documents?offset=1&limit=10](#get-documents) | Retrieve maximum of first 10 documents
PUT | [/documents/:id](#update-a-document) | Update a specific document
DELETE | [/documents/:id](#delete-a-document) | Delete a specific document
