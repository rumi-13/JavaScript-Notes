## Creating and Using EJS Sub-Templates

Sub-templates, also known as partials, are smaller, reusable EJS files that contain snippets of HTML. They are an essential tool for maintaining clean, organized, and modular code by preventing you from repeating the same HTML on multiple pages. Think of them as building blocks for your webpages, such as a header, footer, or navigation bar.

## How to Include Sub-Templates

EJS uses the `<%- include('filename') %>` tag to embed a sub-template within a main template. The path to the file is relative to the `views` directory that you have configured in your Express application.

**1. Create a Folder for Partials**
It is a best practice to create a separate folder inside your `views` directory to hold all your sub-templates. A common name for this folder is `partials`, `components`, or `includes`. For this example, we'll use `partials`.

```
- project-folder/
  - views/
    - partials/
      - header.ejs
      - footer.ejs
    - home.ejs
  - app.js
```

**2. Create the Sub-Templates**
Now, you can create your partial EJS files. These files contain just the HTML for that specific component.

**`views/partials/header.ejs`:**

```html
<header>
  <h1>My Website</h1>
  <nav>
    <a href="/">Home</a>
    <a href="/about">About</a>
  </nav>
</header>
```

**`views/partials/footer.ejs`:**

```html
<footer>
  <p>&copy; 2025 My Awesome Website</p>
</footer>
```

**3. Include them in a Main Template**
Finally, you use the `<%- include(...) %>` tag to include these partials in your main EJS file.

**`views/home.ejs`:**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Page</title>
</head>
<body>
  <%- include('partials/header') %>
  
  <main>
    <h2>Welcome!</h2>
    <p>This is the main content of our website.</p>
  </main>

  <%- include('partials/footer') %>
</body>
</html>
```

**4. Passing Data to Sub-Templates**
You can also pass data to a sub-template by adding a second argument to the `include` function. This argument is an object containing the data you want the sub-template to access.

**Example in your Express Route (`app.js`):**

```javascript
app.get('/', (req, res) => {
  const pageTitle = "My Website";
  res.render('home', { title: pageTitle });
});
```

**Example in the Main Template (`home.ejs`):**

```html
<%- include('partials/header', { pageTitle: title }) %>
```

**Accessing Data in the Sub-Template (`partials/header.ejs`):**

```html
<header>
  <h1><%= pageTitle %></h1>
  <nav>
    <a href="/">Home</a>
    <a href="/about">About</a>
  </nav>
</header>
```

By using sub-templates and the `include` function, you can build a consistent and easily maintainable website.