## 1\. How to Pass Data to EJS

To pass data from your Express route to an EJS template, you add a second argument to the **`res.render()`** method. This argument is an **object** where the keys are the names of the variables you want to use in your EJS file, and the values are the data you're passing.

**Example in your Express Route (`app.js`):**

```javascript
app.get('/', (req, res) => {
  const pageTitle = "My Website";
  const user = {
    firstName: "John",
    lastName: "Doe"
  };

  res.render('home', { title: pageTitle, user: user });
});
```

**Accessing the Data in EJS (`home.ejs`):**
You then use the EJS interpolation tag (`<%= %>`) to display this data. The keys from the object you passed (`title` and `user`) become accessible as variables in the template.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title><%= title %></title>
</head>
<body>
  <h1>Welcome to <%= title %></h1>
  <p>Hello, <%= user.firstName %> <%= user.lastName %>!</p>
</body>
</html>
```

-----

## 2\. Conditional Statements in EJS

You can use the EJS control flow tag (`<% %>`) to embed **`if/else`** statements. This allows you to show or hide parts of your HTML based on a condition, such as a user's logged-in status or a specific data value. The JavaScript code is placed inside the `<% %>` tags, and the HTML is placed outside.

**Example:**
Imagine you want to display a different message based on whether a user is logged in.

**Passing the Data (`app.js`):**

```javascript
app.get('/profile', (req, res) => {
  const isLoggedIn = true; // or false
  res.render('profile', { isLoggedIn: isLoggedIn });
});
```

**Using the `if/else` in EJS (`profile.ejs`):**

```html
<div>
  <% if (isLoggedIn) { %>
    <p>You are currently logged in. View your profile.</p>
  <% } else { %>
    <p>Please log in to view this page.</p>
  <% } %>
</div>
```

-----

## 3\. Loops in EJS

EJS allows you to use **`for`**, **`forEach`**, or **`while`** loops to iterate over arrays and generate dynamic HTML. This is extremely useful for displaying lists of items, such as blog posts, products, or comments. The loop logic is placed within `<% %>` tags, and the HTML you want to repeat is placed inside the loop.

**Example:**
Let's say you have an array of items you want to display in a list.

**Passing the Data (`app.js`):**

```javascript
app.get('/products', (req, res) => {
  const products = ['Laptop', 'Mouse', 'Keyboard', 'Monitor'];
  res.render('products', { productList: products });
});
```

**Using a `for` loop in EJS (`products.ejs`):**

```html
<h2>Our Products</h2>
<ul>
  <% for (let i = 0; i < productList.length; i++) { %>
    <li><%= productList[i] %></li>
  <% } %>
</ul>
```

This will render a clean, dynamic list for all products in your array:

```html
<h2>Our Products</h2>
<ul>
  <li>Laptop</li>
  <li>Mouse</li>
  <li>Keyboard</li>
  <li>Monitor</li>
</ul>
```