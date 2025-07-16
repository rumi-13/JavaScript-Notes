
# JavaScript Variables 

## 📚 Table of Contents

- [📦 What Are Variables?](#-what-are-variables)
- [🧰 Syntax](#-syntax)
- [🎨 Real-World Analogies](#-real-world-analogies)
- [🔍 Keyword Comparison: `var` vs `let` vs `const`](#-keyword-comparison-var-vs-let-vs-const)
- [🧪 Code Examples](#-code-examples)
- [🔥 Scope in Real Life (Block vs Function)](#-scope-in-real-life-block-vs-function)
- [🧨 Hoisting in JavaScript](#-hoisting-in-javascript)
- [🔥 Edge Cases & Gotchas](#-edge-cases--gotchas)

 - [📌  How JavaScript Creates Variables (Behind the Scenes)](#-1-how-javascript-creates-variables-behind-the-scenes)
 - [⚙️  Memory Allocation by Declaration Type](#-2-memory-allocation-by-declaration-type)
- [🧠 Call Stack, Memory Heap, & Variable References](#-3-call-stack-memory-heap--variable-references)
- [🔍 Lexical Environment & Execution Context](#-4-lexical-environment--execution-context)
 - [🧨 Edge Cases & Gotchas](#-edge-cases--gotchas-1)
- [✅ Quick Summary Box](#-quick-summary-box-1)

---

# 🧠 SECTION 1: VARIABLES & DECLARATION

## 📦 What Are Variables?

**Definition:**  
Variables are **named containers** for storing data in JavaScript. Think of them as *labeled boxes* where you can keep different types of values — numbers, strings, arrays, objects, etc.

**Purpose:**

- Store information  
- Access and modify it later  
- Help build dynamic, interactive programs  

---

## 🧰 Syntax

```js
// Syntax using all three keywords
var name = "John";     // Function-scoped, outdated
let age = 30;          // Block-scoped, reassignable
const PI = 3.14;       // Block-scoped, constant
````

---

## 🎨 Real-World Analogies

| Concept | Analogy                                                                                              |
| ------- | ---------------------------------------------------------------------------------------------------- |
| `var`   | A locker in a building you can always access, even if someone else redeclares it. 🏢                 |
| `let`   | A suitcase with a combination lock — you can open it (reassign), but only if it's yours (block). 🔐  |
| `const` | A sealed box — you can’t replace it, but if it holds objects, you can still shuffle items inside. 📦 |

---

## 🔍 Keyword Comparison: `var` vs `let` vs `const`

| Feature      | `var`                          | `let`                             | `const`              |
| ------------ | ------------------------------ | --------------------------------- | -------------------- |
| Scope        | Function                       | Block                             | Block                |
| Reassignable | ✅ Yes                          | ✅ Yes                             | ❌ No                 |
| Redeclarable | ✅ Yes                          | ❌ No                              | ❌ No                 |
| Hoisted      | ✅ (initialized as `undefined`) | ✅ (TDZ)                           | ✅ (TDZ)              |
| Use Case     | Avoid in modern JS             | Use for variables that may change | Use for fixed values |

---

## 🧪 Code Examples

### `var` — Function Scope & Redeclaration

```js
function testVar() {
  var score = 10;
  var score = 20; // ✅ No error
  console.log(score); // 20
}
```

### `let` — Block Scope & Temporal Dead Zone

```js
function testLet() {
  let age = 25;
  age = 30;       // ✅ Reassignment is fine
  // let age = 40; // ❌ Redeclaration causes SyntaxError
}
```

### `const` — Immutable Reference

```js
const PI = 3.14;
// PI = 3.14159; // ❌ TypeError

const student = { name: "Riya" };
student.name = "Priya";  // ✅
```

---

## 🔥 Scope in Real Life (Block vs Function)

```js
{
  var a = 10;
  let b = 20;
  const c = 30;
}

console.log(a); // ✅ 10
console.log(b); // ❌ ReferenceError
console.log(c); // ❌ ReferenceError
```

> `var` ignores block `{}` — it’s accessible outside
> `let` and `const` are *truly scoped* to the block they are defined in

---

## 🧨 Hoisting in JavaScript

Hoisting is JavaScript’s way of **moving declarations to the top** of their scope before code executes.

```js
console.log(x); // undefined
var x = 5;

console.log(y); // ❌ ReferenceError
let y = 10;
```

> `var` is hoisted and initialized to `undefined`
> `let`/`const` are hoisted but in **TDZ** – not accessible before declaration

---

## 🔥 Edge Cases & Gotchas

> **1. `const` Is Not Deeply Immutable**

```js
const arr = [1, 2];
arr.push(3);     // ✅
arr = [1, 2, 3]; // ❌ TypeError
```

> **2. Redeclaring `let` or `const` in Same Scope**

```js
let a = 1;
let a = 2; // ❌ SyntaxError
```

> **3. Shadowing with `var`**

```js
var x = 10;
if (true) {
  var x = 20;
}
console.log(x); // 20 😱
```

> **4. TDZ Errors**

```js
console.log(val); // ❌ ReferenceError
let val = 100;
```

> **5. Function Hoisting with `var`**

```js
console.log(myFunc); // undefined
var myFunc = function() {};
```

---

## ✅ Quick Summary Box

| Concept  | Summary                                                                             |
| -------- | ----------------------------------------------------------------------------------- |
| Variable | Named storage for data                                                              |
| `var`    | Function-scoped, hoisted, redeclarable (⚠️ risky)                                   |
| `let`    | Block-scoped, safe for reassignment                                                 |
| `const`  | Block-scoped, unchangeable binding (but object contents can change)                 |
| Hoisting | All declarations moved to top. `var` → undefined, `let`/`const` → TDZ               |
| TDZ      | Area where `let` and `const` exist before being initialized, but cannot be accessed |

---

# 🧠 SECTION 2: Js Behind the Scenes

## 📌 1. How JavaScript Creates Variables 

JavaScript performs two phases:

| Phase                 | Description                              |
| --------------------- | ---------------------------------------- |
| Memory Creation Phase | Allocates memory for variables/functions |
| Execution Phase       | Runs code line-by-line, assigns values   |

---

### 🔍 Step-by-Step: Memory Allocation

```js
console.log(x); // ?
var x = 5;
```

**Internally:**

1. Finds `var x`, allocates memory as `undefined`
2. Executes `console.log(x)` → prints `undefined`
3. Then assigns `x = 5`

---

## ⚙️ 2. Memory Allocation by Declaration Type

| Keyword | Allocated During Creation Phase | Initialized Immediately?      | Scope Type     |
| ------- | ------------------------------- | ----------------------------- | -------------- |
| `var`   | ✅ Yes                           | ✅ Yes (`undefined`)           | Function Scope |
| `let`   | ✅ Yes                           | ❌ No (TDZ)                    | Block Scope    |
| `const` | ✅ Yes                           | ❌ No (TDZ; must assign early) | Block Scope    |

---

### 🧪 Visual Analogy: Coffee Cups ☕️

| Variable Type | Analogy                                                                         |
| ------------- | ------------------------------------------------------------------------------- |
| `var`         | A cup placed early with a “undefined” label — accessible even if not filled yet |
| `let`         | Invisible cup until declaration line is reached                                 |
| `const`       | Same as `let`, but once filled, it cannot be replaced                           |

---

## 🧠 3. Call Stack, Memory Heap, & Variable References

| Memory Area | What It Stores                              |
| ----------- | ------------------------------------------- |
| Call Stack  | Primitives, function calls                  |
| Memory Heap | Objects, arrays, functions (non-primitives) |

```js
let num = 42;                  // Stack
let person = { name: "Rumi" }; // Heap
```

---

### 🔁 Reference Working (Heap Example)

```js
const obj1 = { lang: "JS" };
const obj2 = obj1;
obj2.lang = "Python";

console.log(obj1.lang); // "Python"
```

> Both `obj1` and `obj2` point to same memory in heap

---

## 🔍 4. Lexical Environment & Execution Context

Each function creates its own **Execution Context**, which includes:

1. Variable Environment
2. Lexical Environment
3. Scope Chain

```js
function outer() {
  let a = 10;
  function inner() {
    console.log(a);
  }
  inner();
}
```

---

## 🧨 Edge Cases & Gotchas

> **1. Global `var` attaches to `window`**

```js
var x = 5;
console.log(window.x); // ✅

let y = 10;
console.log(window.y); // ❌ undefined
```

> **2. TDZ Is Position-Based**

```js
console.log(a); // ❌ ReferenceError
let a = 10;
```

> **3. Objects Passed by Reference in Functions**

```js
function update(obj) {
  obj.name = "Updated";
}
let student = { name: "Riya" };
update(student);
console.log(student.name); // ✅ "Updated"
```

> **4. Garbage Collection**
> JavaScript removes unreachable data automatically:

```js
let obj = { name: "A" };
obj = null; // eligible for collection
```

---

## ✅ Quick Summary Box

| Concept            | Summary                                |
| ------------------ | -------------------------------------- |
| Variable Creation  | Two phases: memory & execution         |
| `var`              | Allocated + initialized as `undefined` |
| `let`/`const`      | Hoisted but not initialized (TDZ)      |
| Call Stack         | Holds primitives, function calls       |
| Heap               | Stores objects, arrays, functions      |
| References         | Objects passed by reference            |
| Garbage Collection | Frees memory of unreferenced variables |

---