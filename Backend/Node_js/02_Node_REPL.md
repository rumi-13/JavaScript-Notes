# Node REPL

The **Node REPL (Read-Eval-Print-Loop)** is an interactive environment that comes bundled with Node.js. It's a command-line tool that allows you to execute JavaScript code directly and see the results immediately. It's a fantastic tool for experimenting with code, testing out small snippets, and quickly trying out new ideas without having to create and save a file.

The name REPL breaks down the four key actions it performs:

  * **Read:** It reads the JavaScript code you type in.
  * **Eval:** It evaluates (executes) the code.
  * **Print:** It prints the result of the evaluation to the console.
  * **Loop:** It loops back to the start, allowing you to enter another line of code.

You can think of the REPL as your personal JavaScript scratchpad. It's a great place to test out syntax, practice new methods, and even use Node.js's built-in modules.

-----

### Simple Code Examples

To start the Node REPL, simply open your terminal or command prompt and type:

```bash
node
```

You'll see a prompt that looks like `>`. Now you can start typing JavaScript\!

1.  **Basic Arithmetic:** You can use it as a simple calculator.

    ```javascript
    > 2 + 2
    4
    > 10 * 5
    50
    ```

2.  **Variables:** You can declare variables and use them in subsequent lines.

    ```javascript
    > let message = "Hello from the REPL!"
    undefined
    > message
    'Hello from the REPL!'
    ```

    Note that `undefined` is printed when a statement doesn't have a return value.

3.  **Functions:** You can even define and call functions.

    ```javascript
    > function greet(name) {
    ...   return `Hello, ${name}!`;
    ... }
    undefined
    > greet('Gemini')
    'Hello, Gemini!'
    ```

    Notice the `...` after the first line. The REPL understands you're writing a multi-line statement and provides this to help you. Press `Enter` twice to execute the multi-line code.

To exit the Node REPL, you can press `Ctrl + C` twice, or type `.exit` and press `Enter`.

-----


# Node REPL Commands

The Node REPL has several built-in commands that begin with a dot (`.`). These commands allow you to control the REPL environment itself, rather than executing JavaScript code. Here are some of the most useful ones:

  * `.help`: Displays a list of all available special commands. This is your go-to command if you ever get stuck or forget a command.
  * `.editor`: Puts the REPL into a special "editor mode" where you can write multi-line JavaScript code more easily. This is useful for writing functions or complex loops. Once in editor mode, you can type your code and then press `Ctrl+D` to run it.
  * `.load <filename>`: Loads a JavaScript file from your system and runs its code directly within the REPL. This is handy for testing parts of a script without having to re-type them.
  * `.save <filename>`: Saves all the code you've typed in the current REPL session to a specified file.
  * `.break` or `Ctrl+C`: Exits the current multi-line expression. Pressing `Ctrl+C` a second time will exit the entire REPL.
  * `.clear`: Resets the REPL context, clearing any variables or functions you've declared.
  * `.exit`: Exits the Node REPL entirely.

-----

## Help

The `.help` command is your best friend in the REPL. When you type `.help` and press `Enter`, the REPL will output a list of all the special commands, along with a brief description of what each one does. It's a quick and easy way to get a reminder of the available tools without having to leave the environment.

-----

### Console Command Run

When you're working in the Node REPL, every line of code you type is **read, evaluated, and printed** to the console. The REPL automatically handles the `console.log()` command for you in a way. If a statement has a return value, the REPL will print it directly. For example, typing `2 + 2` returns `4`, and the REPL prints `4`. However, if you want to explicitly print a message, or see the output of an asynchronous operation, you still need to use the `console.log()` command.

```javascript
> let myName = "Gemini";
undefined
> myName
'Gemini'
> console.log(myName);
Gemini
undefined
```

In the example above, simply typing `myName` prints the variable's value. But when you use `console.log(myName)`, it first prints the string "Gemini" to the console, and then the REPL prints `undefined` because `console.log()` itself doesn't have a return value.

-----

### Global Object

In a web browser, the **global object** is `window`. In Node.js, the global object is, simply, `global`. The `global` object contains variables and functions that are available everywhere in your application, without needing to be imported.

In the REPL, you can access properties and methods of the `global` object directly. The `console` object is a property of `global`, which is why you can call `console.log()` anywhere without needing to declare it.

You can verify this in the REPL:

```javascript
> global.console === console
true
```

This confirms that the `console` object you've been using is indeed a property of the `global` object.

-----
