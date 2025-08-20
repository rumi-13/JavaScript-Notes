## 1\. What is Interpolation Syntax?

Interpolation syntax is a way to embed expressions or variables directly into a string or a template. It acts as a placeholder that gets replaced by the actual value when the code is processed. In the context of templating engines like EJS, interpolation is used to insert data from your server-side code (e.g., a variable, a database query result) into the HTML structure.

The primary use of interpolation is to create dynamic content. Instead of static HTML, you can display information that changes based on user input, database records, or other server-side logic. For example, if you have a user's name stored in a variable `username`, you can display a personalized greeting on a webpage using interpolation.

-----

## 2\. EJS Common Tags with Examples

EJS uses special tags to embed JavaScript code within an HTML file. Here are the most common ones:

#### a) `<%= ... %>` : Outputting a Variable (Interpolation)

This is the **interpolation tag**. The code inside this tag is executed, and its result is outputted directly into the HTML. It's used for displaying data.

**Example:**

```html
<p>Hello, <%= username %>!</p>
```

If the `username` variable is `'Alice'`, this EJS code will render as:

```html
<p>Hello, Alice!</p>
```

#### b) `<%- ... %>` : Unescaped Output

This tag is similar to the interpolation tag (`<%= ... %>`), but it does **not** escape HTML special characters. This means if your data contains HTML tags, they will be rendered as actual HTML instead of plain text. **Use this with caution** to avoid Cross-Site Scripting (XSS) vulnerabilities.

**Example:**

```html
<%- content %>
```

If the `content` variable is `'<strong>This is important.</strong>'`, this EJS code will render as:

```html
<p><strong>This is important.</strong></p>
```

#### c) `<% ... %>` : Running Logic (Control Flow)

This tag is used for **control flow logic**, such as `if` statements, `for` loops, or defining variables. The code inside this tag is executed, but nothing is outputted to the HTML unless you explicitly use an output tag (`<%= ... %>`).

**Example (Using an `if` statement):**

```html
<% if (isLoggedIn) { %>
  <p>Welcome back, user!</p>
<% } else { %>
  <p>Please log in to continue.</p>
<% } %>
```

**Example (Using a `for` loop):**

```html
<ul>
  <% for (let i = 0; i < items.length; i++) { %>
    <li><%= items[i] %></li>
  <% } %>
</ul>
```