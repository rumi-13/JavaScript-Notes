# 1\.  GET and POST?

**GET** and **POST** are the two most common HTTP request methods used to send data between a web browser and a server. GET is used to **request** data from a specified resource, while POST is used to **submit** data to be processed by a resource.

-----

## 2\. GET Method

**a) What is GET?**

The GET method is used to retrieve data from the server. It's essentially a request to "get" information, like asking a server for a specific webpage or an image. When you type a URL into your browser, you're making a GET request.

**Pros and Cons of GET:**

  * **Pros:**
      * **Caching:** GET requests can be cached by browsers, which can speed up subsequent requests for the same data.
      * **Bookmarks:** Since the data is part of the URL, GET requests can be bookmarked and shared.
  * **Cons:**
      * **Limited Data:** The amount of data you can send with a GET request is limited by the maximum URL length supported by different browsers and servers.
      * **Visible Data:** The data is sent in the URL's **query string**, making it visible to everyone. This is a major security risk for sensitive information like passwords.

**b) How to use the GET method:**

In Express.js, you handle GET requests using `app.get()`. You can access data sent via the URL in two ways:

  * **`req.params`**: This is used to capture values from the URL's path. For example, in the route `/users/:id`, `:id` is a parameter.

**Code Example:**

```javascript
app.get('/users/:id', (req, res) => {
  const userId = req.params.id;
  // Use userId to fetch data from the database
  res.send(`Fetching user with ID: ${userId}`);
});
```

  * **`req.query`**: This is used to access the data in the query string (`?key=value`).

**Code Example:**

```javascript
// URL: /search?q=nodejs&sort=asc
app.get('/search', (req, res) => {
  const searchTerm = req.query.q;
  const sortOrder = req.query.sort;
  res.send(`Searching for "${searchTerm}" with sort order: ${sortOrder}`);
});
```

-----

## 3\. POST Method

**a) What is POST?**

The POST method is used to send data to the server to create or update a resource. For example, when you submit a form to create a new user or upload a file, you're making a POST request. The data is sent in the **body** of the request, not in the URL.

**Pros and Cons of POST:**

  * **Pros:**
      * **Data Not Revealed:** The data is sent in the request body, so it is **not visible** in the URL. This makes it suitable for sending sensitive information like passwords.
      * **Unlimited Data:** There's no practical limit on the amount of data you can send, allowing you to upload large files or complex objects.
      * **Versatile:** POST can be used to send any type of data, including JSON, form data, and files.
  * **Cons:**
      * **Not Cachable:** POST requests are not cached by browsers, so submitting the same data will always result in a new request to the server.
      * **Not Bookmarkable:** Since the data isn't in the URL, you cannot bookmark or share a POST request.

**b) How to use the POST method:**

In Express.js, you handle POST requests with `app.post()`. To access the data sent in the request body, you need to use middleware to parse it. The built-in Express middleware `express.json()` and `express.urlencoded()` are commonly used for this.

**Code Example:**

```javascript
const express = require('express');
const app = express();

// Middleware to parse incoming JSON and URL-encoded data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post('/register', (req, res) => {
  const { username, password } = req.body;
  // Process the submitted data
  res.send(`User ${username} registered successfully!`);
});
```