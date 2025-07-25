# Takeaways Functions

### 1. How does JavaScript’s garbage collector handle variables captured by a closure?

When a closure is created, JavaScript’s garbage collector keeps the variables referenced by the closure alive in memory, even after the outer function finishes. These variables won’t be removed (garbage collected) until there are no closures or references pointing to them anymore.

- In short: **Captured variables live as long as they’re referenced by a closure.**

### 2. If you call a higher-order function with different values, will the inner function “remember” the value passed? Why?

- The inner function “remembers” (closes over) the parameter value from each call, due to lexical scoping. Each returned function keeps its own snapshot of the surrounding variables at creation time.

### 3. Why is mutating an object or array parameter inside a function considered an impurity?

- Mutating an argument changes the object outside the function (side effect), which means future calls with the same argument can give different results—violating purity.



### 4. How does a closure maintain dynamic state across multiple calls?

A closure occurs when a function “remembers” the variables from its outer (enclosing) scope even after that outer function has returned.
In the case of an accumulator, the returned function retains access to a private variable (like `sum`) and updates it every time it's called.
This allows each function instance to keep its own evolving internal state without affecting others.
It’s like giving each returned function its own personal memory space.


### 5. How can a delayed callback (like setTimeout) still access variables that seem out of scope?

 JavaScript uses lexical scoping, which means that a function’s scope is determined by where it is written, not when it is run.
When an asynchronous callback is created inside a function, it forms a closure over the variables in that function’s scope.
Even though the outer function has completed execution before the callback runs, the callback still holds a reference to the variables it closed over.

This is why the callback can access and use those variables later, as if they were still around.


###Absolutely — here’s a concise **takeaway** for this important concept:

---

### 6. Hoisting & Variable Shadowing with `var`

1. In JavaScript, **`var` declarations are hoisted** to the top of their function scope — but their **assignments are not**.
2. If a local `var` is declared inside a function, it **shadows** any global variable of the same name — even before it's assigned a value.
3. This means a `console.log()` referencing that variable **will log `undefined`**, not the global value, because the local variable exists but hasn’t been assigned yet.
4. Always declare variables at the top to avoid confusion — or better yet, use `let` and `const` which are block-scoped and less error-prone.

---



### 7. Takeaway: Exposing Functions from an IIFE (Immediately Invoked Function Expression)

1. **IIFE** creates a private scope — variables inside it are hidden unless you explicitly expose them.
2. You can **expose a function** from an IIFE in three main ways:

   * **Return it**: The IIFE returns a function which is stored in a variable (`const fn = (function(){ return function(){} })();`)
   * **Assign to `window` or `global`**: Makes the function globally accessible (`window.myFunc = function(){};`)
   * **Assign to a global variable** directly inside the IIFE (`myFunc = function(){}`; declared without `let/const/var`)
3. While all work, **returning the function** is safest and keeps things modular and testable.
4. Attaching to `window`/`global` can cause pollution of global scope — **use with caution**.

---


