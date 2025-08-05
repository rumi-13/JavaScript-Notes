# Questions: `this`, `call`, `apply`, and `bind`

JavaScript's `this` keyword — and the tools that let you override it — are responsible for many "works on my machine" bugs. This article distills the most frequent pain-points you encountered during practice and turns them into clear rules, patterns, and practical questions.

##  What *is* `this`?

`this` is just an implicit function parameter that points to **some object**.  
Which object it becomes is decided **when the function is invoked, not when it is defined.**

```text
"Who called me?" → JavaScript inspects the call-site → assigns `this`
```

# 1. Understanding Global Context

In the global scope, `this` refers to the global object. In browsers, this is the `window` object, while in Node.js it's the `global` object.

```javascript
// In a browser
console.log(this === window); // true
console.log(this); // Window object
```

### **Question :** In non-strict global code run in a browser, `console.log(this)` prints  
**Answer: b) `window`**

This demonstrates the **default binding** rule - when there's no other context, `this` defaults to the global object in non-strict mode.

# 2. The Four Binding Rules (highest → lowest)

| Rule | Trigger | Resulting `this` |
| :-- | :-- | :-- |
| **1. `new` binding** | `new Fn()` | the freshly constructed object |
| **2. Explicit binding** | `fn.call(obj)`, `fn.apply(obj)`, `fn.bind(obj)` | the first argument you pass |
| **3. Implicit binding** | `obj.fn()` | the object to the **left** of the dot |
| **4. Default binding** | plain call `fn()` | `window` (non-strict) / `undefined` (strict) |

## The Precedence Hierarchy

The key insight is that these rules have a strict hierarchy. When multiple rules could apply, the higher-priority rule wins.

### **Question :** Which binding rule has the **highest** priority?  
**Answer: d) `new`**

Here's why `new` binding trumps everything:

```javascript
function Person(name) {
    this.name = name;
}

const obj = { name: 'Object' };
const BoundPerson = Person.bind(obj); // Explicit binding

const instance = new BoundPerson('Alice'); // new binding wins
console.log(instance.name); // "Alice", not "Object"
```

Even though we explicitly bound `Person` to `obj`, the `new` operator creates a fresh object and makes `this` point to it.

# 3. Context Loss: the Classic Pitfall

## 3.1 Nested regular functions

This is where most developers stumble. When you have a function inside a method, the inner function loses the outer method's `this` context.

```javascript
const counter = {
  count: 0,
  start() {
    setInterval(function () {        // 🚨 standalone call each tick
      this.count++;                  // `this` = window / undefined
    }, 1_000);
  }
};
```

### **Question:** Fix the counter using arrow function:

```javascript
const counter = {
  count: 0,
  start() {
    setInterval(() => {              // ✅ Arrow function inherits `this`
      this.count++;                  // `this` = counter object
      console.log(this.count);
    }, 1_000);
  }
};
```

**Alternative fixes:**
```javascript
// Using bind
setInterval(function() {
  this.count++;
}.bind(this), 1_000);

// Using self capture
const self = this;
setInterval(function() {
  self.count++;
}, 1_000);
```

## 3.2 Method extraction

Another common pitfall is assigning a method to a variable, which severs its connection to the original object.

```javascript
const person = { name: 'Ana', say() { console.log(this.name); } };
const fn = person.say;  // 🚨 lost its object
fn();                   // undefined
```

### **Question :** Assigning `const m = someObj.method; m();` preserves the original `this`.  
**Answer: False**

When you extract a method like this, it becomes a standalone function call, triggering **default binding** instead of **implicit binding**.

# 4. Arrow Functions vs. Regular Functions

| Feature | Regular Function | Arrow Function |
| :-- | :-- | :-- |
| Own `this`? | Yes (dynamic) | **No** (lexical) |
| Best for | Object methods, event handlers where element is needed | Callbacks, nested functions |
| Can be rebound? | Yes (`call` / `apply` / `bind`) | No |

## Lexical `this` in Action

