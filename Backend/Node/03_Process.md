# What is `process`?

The `process` object in Node.js is a **global object** that provides information about, and control over, the current Node.js process. Because it's global, you can use it in any of your scripts without having to `require` it. It's essentially an interface between your Node.js application and the operating system it's running on.

The `process` object contains a variety of useful properties and methods, such as:

  * **`process.env`**: An object containing all the environment variables. This is great for setting configuration variables (like database passwords or API keys) that should not be hard-coded into your application.
  * **`process.version`**: A string containing the Node.js version number.
  * **`process.cwd()`**: A method that returns the current working directory of the process.
  * **`process.exit()`**: A method that terminates the Node.js process immediately.

-----

## `process.argv`

The `process.argv` property is an **array** that contains the command-line arguments passed when the Node.js process was launched. This is incredibly useful for building command-line tools or scripts that need to take input from the user at runtime.

The structure of the `process.argv` array is always the same:

1.  **`process.argv[0]`**: The first element is the path to the Node.js executable.
2.  **`process.argv[1]`**: The second element is the path to the JavaScript file being executed.
3.  **`process.argv[2]` and beyond**: The remaining elements are any additional command-line arguments you provide.

Let's see this in action with a simple example.

-----

### Simple Code Example

1.  Create a file named `args.js`.
2.  Add the following code to it:

<!-- end list -->

```javascript
// The process.argv array
const args = process.argv;

console.log("Full argv array:", args);
console.log("------------------------");
console.log("Node.js executable path:", args[0]);
console.log("Script path:", args[1]);
console.log("Arguments passed:", args.slice(2));

// To make it more practical, let's greet a user
const name = args[2];
if (name) {
  console.log(`Hello, ${name}!`);
} else {
  console.log("Please provide a name as an argument. E.g. `node args.js Gemini`");
}
```

3.  Run the script from your terminal with and without arguments:

    ```bash
    node args.js
    ```

    Output:

    ```
    Full argv array: [
      '/usr/local/bin/node',
      '/path/to/your/folder/args.js'
    ]
    ------------------------
    Node.js executable path: /usr/local/bin/node
    Script path: /path/to/your/folder/args.js
    Arguments passed: []
    Please provide a name as an argument. E.g. `node args.js Gemini`
    ```

    ```bash
    node args.js Gemini
    ```

    Output:

    ```
    Full argv array: [
      '/usr/local/bin/node',
      '/path/to/your/folder/args.js',
      'Gemini'
    ]
    ------------------------
    Node.js executable path: /usr/local/bin/node
    Script path: /path/to/your/folder/args.js
    Arguments passed: [ 'Gemini' ]
    Hello, Gemini!
    ```

-----
