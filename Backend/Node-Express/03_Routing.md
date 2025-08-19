# Routing in Express?

**Routing** in Express is the process of determining how an application responds to a client request. It's essentially the navigation system for your web server. When a client makes a request, Express checks the request's **HTTP method** (like GET, POST, PUT, DELETE) and its **URL path** to match it with a corresponding route handler.

Routing is done using methods on the Express `app` object that correspond to the HTTP methods. The most common ones are `app.get()`, `app.post()`, `app.put()`, and `app.delete()`. Each method takes a path and a callback function as arguments. The callback function is the **route handler**, which contains the logic to handle the request and send a response.

-----

## `app.get()`: Path and Callback

The `app.get()` method is used to define routes that respond to **HTTP GET requests**. This is the most common type of request, used for fetching data from the server.

  * **`path`**: This is a string or a regular expression that represents the URL path.
  * **`callback`**: This is the function that Express executes when the path is matched. It always has access to the `req` (request) and `res` (response) objects.

### Path with a Route Parameter

You can define routes that include parameters in the URL, which are useful for fetching a specific item. You define a parameter by placing a colon (`:`) before the parameter name.

```javascript
app.get('/users/:userId', (req, res) => {
  const userId = req.params.userId;
  res.send(`Fetching user with ID: ${userId}`);
});
```

When a client visits `/users/123`, `req.params.userId` will be `'123'`.

### The `*` Default Path

The `*` symbol in a path acts as a wildcard. It's often used as a **default or catch-all route** to handle any requests that don't match any of the previously defined routes. It's important to place this route at the very end of your routing stack, otherwise it will match everything and prevent other routes from being reached.

```javascript
app.get('*', (req, res) => {
  res.status(404).send('404 Not Found');
});
```

This route will send a "404 Not Found" response for any URL that isn't explicitly defined by a previous route.

-----

## `app.post()`: Working

The `app.post()` method is used to define routes that respond to **HTTP POST requests**. POST requests are typically used to **send data to the server** to create a new resource. For example, a user submitting a form to create an account or a client sending JSON data to an API endpoint.

The working of `app.post()` is similar to `app.get()`, but it's specifically for handling incoming data.

**Key concepts for `app.post()`**:

  * **Middleware**: To access the data sent in a POST request body, you need to use middleware to parse it. The most common middleware for this is `express.json()` for JSON data and `express.urlencoded()` for form data.
  * **Request Body**: Once the body is parsed by middleware, you can access the data from the `req.body` object in your route handler.

### Code Example:

This example demonstrates how to use `app.post()` to handle a user signup request.

```javascript
const express = require('express');
const app = express();
app.use(express.json()); // Middleware to parse JSON data

app.post('/signup', (req, res) => {
  // Get data from the request body
  const { username, password } = req.body;

  // Perform some validation or database operations
  if (!username || !password) {
    return res.status(400).send('Username and password are required.');
  }

  // Logic to save the new user to a database...
  
  res.status(201).send(`User ${username} created successfully!`);
});
```

In this code, when a client sends a POST request to `/signup` with a JSON body, the `express.json()` middleware populates `req.body` with the data. The route handler then uses that data to perform an action and sends a response.
`GET` and `POST` are the two most common HTTP methods used in web development, but they have key differences in how they handle data and their intended purpose.

***
# GET vs POST

Here's a table summarizing the differences between `GET` and `POST` in the context of Express routing.

| Feature | `app.get()` (GET) | `app.post()` (POST) |
| :--- | :--- | :--- |
| **Primary Use** | **Retrieving** data from the server. | **Sending** data to the server to create/update a resource. |
| **Data Location** | In the **URL** as query parameters (`req.query`). | In the **request body** (`req.body`). |
| **Data Security** | Less secure; data is visible in the URL. | More secure; data is not visible in the URL. |
| **Data Size Limit** | Limited by the maximum URL length. | No practical limit. |
| **Middleware** | Not typically required for data parsing. | Requires middleware (e.g., `express.json()`) to parse the body. |
| **Example Use Case** | Fetching a list of products, displaying a user profile. | Submitting a new user signup form, uploading a new blog post. |
| **Express Route** | `app.get('/path', ...)` | `app.post('/path', ...)` |