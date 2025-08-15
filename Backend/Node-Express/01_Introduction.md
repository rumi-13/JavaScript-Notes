# Express: Introduction
Express is a **minimalist and flexible Node.js web application framework** that provides a robust set of features for building web and mobile applications. It simplifies the process of creating server-side applications, APIs, and handling web traffic.

-----

## How Express Works

Express is built on top of Node.js's built-in HTTP module. It helps you manage the complexities of handling web requests and responses by providing a clean and organized way to structure your application. When a user sends a request to your server, Express uses a chain of **middleware** and **routing** to process that request and send back an appropriate response.

Here are the key uses you mentioned:

### 1\) Listen to Incoming Requests

Express provides a simple way to create an HTTP server that listens for incoming requests on a specified port. The `app.listen()` method binds your application to a port, making it accessible to web browsers or other clients.

```javascript
const express = require('express');
const app = express();
const port = 3000;

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
```

This code creates an Express application instance (`app`) and starts a server that listens on port 3000. Any requests sent to `http://localhost:3000` will be handled by this application.

-----

### 2\) Parse the Request

When a client sends data to your server (e.g., through a form or an API request), that data needs to be parsed and made available for you to use. Express provides built-in middleware to handle this automatically.

  * **`express.json()`**: This middleware parses incoming requests with JSON payloads. This is essential for building RESTful APIs where clients often send data in JSON format.
  * **`express.urlencoded()`**: This middleware parses incoming requests with URL-encoded payloads, commonly used for form submissions.

You enable this middleware with `app.use()`:

```javascript
const express = require('express');
const app = express();

app.use(express.json()); // Parses JSON bodies
app.use(express.urlencoded({ extended: true })); // Parses URL-encoded bodies

// Example route that uses the parsed request body
app.post('/profile', (req, res) => {
  console.log(req.body); // The parsed request body
  res.send('Profile created!');
});
```

-----

### 3\) Match the Response with Routes

**Routing** is the process of determining how an application responds to a client request for a specific endpoint (a URI) and a particular HTTP method (e.g., GET, POST). Express provides a powerful routing system for this.

You define a route by using an HTTP method function (`.get()`, `.post()`, `.put()`, `.delete()`) on the `app` instance, followed by the path and a callback function to handle the request and response.

```javascript
const express = require('express');
const app = express();

// GET request to the homepage
app.get('/', (req, res) => {
  res.send('Welcome to the homepage!');
});

// POST request to create a new user
app.post('/users', (req, res) => {
  // Logic to create a user...
  res.send('New user created successfully!');
});

// GET request with a parameter
app.get('/users/:id', (req, res) => {
  const userId = req.params.id;
  res.send(`User ID: ${userId}`);
});
```

In this example, Express matches the incoming request URL and method with the defined routes and executes the corresponding callback function to send a response back to the client.

# Getting Started
Starting with Express is a straightforward process. You can get a basic server up and running in just a few steps.

### Step 1: Create a Project Directory

First, create a new folder for your project. You can do this from your terminal.

```bash
mkdir my-express-app
cd my-express-app
```

### Step 2: Initialize Your Project

Next, you need to create a `package.json` file to manage your project's dependencies. The `npm init` command will walk you through a short setup.

```bash
npm init -y
```

The `-y` flag answers "yes" to all the prompts, creating a default `package.json` file quickly.

### Step 3: Install Express

Now, install the Express framework using the npm command. The `--save` flag (which is the default behavior for `npm install`) adds Express to your project's dependencies in `package.json`.

```bash
npm install express
```

After this command runs, you will see a `node_modules` directory and a `package-lock.json` file appear in your project folder.

### Step 4: Write Your Server Code

Create a file named `index.js` (or any other name you prefer, but `index.js` is a common convention) and add the following code. This code imports Express, creates an application, and sets up a simple route that sends a "Hello, World\!" message.

```javascript
// index.js

const express = require('express');
const app = express();
const port = 3000;

// Define a route for the root URL
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Start the server
app.listen(port, () => {
  console.log(`Express server listening at http://localhost:${port}`);
});
```

This is your first basic Express application. To run it, open your terminal and type `node index.js`. Then, navigate to `http://localhost:3000` in your web browser, and you will see the "Hello, World\!" message.