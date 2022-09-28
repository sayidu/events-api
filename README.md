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
DELETE | [/api/users/:id](#delete-user) | Remove a user
POST | [/api/auth](#login) | To log a user in
DELETE | [/api/auth](#logout) | Log a user out

**Events**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/api/events](#create-a-event) | Create a new event
GET | [/api/events](#get-events) | Get all created events
PUT | [/api/events/:id](#update-a-event) | Update a new event
DELETE | [/api/events/:id](#delete-a-event) | Delete a event

**Attendees**

Request type | Endpoint | Action
------------ | -------- | ------
POST | [/api/attendees](#create-a-attendee) | Create a new attendee
GET | [/api/attendees](#get-attendees) | Retrieve all attendees
GET | [/api/attendees/:id](#get-a-attendee) | Retrieve a specific attendee
GET | [/api/attendees?page=10](#get-attendees) | Retrieve page 10 for attendees
PUT | [/api/attendees/:id](#update-a-attendee) | Update a specific attendee
DELETE | [/api/attendees/:id](#delete-a-attendee) | Delete a specific attendee
