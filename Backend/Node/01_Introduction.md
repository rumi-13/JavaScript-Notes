
# What is Node.js?

Node.js is a **cross-platform, open-source runtime environment** that allows you to execute JavaScript code outside of a web browser. Traditionally, JavaScript was used only for front-end development (e.g., making websites interactive in a browser). Node.js changed that by enabling developers to use JavaScript for **server-side development** and other applications.

Think of it this way: a web browser has a built-in engine (like Chrome's V8 engine) that understands and runs JavaScript. Node.js is essentially that same V8 engine, but packaged in a way that lets you run JavaScript on your computer's operating system directly, without needing a browser.

## **Key features** that make Node.js popular include:

  * **Asynchronous and Event-Driven:** Node.js handles tasks in a non-blocking way. This means it doesn't wait for one task to finish before starting another. Instead, it uses an "event loop" to manage multiple operations simultaneously, making it highly efficient for I/O-intensive tasks like handling requests from many users at once.
  * **Single-Threaded:** While it handles many connections, Node.js operates on a single thread. It uses its asynchronous nature to manage concurrency, avoiding the overhead of creating new threads for each request.
  * **Fast V8 Engine:** It uses Google's V8 JavaScript engine, which is known for its speed and performance.
  * **NPM (Node Package Manager):** Node.js comes with NPM, a vast ecosystem of open-source packages and libraries that you can easily install and use in your projects. This saves you from having to write everything from scratch.

-----

### Simple Code Example

To see Node.js in action, let's create a small file that prints a message to the console.

1.  Create a file named `hello.js`.
2.  Add the following code to it:

<!-- end list -->

```javascript
console.log("Hello, Node.js!");
```

3.  Save the file.
4.  Open your terminal or command prompt.
5.  Navigate to the directory where you saved `hello.js`.
6.  Run the following command:

<!-- end list -->

```bash
node hello.js
```

You should see the output: `Hello, Node.js!` This simple command tells your computer to use the Node.js runtime to execute the JavaScript code in your file.

-----

