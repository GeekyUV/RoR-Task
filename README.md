
# Simple Authentication and Blog 
 project in rails where the user can perform login and registration without using any gem. Also, create APIs for login and registration. Once the user is logged in then show a list of posts/blogs. Create API to get the list of blogs (only available to loggedin users)

#### project uses Ruby version 3.2.2 and Rails version 7.0.7


## Features
- user can register through credentials
- user can login through registered credentials.
- logged in user can see posts,create posts


## Getting Started
- Clone the repository:
```bash
git clone https://github.com/GeekyUV/RoR-Task.git
 ```

 - Set up the database:
  ```bash
rails db:create
rails db:migrate
 ```


 ```
Start the Rails server:

rails server or rails s

 ```

 ## EndPoints 
   
User Registration:

- API: POST /api/v1/register
- Purpose: Register a new user.
- Request Body: JSON containing user details (email, password).
- Response: JSON response indicating success or failure.


User Login:
- API: POST /api/v1/login
- Purpose: Authenticate a user and generate a session/token.
- Request Body: JSON containing user credentials (email, password).
- Response: JSON response indicating success or failure, along with a session/token.

Get Posts for a User:

- API: GET /api/v1/users/:user_id/posts
- Purpose: Retrieve posts for a specific user.
- Request: Requires an authentication token in headers.
- Response: JSON array containing posts' details.

Create Post for a User:

- API: POST /api/v1/users/:user_id/posts
- Purpose: Create a new post associated with a specific user.
- Request: Requires an authentication token in headers.
- Request Body: JSON containing post details (title, content).
- Response: JSON response indicating success or failure.

Get List of Active Users:
- API: GET /api/v1/all_users
- Purpose: Retrieve a list of active users.
- Request: Requires an authentication token in headers.
- Response: JSON array containing active users' details.

## CURL's to test through Postman

- to register a user 
```bash
curl --location 'http://localhost:3000/api/v1/register' \
--header 'Content-Type: application/json' \
--data-raw '{
  "user": {
    "username": "yuvi",
    "email": "yuvi@gmail.com",
    "password": "yuvi@123"
  }
}'
```

- to login a user 
```bash
curl --location 'http://localhost:3000/api/v1/login' \
--header 'Content-Type: application/json' \
--data-raw '{
  "email": "yuvi@gmail.com",
  "password": "yuvi@123"
}'
```
- to see posts for logged in user
```bash
curl --location 'http://localhost:3000/api/v1/users/5/posts'

replace 5 with valid user_id
```

- to create a post by logged in user
```bash
curl --location 'http://localhost:3000/api/v1/users/5/posts' \
--header 'Authorization: Bearer YOUR_ACCESS_TOKEN' \
--header 'Content-Type: application/json' \
--data '{"post": {"title": "My Post", "content": "This is the content of my post."}}'
```

- to see the list of active users 
```bash
curl --location 'http://localhost:3000/api/v1/all_users'
```

#### This project can be modified further and authentication token system can be introduced by using popular gems like devise and jwt.

 






