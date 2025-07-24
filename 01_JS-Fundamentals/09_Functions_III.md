# IIFE (Immediately Invoked Function Expression)

### What is an IIFE?
- An IIFE is a function in JavaScript that runs as soon as it is defined.
- Syntax: *A function wrapped in parentheses, followed by another set of parentheses to invoke it immediately.*

### Why use IIFEs?
- Create a **private scope** to avoid polluting the global namespace.
- Useful for initialization code or one-time logic.

### Syntax

```javascript
(function () {
  // code here
})();
```

Or using arrow function:

```javascript
(() => {
  // code here
})();
```

### Example

```javascript
(function greet() {
  console.log('Hello from IIFE!');
})();
// Output: Hello from IIFE!
```

### Key Points & Edge Cases

- Name is *optional*; IIFEs are often anonymous.
- Variables inside are not accessible from outside.
- You can pass arguments to an IIFE:

```javascript
(function (name) {
  console.log('Hi, ' + name);
})('Alice');
```

# Hoisting in JavaScript

### What is Hoisting?
- *Hoisting* is JavaScript's behavior of moving **declarations** to the top of their scope (global or function) before code executes.
- Only **declarations** are hoisted—not initializations.

### Hoisting: Variables

- `var` declarations are hoisted and initialized as `undefined`.
- `let` and `const` are hoisted but **not initialized** (temporal dead zone).

```javascript
console.log(a); // undefined
var a = 5;
```

```javascript
console.log(b); // ReferenceError
let b = 10;
```

### Hoisting: Functions

#### Function Declarations
- Entire **function declaration** is hoisted.
- You can call it *before* its definition.

```javascript
sayHello(); // "Hello!"
function sayHello() {
  console.log("Hello!");
}
```

#### Function Expressions
- Only the **variable declaration** is hoisted, *not the function definition*.
- Using them before assignment gives `undefined` or error (if using `let`/`const`).

```javascript
sayHi(); // TypeError: sayHi is not a function
var sayHi = function() {
  console.log("Hi!");
};
```

| Type                   | Is Hoisted?    | Can Call Before Definition?   |
|------------------------|----------------|-------------------------------|
| Function Declaration   | Yes            | Yes                           |
| Function Expression    | Only variable  | No                            |
| Arrow Function (var)   | Only variable  | No                            |
| Arrow Function (let/const)| Variable only (uninitialized) | No         |

### How Hoisting Occurs

- JavaScript's interpreter **allocates memory for variables and functions** during the compile phase, before executing code.
- This makes declarations "available" earlier, but **initialization remains in place**.
- Function declarations are fully hoisted; expressions are not.

## Code Examples Recap

### Function Declaration Hoisting

```javascript
foo(); // Works!
function foo() { console.log('Hoisted!'); }
```

### Function Expression Hoisting

```javascript
bar(); // Error: bar is not a function
var bar = function() { console.log('Not hoisted'); }
```

## Main Points

- **IIFE**: Immediately runs, creates a private scope.
- **Hoisting**: Moves declarations (not initializations) to top of scope.
- **Functions**: Declarations are hoisted (usable before definition); expressions are not.
- **let/const**: Hoisted but in a "temporal dead zone"—using them before declaration leads to error.

---