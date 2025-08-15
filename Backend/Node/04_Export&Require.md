# Export & Require

In Node.js, every file is treated as a separate **module**. To share code between these modules, you need to **export** code from one file and **require** it in another. This system is part of Node.js's CommonJS module system.

## How to Export and Require

The core of this system is the `module.exports` object. Anything you want to make public from a file must be attached to this object. The `require()` function is used to import the public code from another module.

-----

### Exporting a Single Variable

To export a single value (e.g., a function, string, or number), you assign it directly to `module.exports`.

**`greetings.js`**

```javascript
const message = "Hello from the greetings module!";

module.exports = message;
```

In this example, the `message` string is the sole export of `greetings.js`.

**`app.js`**

```javascript
// The require() function returns whatever was assigned to module.exports
const greeting = require('./greetings.js');

console.log(greeting); // Output: Hello from the greetings module!
```

Here, `require('./greetings.js')` returns the string "Hello from the greetings module\!", which is then stored in the `greeting` variable.

-----

### Exporting Multiple Variables

To export multiple values, you assign an object to `module.exports` with each value as a property. This is the most common approach.

**`math.js`**

```javascript
const add = (a, b) => a + b;
const subtract = (a, b) => a - b;

// Export an object with two functions
module.exports = {
  add: add,
  subtract: subtract
};
```

You can also use a shorthand if the variable and property names are the same: `module.exports = { add, subtract };`.

**`app.js`**

```javascript
// The require() function returns the entire object
const calculator = require('./math.js');

console.log(calculator.add(5, 3));      // Output: 8
console.log(calculator.subtract(10, 4)); // Output: 6
```

The `calculator` variable now holds the object with the `add` and `subtract` functions, allowing you to access them using dot notation.