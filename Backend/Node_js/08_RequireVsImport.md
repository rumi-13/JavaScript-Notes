
# `require()` (CommonJS)

`require()` is Node.js's original and synchronous module system, known as **CommonJS**. It's the default behavior for Node.js.

  * **Synchronous**: When you use `require()`, the program execution pauses until the module is fully loaded. This is fine for server-side applications because files are typically on the local disk.
  * **Dynamic**: You can call `require()` anywhere in your code, including conditionally inside an `if` statement or a function.
  * **How it works**: `require()` loads the entire module and returns the `module.exports` object.

Here's an example:

```javascript
// file_to_export.js
const greeting = "Hello, world!";
module.exports = greeting;

// main.js
const message = require('./file_to_export.js');
console.log(message); // Output: Hello, world!
```

-----

# `import` (ES Modules)

`import` is part of the JavaScript standard (ECMAScript Modules or **ESM**). It's the modern, asynchronous way to handle modules and is becoming the new standard. To use it in Node.js, you need to add `"type": "module"` to your `package.json` file.

  * **Asynchronous**: The `import` syntax is designed to be asynchronous. This is essential for modern web applications where modules are often loaded over a network and can't block the main thread.
  * **Static**: You can only use `import` at the top level of your module. You can't use it inside conditional blocks or functions. This allows for static analysis, which can lead to better performance and more advanced tooling.
  * **How it works**: You import specific, named exports from a module.

Here's an example:

```json
// package.json
{
  "name": "my-project",
  "version": "1.0.0",
  "type": "module" 
}
```

```javascript
// file_to_export.js
export const greeting = "Hello, world!";

// main.js
import { greeting } from './file_to_export.js';
console.log(greeting); // Output: Hello, world!
```

You can also use a default export:

```javascript
// file_to_export.js
const greeting = "Hello, world!";
export default greeting;

// main.js
import myGreeting from './file_to_export.js';
console.log(myGreeting); // Output: Hello, world!
```

-----

## Differences at a Glance

| Feature | `require()` (CommonJS) | `import` (ES Modules) |
| :--- | :--- | :--- |
| **Syntax** | `require()` function | `import...from` statement |
| **Loading** | Synchronous | Asynchronous |
| **Behavior** | Dynamic, can be used anywhere | Static, must be used at the top level |
| **What's returned** | The entire `module.exports` object | A specific value or the default export |
| **Node.js Config** | Default | Requires `"type": "module"` in `package.json` |
| **Origin** | Node.js native | JavaScript standard (ES6+) |