## Control Flow in JavaScript

### 🧠 What is Control Flow?

Control flow is **how JavaScript decides which lines of code to run, in what order**, and **how often**.
It's like the **traffic controller** of your code — directing decisions and loops.

---

### 1. **`if`, `else if`, and `else`**

This structure allows your program to **make decisions**.

```js
let marks = 78;

if (marks >= 90) {
  console.log("A"); // only runs if marks >= 90
} else if (marks >= 75) {
  console.log("B"); // runs if above is false, but marks >= 75
} else {
  console.log("C"); // runs if none of the above are true
}
```

🟡 **Order matters!** JavaScript checks `if`, then `else if`, and finally `else`.

---

### 2. **`switch-case`**

Use this when you're comparing **one variable to many fixed values**.

```js
let fruit = "apple";

switch (fruit) {
  case "banana":
    console.log("Yellow");
    break;
  case "apple":
    console.log("Red");
    break;
  default:
    console.log("Unknown");
}
```

- If the value matches `"apple"`, it logs `"Red"`.
- The `break` **stops the execution**. Without it, all remaining cases will run too (called fall-through).

---

### 3. **Early Return Pattern**

Avoids deep nesting and keeps code clean by returning early.

```js
function checkAge(age) {
  if (age < 18) return "Denied"; // exits early
  return "Allowed";
}
```

✅ Used to simplify logic and exit early from a function if a condition is met.

---

### ⚠️ Common Confusions

| Concept         | Clarification                                                                                    |
| --------------- | ------------------------------------------------------------------------------------------------ |
| `switch`        | If you forget `break`, it will **continue running** all next cases after a match (fall-through). |
| `else if` chain | JavaScript checks them in order — once one is true, others are skipped.                          |
| `if (value)`    | Works directly with truthy/falsy values like `if ("hello")` is true, `if (0)` is false.          |

---

### 🧠 Mindset

- You can use truthy/falsy values directly in
  break
- Control flow = conditional storytelling.
- It helps your program make choices and respond differently to different inputs.

- Write readable branches. Avoid nesting too deep — use early return if neede
