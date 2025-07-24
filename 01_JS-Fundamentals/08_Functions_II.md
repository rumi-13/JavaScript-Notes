# Core Functional Concepts in JavaScript ✨

## 1\. First-Class Functions 🥇

In JavaScript, functions are **"first-class citizens."** This means they're treated like any other value, such as numbers, strings, or objects. You can:

  * **Assign them to variables:** Store a function in a variable.
  * **Pass them as arguments:** Send a function into another function.
  * **Return them from other functions:** A function can generate and return a new function.

This fundamental characteristic is what enables powerful patterns like Higher-Order Functions and Closures.

### Code Example: First-Class Functions

```javascript
// Assign to a variable
const sayHello = function() {
  console.log("Hello!");
};
sayHello(); // Call it like a regular function

// Pass as an argument
function executeCallback(callback) {
  callback();
}
executeCallback(sayHello); // Pass 'sayHello' function

// Return from another function
function createMultiplier(factor) {
  return function(number) { // Returns an anonymous function
    return number * factor;
  };
}
const double = createMultiplier(2);
console.log(double(5)); // Output: 10
```

-----

## 2\. Higher-Order Functions (HOFs) 🚀

A **Higher-Order Function (HOF)** is a function that either:

1.  **Takes one or more functions as arguments.**
2.  **Returns a function as its result.**

HOFs are incredibly powerful for abstraction and code reusability. Common examples in JavaScript are `map`, `filter`, and `reduce` (array methods that take a callback function).

### Code Example: Higher-Order Functions

```javascript
// HOF: Takes a function as an argument
function operateOnNumbers(a, b, operation) {
  return operation(a, b);
}

const add = (x, y) => x + y;
const multiply = (x, y) => x * y;

console.log(operateOnNumbers(5, 3, add));     // Output: 8
console.log(operateOnNumbers(5, 3, multiply)); // Output: 15

// HOF: Returns a function (like createMultiplier above)
const powerOf = (exponent) => {
  return (base) => Math.pow(base, exponent);
};
const square = powerOf(2);
console.log(square(4)); // Output: 16
```

### Edge Cases / Considerations for HOFs:

  * **Context (`this`):** Be careful with `this` inside callback functions, especially with traditional function expressions. Arrow functions often simplify this by lexically binding `this`.
  * **Performance:** While abstracting, deeply nested or excessively complex HOFs might sometimes have minor performance implications, but readability and maintainability usually outweigh this for most applications.

-----

## 3\. Pure and Impure Functions 🧪

### Pure Functions: Predictable & Reliable 😇

A function is **pure** if it meets two conditions:

1.  **Deterministic:** Given the same inputs, it **always** returns the same output.
2.  **No Side Effects:** It does not cause any observable changes outside its own scope (e.g., modifying global variables, changing arguments, printing to console, making network requests, or altering the DOM).

Pure functions are easy to test, debug, and reason about, making your code more robust.

### Impure Functions: With Side Effects 😈

A function is **impure** if it does not meet the conditions of a pure function. It might:

1.  Return different outputs for the same inputs (e.g., depends on global state or random numbers).
2.  Cause side effects (e.g., modifies outside variables, performs I/O, changes an object passed as an argument).

Most real-world applications *need* impure functions to interact with the outside world, but it's good practice to minimize and isolate them.

### Code Example: Pure vs. Impure

```javascript
// Pure Function
function addPure(a, b) {
  return a + b;
}
console.log(addPure(2, 3)); // Output: 5
console.log(addPure(2, 3)); // Output: 5 (always the same for 2,3)

let globalCount = 0;

// Impure Function (modifies global state)
function incrementImpure() {
  globalCount++; // Side effect: modifies global variable
  return globalCount;
}
console.log(incrementImpure()); // Output: 1
console.log(incrementImpure()); // Output: 2 (different output for same 'input' - no input)

// Impure Function (modifies argument object - side effect)
function addToArrayImpure(arr, item) {
  arr.push(item); // Side effect: modifies the original array
  return arr;
}
const myArray = [1, 2];
console.log(addToArrayImpure(myArray, 3)); // Output: [1, 2, 3]
console.log(myArray);                      // Output: [1, 2, 3] (original array changed!)

// Pure way to "add to array" (creates a new array)
function addToArrayPure(arr, item) {
  return [...arr, item]; // Returns a new array, original is untouched
}
const anotherArray = [10, 20];
const newArray = addToArrayPure(anotherArray, 30);
console.log(newArray);    // Output: [10, 20, 30]
console.log(anotherArray); // Output: [10, 20] (original array is unchanged!)
```

