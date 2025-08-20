# EJS : Introduction

## 1\. What are Templates?

Templates are files used in web development that allow you to separate the content (like text and data) from the presentation (the HTML structure). Instead of writing a full HTML file for every single webpage, you can create a template with placeholders for dynamic data. The template engine then fills these placeholders with actual data when a user requests the page, generating a complete HTML file on the fly. This makes it easier to manage a website, especially if you have many pages that share the same layout, like a header, footer, or navigation bar. It promotes the **Don't Repeat Yourself (DRY)** principle.

-----

## 2\. What is EJS and its use?

**EJS** stands for **Embedded JavaScript**. It is a simple and popular templating engine for Node.js. Its main purpose is to let you embed plain JavaScript code directly within your HTML markup.

The primary use of EJS is to create dynamic web pages. This means you can display data that changes, such as user profiles, product lists from a database, or blog posts, without having to hard-code each page. The server processes the EJS file, executes the embedded JavaScript to fetch and insert the data, and then sends the final, complete HTML to the user's browser.

-----

## 3\. How to use EJS

To use EJS in a Node.js Express application, you need to set it up correctly.

  * **Setting the View Engine:**
    You must tell your Express application to use EJS as the templating engine. You do this with the `app.set()` method:

    ```javascript
    app.set('view engine', 'ejs');
    ```

  * **`res.render()` vs. `res.send()`:**
    You'll use the `res.render()` method, not `res.send()`, to display a template.

      * **`res.send()`** sends a simple string or object directly as the response. It's used for basic text or JSON data.
      * **`res.render()`** takes the name of a template file (without the `.ejs` extension) as an argument. It tells Express to find and process that EJS file, render it into HTML, and then send that HTML as the response.

  * **Creating the Views Folder:**
    By default, Express looks for your template files in a directory named **`views`** at the root of your project. You should create this folder and place all your `.ejs` files inside it. For example, if you have a file named `home.ejs`, your folder structure would look like this:

    ```
    - project-folder/
      - views/
        - home.ejs
      - app.js
    ```

    `res.render('home')` will then automatically find and render `home.ejs`.

  * **Used for Big Files:**
    Templating engines are especially useful for large, complex websites. They allow you to break down your user interface into reusable components. For instance, you could have a `header.ejs` and a `footer.ejs` that are included on every page, making updates quick and consistent across your entire site.

-----

## 4\. EJS Directory

You can specify the directory where your EJS files are located using `app.set()` if you want to use a name other than the default `views`. You can also use `path.join()` to create a robust file path that works on any operating system. This is a best practice to ensure your application is portable.

```javascript
const path = require('path');
// ...
app.set('views', path.join(__dirname, 'templates'));
app.set('view engine', 'ejs');
```

In this example, Express would now look for your EJS files in a folder named **`templates`**. `__dirname` is a global variable in Node.js that holds the absolute path to the directory containing the currently executing file. `path.join()` combines the directory name and the folder name correctly, regardless of whether the operating system uses forward slashes (`/`) or backslashes (`\`).