# Handling & Sending Requests
## 1\) Handling Requests: `app.use()` and How it Works

In Express.js, **`app.use()`** is a fundamental method used to mount **middleware** functions. Middleware functions are functions that have access to the **request object (`req`)**, the **response object (`res`)**, and the `next` middleware function in the application’s request-response cycle. They can execute code, make changes to the request and response objects, end the request-response cycle, or call the next middleware in the stack.

Think of middleware as a series of checkpoints on a highway. Every request that comes into your server must pass through these checkpoints in the order they were defined.

**`app.use()`** allows you to add these checkpoints to your application. It’s a very versatile method that can be used for several purposes:

  * **Global Middleware**: When you use `app.use()` with a single middleware function, it will run for **every single request** that comes into your server, regardless of the URL or HTTP method.
  * **Path-Specific Middleware**: You can specify a path as the first argument to `app.use()`. The middleware will then only run for requests where the URL path starts with the specified path. This is useful for grouping related middleware.
  * **Express Built-in Middleware**: Express comes with its own built-in middleware for common tasks, such as parsing JSON bodies (`express.json()`) and URL-encoded data (`express.urlencoded()`).

### Code Example:

Here's an example showing how `app.use()` works with a global logging middleware:

```javascript
const express = require('express');
const app = express();

// A simple global logging middleware
app.use((req, res, next) => {
  console.log(`Request received at: ${new Date().toISOString()}`);
  console.log(`Method: ${req.method}, URL: ${req.url}`);
  // Call the next middleware in the stack
  next();
});

// A route that will be executed after the middleware
app.get('/', (req, res) => {
  res.send('Hello from the homepage!');
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
```

When you run this server and visit `http://localhost:3000`, the logging middleware will execute first, and then the route handler will send the response.

-----

## 2\) Sending a Response: The Request-Response Cycle

The **request-response cycle** is the fundamental process of web communication. A client (e.g., a web browser) sends an **HTTP request** to a server, and the server processes that request and sends back an **HTTP response**.

### The Transformation: HTTP to Object

When a client sends an HTTP request, it's just a raw text string. Node.js's built-in HTTP module parses this raw data and converts it into a structured, usable format. Express then takes this and enhances it, providing the **`request` (`req`)** and **`response` (`res`)** objects.

#### The Request Object (`req`):

The `req` object is an abstraction of the raw HTTP request. It's a rich JavaScript object with properties and methods that make it easy to access information about the incoming request, such as:

  * **`req.method`**: The HTTP method (e.g., `'GET'`, `'POST'`).
  * **`req.url`**: The URL path of the request.
  * **`req.params`**: An object containing URL parameters.
  * **`req.query`**: An object containing query string parameters.
  * **`req.body`**: The body of the request, often used for data from forms or JSON payloads.

## The Response Object (`res`):

The `res` object is an abstraction of the HTTP response the server will send back. It's an object with methods for sending various types of data back to the client and controlling the response. Key methods include:

  * **`res.send()`**: Sends a variety of response types, including strings, objects, and arrays.
  * **`res.json()`**: Sends a JSON response.
  * **`res.render()`**: Renders a view template and sends the resulting HTML.
  * **`res.status()`**: Sets the HTTP status code for the response.

#### Code Example:

This example shows how the `req` and `res` objects are used to handle a request and send a response.

```javascript
const express = require('express');
const app = express();

app.use(express.json()); // Middleware to parse JSON bodies

app.post('/submit', (req, res) => {
  // Access data from the request body
  const { name, email } = req.body;

  console.log(`Received submission from: ${name}`);
  
  // Use the res object to send a response
  res.status(200).json({
    message: 'Submission received successfully!',
    data: { name, email }
  });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
```

When a client sends a `POST` request to `/submit` with a JSON body like `{ "name": "Gemini", "email": "gemini@example.com" }`, Express parses the body into the `req.body` object. The route handler then uses `res.status(200).json()` to construct and send a formatted JSON response back to the client.