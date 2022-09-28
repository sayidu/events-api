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
DELETE | [/api/auth](#logout) | Log a user out

**Events**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/events](#create-a-event) | Create a new event
GET | [/events](#get-events) | Get all created events
PUT | [/events/:id](#update-a-event) | Update a new event
DELETE | [/events/:id](#delete-a-event) | Delete a event

**Attendees**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/attendees](#create-a-attendee) | Create a new attendee
GET | [/attendees](#get-attendees) | Retrieve all attendees
GET | [/attendees/:id](#get-a-attendee) | Retrieve a specific attendee
GET | [/api/users/:id/attendees](#get-attendees-by-user) | Retrieve all attendees created by a user
GET | [/attendees?page=10](#get-attendees) | Retrieve page 10 for attendees
PUT | [/attendees/:id](#update-a-attendee) | Update a specific attendee
DELETE | [/attendees/:id](#delete-a-attendee) | Delete a specific attendee
