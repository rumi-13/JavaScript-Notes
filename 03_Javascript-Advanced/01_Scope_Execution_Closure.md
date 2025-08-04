# Scope, Execution Context & Closure

# 1) Scope in JavaScript

**Scope** determines the accessibility or visibility of variables and functions in different parts of your code during runtime. Think of it as a set of rules for storing and retrieving variables. If a variable isn't in the current scope, the JavaScript engine looks up the scope chain until it's found or until it reaches the global scope.

## Types of Variable Scope

*   **Global Scope**: Variables declared outside of any function or block have Global Scope. They can be accessed from anywhere in the code.
    *   **Use-case**: Useful for constants or functions that need to be accessed application-wide.
    *   **Edge case**: Over-reliance on global variables can lead to naming conflicts and make code harder to manage. This is often called "polluting the global namespace."

    ```javascript
    // This variable is in the global scope
    var globalVar = "I am global";

    function checkScope() {
      console.log(globalVar); // Accessible here
    }

    checkScope(); // "I am global"
    console.log(globalVar); // "I am global"
    ```

*   **Function Scope (or Functional Scope)**: Variables declared with `var` inside a function are accessible only within that function. They cannot be accessed from outside.
    *   **Syntax**: `var`

    ```javascript
    function myFunction() {
      var functionVar = "I am inside the function";
      console.log(functionVar); // Accessible
    }

    myFunction(); // "I am inside the function"
    // console.log(functionVar); // Uncaught ReferenceError: functionVar is not defined
    ```

*   **Block Scope**: Variables declared with `let` and `const` inside a block (code enclosed in curly braces `{}`) are only accessible within that block. This is more restrictive and predictable than function scope.
    *   **Syntax**: `let`, `const`

    ```javascript
    if (true) {
      let blockVar = "I am a block-scoped variable";
      const blockConst = "I am a block-scoped constant";
      console.log(blockVar);   // Accessible
      console.log(blockConst); // Accessible
    }

    // console.log(blockVar); // Uncaught ReferenceError: blockVar is not defined
    ```

# 2) Execution Context

The **Execution Context** is the environment where JavaScript code is evaluated and executed. Whenever code is run, an execution context is created. There is a **Global Execution Context** created by default, and a new **Function Execution Context** is created for every function call.

Each execution context has two phases:

1.  **Memory Creation Phase (Creation Phase)**:
    *   The JavaScript engine scans the code and allocates memory to all variables and functions.
    *   Variables declared with `var` are initialized with `undefined`.
    *   `let` and `const` declarations are stored but remain uninitialized. Accessing them before their declaration results in a `ReferenceError` (this is called the **Temporal Dead Zone**).
    *   Function declarations are stored in their entirety.
    *   This process is also known as **Hoisting**.

2.  **Code Execution Phase (Execution Phase)**:
    *   The engine executes the code line by line.
    *   It assigns the actual values to variables and executes function calls.

```javascript
// Example Walkthrough:
console.log(myVar); // -> undefined (due to hoisting in memory creation phase)
var myVar = 10;
console.log(myVar); // -> 10 (value assigned during execution phase)

myFunction(); // -> "Hello from myFunction!" (function stored in memory)

function myFunction() {
  console.log("Hello from myFunction!");
}
```

# 3) Lexical Scope vs. Dynamic Scope

##  **Lexical Scope (Static Scope)**
JavaScript uses Lexical Scope. This means a function's scope is determined by where it is defined in the source code, not where it is called. The engine knows which variables a function can access just by looking at the code's structure.

    ```javascript
    let name = 'Global';

    function outer() {
      let name = 'Outer';
      function inner() {
        // 'inner' is lexically inside 'outer', so it accesses 'Outer's `name`
        console.log(name);
      }
      return inner;
    }

    const innerFunc = outer();
    innerFunc(); // -> "Outer"
    ```

## Dynamic Scope
 In contrast, dynamic scope would determine variable access based on where the function is *called*. The function would look for variables in the scope that called it. JavaScript **does not** use dynamic scope.

# 4) Closures

A **closure** is a function that remembers its **lexical environment** (the variables and scope from where it was created), even when the function is executed outside of that original scope.

In simple terms: **A function bundled with its scope chain is a closure.**

This happens because the inner function maintains a reference to its parent's scope, preventing the parent's variables from being garbage-collected.

```javascript
function createGreeting(greeting) {
  // 'greeting' is part of the lexical environment of 'sayHello'
  return function(name) {
    // This inner function is a closure. It "remembers" the 'greeting' variable.
    console.log(greeting + ', ' + name);
  };
}

const sayHello = createGreeting('Hello');
const sayHi = createGreeting('Hi');

sayHello('Alice'); // -> "Hello, Alice"
sayHi('Bob');    // -> "Hi, Bob"
```

### Important:
In JavaScript, when a function finishes execution, its local variables usually go out of scope and are removed.
However, if the function is a closure, it retains access to its outer lexical environment.
JavaScript internally creates a reference (backlink) to this environment via the [[Environment]] property.
This allows the closure to access variables from its parent scope even after the parent function has returned.

## Use Cases for Closures

*   **Private Counters & Data Encapsulation**: Closures can create private variables that cannot be accessed or modified from the outside world, which is a fundamental principle of encapsulation.

    ```javascript
    function createCounter() {
      let count = 0; // 'count' is a private variable

      return {
        increment: function() {
          count++;
          console.log(count);
        },
        decrement: function() {
          count--;
          console.log(count);
        },
        getCount: function() {
          return count;
        }
      };
    }

    const counter = createCounter();
    counter.increment(); // 1
    counter.increment(); // 2
    // console.log(counter.count); // undefined - cannot access 'count' directly
    console.log(counter.getCount()); // 2
    ```

# 5) Common Confusions

## Closure vs. Returning a function

Not every function that returns another function creates a closure. A closure is only formed if the returned function **accesses variables from its parent's scope**.

*   **Just a returned function (no closure)**:
    ```javascript
    function createAction() {
        // This inner function doesn't use any variables from createAction's scope.
        return function() {
            console.log("Action performed");
        };
    }
    ```
*   **A true closure**:
    ```javascript
    function createMessage(message) {
        // This inner function CLOSES OVER the 'message' variable.
        return function() {
            console.log(message);
        };
    }
    ```

## Scope Chain vs. Call Stack

These are two different but related concepts.

*   **Call Stack**: Manages execution contexts. It's a stack (Last-In, First-Out) that keeps track of which function is currently being executed. When a function is called, its execution context is pushed onto the stack. When it returns, it's popped off.
    *   **Purpose**: Manages the order of execution.

*   **Scope Chain**: A mechanism for variable lookup. For any given function, its scope chain is the list of scopes it has access to. It starts with its own scope, then its parent's scope, and continues up to the global scope.
    *   **Purpose**: Manages variable accessibility based on lexical scope.

# 6) Mindset

> **Closures are how JavaScript gives memory to your logic.**

This is a great way to think about it. A normal function "forgets" everything once it finishes running. A closure, however, gives a function a persistent "memory" of its surroundings (its lexical environment). This allows you to create stateful functions and encapsulated modules that hold onto their data between calls, making your logic more powerful and organized.