### Edge Cases / Considerations:

  * **Date & Randomness:** Functions involving `Date.now()` or `Math.random()` are inherently impure as their output changes over time or with each call.
  * **API Calls:** Network requests (fetching data) are side effects, making those functions impure.
  * **Console Logging:** `console.log` itself is a side effect. A function that *only* logs but doesn't return anything or change state is still impure due to the I/O.

-----

## 4\. Closure 🔒

A **closure** is when a function **"remembers"** (or encloses) its lexical environment, even when that function is executed outside its original scope. This means a function can access variables from its parent scope even after the parent function has finished executing.

Think of it like a backpack. When a function is created, it gets a "backpack" containing all the variables from its surrounding scope. Even if you take that function out of its original creation place and run it elsewhere, it still carries that backpack of variables with it.

### Code Example: Closure

```javascript
function createCounter() {
  let count = 0; // 'count' is in the lexical environment of 'increment'

  return function increment() { // This is the closure
    count++; // 'increment' accesses 'count' from its outer scope
    return count;
  };
}

const counter1 = createCounter(); // counter1 now holds the 'increment' closure
console.log(counter1()); // Output: 1
console.log(counter1()); // Output: 2

const counter2 = createCounter(); // A new, independent closure
console.log(counter2()); // Output: 1 (starts fresh)
console.log(counter1()); // Output: 3 (counter1's 'count' continues)
```

### Edge Cases / Considerations for Closures:

  * **Memory Leaks (Historically):** In older browsers, mismanaged closures could lead to memory leaks, but modern garbage collectors are much better at handling this. Still, be mindful of holding onto large objects via closures if not truly needed.
  * **Variable Scope Confusion:** Ensure you understand *which* variable is being closed over. A common pitfall in loops with `var` was that `var` is function-scoped, leading to all closures referencing the *same* variable instance by the end of the loop. `let` and `const` (block-scoped) fixed this.

-----

## 5\. Lexical Scoping 🌲

**Lexical scoping** (or static scoping) means that the scope of a variable is determined by its **position in the source code** (where it is written), not by where it is called at runtime. When a function is defined, it inherits the scope of its parent, which is its *lexical environment*.

This is the rule by which JavaScript decides which variables a function can access. If a variable isn't found in the current scope, JavaScript looks up the chain of parent scopes until it finds the variable or reaches the global scope.

### Code Example: Lexical Scoping

```javascript
const globalVar = "I'm global!"; // Global scope

function outerFunction() {
  const outerVar = "I'm from outer!"; // outerFunction's scope

  function innerFunction() {
    const innerVar = "I'm from inner!"; // innerFunction's scope
    console.log(innerVar);    // Accessible: innerFunction's own scope
    console.log(outerVar);    // Accessible: from outerFunction's lexical scope
    console.log(globalVar);   // Accessible: from global lexical scope
    // console.log(anotherVar); // ReferenceError: not in any parent scope
  }

  innerFunction();
}

outerFunction();
// console.log(outerVar); // ReferenceError: outerVar is not defined (not in global scope)
```

### Edge Cases / Considerations for Lexical Scoping:

  * **`eval()` and `with` (Avoid\!):** These historical features can sometimes alter lexical scope at runtime, making code harder to optimize and reason about. They are generally discouraged in modern JavaScript.
  * **`this` vs. Lexical Scope:** `this` binding works differently from lexical scoping. `this` depends on *how* a function is called, while lexical scope depends on *where* a function is defined. This is a common source of confusion, particularly before arrow functions.

-----
