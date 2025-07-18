

# 🧠 Loops In Javascript

**Topic**: `for loop`, `while loop`, `do...while loop`, `break`, and `continue`

---

## 🔁 1. What is a Loop?

A **loop** is a programming construct that repeats a block of code *as long as a specified condition is true*.
You use loops to avoid repeating code manually.

---

## ✅ TYPES OF LOOPS IN JS

| Loop Type    | Best Used When…                                | Checks Condition | Executes At Least Once? |
| ------------ | ---------------------------------------------- | ---------------- | ----------------------- |
| `for` loop   | You know **how many times** to repeat          | Before each run  | ❌ No                    |
| `while` loop | You want to repeat **while** something is true | Before each run  | ❌ No                    |
| `do...while` | You want to run **at least once**              | After each run   | ✅ Yes                   |

---

### 📌 2. `for` loop

### ✅ Definition:

Used when the number of iterations is known.
It has three parts: **initialization**, **condition**, **increment/decrement**.

### 🧾 Syntax:

```js
for (initialization; condition; increment) {
  // code block to be executed
}
```

### 💡 Real-world analogies:

* Counting steps on a staircase.
* Going through a fixed-size list of names.
* Checking off all boxes in a form.

### ✅ Example:

```js
// Print numbers 1 to 5
for (let i = 1; i <= 5; i++) {
  console.log("Number:", i);
}
```

---

### 📌 3. `while` loop

### ✅ Definition:

Runs **as long as the condition is true**.
Used when the number of iterations is *not known ahead of time*.

### 🧾 Syntax:

```js
while (condition) {
  // code block to execute
}
```

### 💡 Real-world analogies:

* Wait in line until the doctor calls you.
* Keep eating until you're full.

### ✅ Example:

```js
let i = 1;
while (i <= 5) {
  console.log("Number:", i);
  i++;
}
```

---

### 📌 4. `do...while` loop

### ✅ Definition:

Same as `while`, **but guarantees at least one execution**, even if the condition is false at first.

### 🧾 Syntax:

```js
do {
  // code block to execute
} while (condition);
```

### 💡 Real-world analogies:

* Try a food once even if unsure you'll like it.
* Always greet someone before checking if they're friendly.

### ✅ Example:

```js
let i = 1;
do {
  console.log("Number:", i);
  i++;
} while (i <= 5);
```

---

### 🛑 5. `break` statement

### ✅ Definition:

Exits the loop **immediately**, even if the condition is still true.

### 🧾 Syntax:

```js
for (...) {
  if (someCondition) {
    break;
  }
}
```

### 💡 Real-world analogies:

* Exiting a movie if it’s boring.
* Leaving class if there’s a fire drill.

### ✅ Example:

```js
for (let i = 1; i <= 10; i++) {
  if (i === 5) break;  // stop when i is 5
  console.log(i);
}
// Output: 1 2 3 4
```

---

### ➿ 6. `continue` statement

### ✅ Definition:

**Skips** the current iteration and moves to the next one.

### 🧾 Syntax:

```js
for (...) {
  if (someCondition) {
    continue;
  }
  // remaining code
}
```

### 💡 Real-world analogies:

* Skip a song you don’t like in a playlist.
* Ignore blank lines when reading a file.

### ✅ Example:

```js
for (let i = 1; i <= 5; i++) {
  if (i === 3) continue;  // skip 3
  console.log(i);
}
// Output: 1 2 4 5
```

---

## 🔥 Edge Cases & Gotchas

| Gotcha                                               | Explanation                                                                           |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------- |
| ✅ Infinite Loop                                      | If you forget to increment (`i++`) or break a condition, the loop may run forever.    |
| 🚫 `do...while` runs once even if condition is false | `do...while` always runs at least one time!                                           |
| ❗ `continue` only skips one iteration                | It doesn't stop the loop, just skips the current pass.                                |
| 🧪 Use `break` inside `switch` inside loops          | Otherwise, you can get unwanted fall-through behavior.                                |
| 💡 Declaring `let i` inside loop                     | The `let` declaration inside a loop is block-scoped — behaves differently than `var`. |

---

## ✅ QUICK SUMMARY

| Concept      | Use Case                   | Key Point                            |
| ------------ | -------------------------- | ------------------------------------ |
| `for`        | Known number of iterations | Combines init, condition, and update |
| `while`      | Unknown stop point         | Checks condition before loop         |
| `do...while` | Must run at least once     | Checks condition after loop          |
| `break`      | Stop the loop completely   | Used inside `for`, `while`, `switch` |
| `continue`   | Skip current iteration     | Loop continues normally after        |

---

