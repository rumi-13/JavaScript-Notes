## 1\. Serving Static Files in EJS

Serving **static files** is a fundamental task in web development. Static files are assets that don't change and are delivered to the browser exactly as they are. This includes files like:

  * **CSS files** for styling the page.
  * **JavaScript files** for client-side functionality.
  * **Images** (PNG, JPEG, GIF) for visual content.
  * **Fonts**.

In an Express.js application, you need to set up a way to make these files accessible to the browser. This is done using **middleware**.

A **middleware** is a function that has access to the request object, the response object, and the next middleware function in the application’s request-response cycle. It can execute code, make changes to the request and response objects, end the request-response cycle, or call the next middleware. The `express.static()` function is a built-in middleware that serves static files.

-----

## 2\. How to Serve Static Files

You use the `app.use()` method to mount the `express.static()` middleware. This tells your Express application to make a specific directory accessible to the public.

#### Basic Setup with a 'public' Folder

The most common practice is to create a folder named `public` at the root of your project and place all your static files inside it. You then use `app.use()` to make this folder available.

```javascript
const express = require('express');
const app = express();

// Serve static files from the 'public' directory
app.use(express.static('public'));

// Your other routes and logic
app.get('/', (req, res) => {
  res.render('home');
});
```

With this setup, if you have an image file at `public/images/logo.png`, a user can access it in their browser by navigating to `http://yourdomain.com/images/logo.png`.

## `express.static('public')` vs. `path.join(__dirname, 'public')`

While `express.static('public')` works on many systems, it can sometimes cause issues. The string `'public'` is a relative path, and its exact location depends on where your Node.js process is started from. This can lead to errors if the application is run from a different directory.

Using `path.join(__dirname, 'public')` is a **more robust and recommended practice**.

  * **`__dirname`**: A global variable in Node.js that holds the **absolute path** of the directory containing the currently executing file.
  * **`path.join()`**: A utility function from Node.js's built-in `path` module. It joins all given path segments together and normalizes the resulting path. It correctly handles the differences in path separators (`/` vs. `\`) across different operating systems.

By using `path.join()`, you create a guaranteed absolute path to your `public` folder, ensuring your application works regardless of where the `node` command is executed.

**Example of the recommended approach:**

```javascript
const express = require('express');
const path = require('path');
const app = express();

// Use the absolute path for robustness
app.use(express.static(path.join(__dirname, 'public')));

// Your routes
app.get('/', (req, res) => {
  res.render('home');
});
```