Arrow functions **inherit** `this` from their enclosing scope at the time they're defined, not when they're called.

### **Question :** What does this log?  
```javascript
const obj = { x: 1, f() { return () => this.x; } };
const fn = obj.f();
console.log(fn());
```
**Answer: a) 1**

Here's the step-by-step breakdown:
1. `obj.f()` calls the method `f` with `this = obj` (implicit binding)
2. Inside `f`, the arrow function `() => this.x` is created
3. The arrow function **captures** `this` from `f`, so `this = obj`
4. When `fn()` is called later, it still has `this = obj`, so `this.x = 1`

### **Question :** Arrow functions can be used as event listeners when you need `this` to be the DOM element.  
**Answer: False**

```javascript
button.addEventListener('click', () => {
    console.log(this); // Window object, not the button!
});

// Use regular function for element access
button.addEventListener('click', function() {
    console.log(this); // The button element
});
```

# 5. Manual Binding Methods

## 5.1 `call` - Immediate Execution with Individual Arguments

`call` immediately invokes a function with a specified `this` and arguments passed individually.

```javascript
function greet(greeting, punctuation) {
    console.log(`${greeting}, I'm ${this.name}${punctuation}`);
}

const alice = { name: 'Alice' };
greet.call(alice, 'Hello', '!'); // "Hello, I'm Alice!"
```

### **Question ** Method Borrowing with `call`:

```javascript
const person = {
    firstName: 'John',
    lastName: 'Doe',
    fullName: function() {
        return `${this.firstName} ${this.lastName}`;
    }
};

const visitor = {
    firstName: 'Jane',
    lastName: 'Smith'
};

const full = person.fullName.call(visitor); // "Jane Smith"
```

## 5.2 `apply` - Immediate Execution with Array of Arguments

`apply` works like `call` but takes arguments as an array.

```javascript
greet.apply(bob, ['Hi', '.']); // "Hi, I'm Bob."
```

### **Question :** `apply` can pass arguments **individually** just like `call`.  
**Answer: False**

`apply` specifically requires an **array** of arguments, while `call` takes them individually.

### **Question :** Find Max with apply:

```javascript
const nums = [4, 12, 7];
console.log(Math.max.apply(null, nums)); // 12
```

*(Mnemonic: **A**pply → **A**rray)*

## 5.3 `bind` - Returns New Function with Permanent Context

`bind` creates a **new function** with `this` permanently set. This binding cannot be overridden.

```javascript
const bound = greet.bind(charlie, 'Welcome');
bound('?'); // later, anywhere
```

### **Question :** When you execute `boundFn.call(otherObj);` where `boundFn` was produced by `originalFn.bind(myObj)`, `this` inside the call is  
**Answer: b) `myObj`**

```javascript
function test() {
    return this.value;
}

const obj1 = { value: 'first' };
const obj2 = { value: 'second' };

const boundTest = test.bind(obj1);      // Permanently bind to obj1
console.log(boundTest.call(obj2));      // Still "first" - bind wins!
```

`bind` creates a **permanent** binding that cannot be overridden by `call` or `apply`.

### **Question :** Make Logger with Permanent `this`:

```javascript
function makeLogger(prefix) {
    return function(message) {
        console.log(`${prefix}: ${message}`);
    }.bind(null); // Permanently bind this to null
}

const logger = makeLogger('[INFO]');
logger.call({ x: 1 }, 'Hello'); // "[INFO]: Hello" - this is still null
```

# 6. Patterns You Should Know

1. **Method Chaining** – every mutator returns `this`.
2. **Method Borrowing** – `otherObj.method.call(thisObj)`.
3. **Event Handler Duality** – regular function to access the element, arrow function to access surrounding object.

# 7. Quick Recap

* `this` is resolved **at call-time**.
* Remember the precedence: **new → explicit → implicit → default**.
* Arrow functions steal `this` from where they're written; great for callbacks, bad for object methods.
* `call`/`apply` run now; `bind` runs later and can't be trumped.
* Most "undefined" bugs come from context loss — fix with arrow functions or `bind`.
