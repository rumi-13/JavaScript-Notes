# Query Strings?

**Query strings** are a way to send small amounts of data from the client to the server as part of a URL. They're a series of key-value pairs appended to the end of a URL, starting with a question mark (`?`). The pairs are separated by ampersands (`&`).

They're typically used for non-sensitive data that is meant to filter, sort, or identify a specific resource. A common example is when you perform a search on a website: the search terms you enter become part of the query string.

-----

## How to Use Them in Express

In Express, the data from a query string is automatically parsed and made available on the **`req.query`** object. This object is a plain JavaScript object where the keys are the parameter names and the values are the data.

You don't need any special middleware to use query strings. You simply define a `GET` route and then access the `req.query` object inside your route handler.

Let's look at a practical example.

**The URL:**

Let's say a user visits a URL like this:
`http://localhost:3000/search?q=microsoft&user=tom`

**The `req.query` object:**

When Express receives this request, it automatically creates the `req.query` object for you, which will look like this:

```json
{
  "q": "microsoft",
  "user": "tom"
}
```

**Express Code Example:**

Here's how you would handle this request in your Express application:

```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/search', (req, res) => {
  // Access the query parameters from the req.query object
  const searchTerm = req.query.q;
  const user = req.query.user;

  // Check if parameters exist
  if (searchTerm) {
    res.send(`Searching for: ${searchTerm} by user: ${user}`);
  } else {
    res.send('No search term provided.');
  }
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
```

In this code, the `app.get('/search', ...)` route is designed to handle requests to the `/search` path. Inside the route handler, we use `req.query.q` to get the value for the `q` parameter and `req.query.user` to get the value for the `user` parameter. The server then uses these values to send a personalized response.