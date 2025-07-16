

## 🧠 OPERATORS IN JAVASCRIPT

**Topic:** JavaScript Operators – Arithmetic, Assignment, Comparison, Logical, Unary, Ternary, and `typeof`

---

## 🔧 What Are Operators?

**Operators** are **symbols or keywords** that perform operations on values (operands).
Think of them as the **verbs** of JavaScript: they tell the program what to do with data.

---

## ➕ Arithmetic Operators

| Operator | Name           | Example (`a = 10, b = 3`) | Result  |
| -------- | -------------- | ------------------------- | ------- |
| `+`      | Addition       | `a + b`                   | `13`    |
| `-`      | Subtraction    | `a - b`                   | `7`     |
| `*`      | Multiplication | `a * b`                   | `30`    |
| `/`      | Division       | `a / b`                   | `3.333` |
| `%`      | Modulus        | `a % b`                   | `1`     |
| `**`     | Exponentiation | `2 ** 3`                  | `8`     |

### 🔍 Real-Life Metaphor:

* Think of `+`, `-`, `*` like basic calculator buttons.
* `%` is like checking how many candies are **left over** after equally distributing.
* `**` is like saying "2 raised to the power 3".

---

## 🧮 Assignment Operators

| Operator | Meaning           | Example (`a = 5`) | Result |
| -------- | ----------------- | ----------------- | ------ |
| `=`      | Assignment        | `a = 10`          | `10`   |
| `+=`     | Add & assign      | `a += 2`          | `7`    |
| `-=`     | Subtract & assign | `a -= 1`          | `4`    |
| `*=`     | Multiply & assign | `a *= 3`          | `15`   |
| `/=`     | Divide & assign   | `a /= 2`          | `2.5`  |
| `%=`     | Modulus & assign  | `a %= 3`          | `2`    |

> 🧠 **Shortcut in disguise**: `a += b` is just `a = a + b`

---

## 🧾 Comparison Operators

Used to **compare values** in conditions:

| Operator          | Meaning            | Example     | Result  |
| ----------------- | ------------------ | ----------- | ------- |
| `==`              | Equal (loose)      | `5 == "5"`  | `true`  |
| `===`             | Equal (strict)     | `5 === "5"` | `false` |
| `!=`              | Not equal (loose)  | `5 != "5"`  | `false` |
| `!==`             | Not equal (strict) | `5 !== "5"` | `true`  |
| `>` `<` `>=` `<=` | Greater/less than  | `5 > 3`     | `true`  |

---
Monospace
## ✅ Logical Operators

Used to **combine or negate conditions**:

| Operator | Name | Example          | Result  |
|----------|------|------------------|---------|
| `&&`     | AND  | `true && false`  | `false` |
| `||`     | OR   | `true || false`  | `true`  |
| `!`      | NOT  | `!true`          | `false` |

🔍 Think in **truthy/falsy** terms when applying these.

---

## 🌀 Unary Operators

Operate on a **single value**:

| Operator | Description       | Example      | Result      |
| -------- | ----------------- | ------------ | ----------- |
| `+`      | Convert to number | `+"5"`       | `5`         |
| `-`      | Negate number     | `-7`         | `-7`        |
| `++`     | Increment         | `++a`        | `a = a + 1` |
| `--`     | Decrement         | `--a`        | `a = a - 1` |
| `typeof` | Get data type     | `typeof 123` | `"number"`  |

---

## ❓ Ternary Operator

Shorthand for `if...else`

```js
condition ? valueIfTrue : valueIfFalse
```

Example:

```js
let score = 80;
let result = score > 50 ? "Pass" : "Fail";
```

---

## 🔬 typeof Operator (Deep Dive)

| Input                 | Output           |
| --------------------- | ---------------- |
| `typeof "hi"`         | `"string"`       |
| `typeof 123`          | `"number"`       |
| `typeof null`         | `"object"` ⛔ bug |
| `typeof []`           | `"object"`       |
| `typeof {}`           | `"object"`       |
| `typeof function(){}` | `"function"` ✅   |

---

## 🔥 Edge Cases & Gotchas

| Gotcha              | Why It’s Tricky                                  |
| ------------------- | ------------------------------------------------ |
| `"5" + 1` is `"51"` | String + Number → String concatenation           |
| `"5" - 1` is `4`    | JS converts `"5"` to number → arithmetic works   |
| `!!value`           | Double negation to coerce to Boolean             |
| `++i` vs `i++`      | Pre-increment vs post-increment behavior differs |

---

## ✅ Quick Summary Box

| Category   | Description                    |   |         |
| ---------- | ------------------------------ | - | ------- |
| Arithmetic | `+`, `-`, `*`, `/`, `%`, `**`  |   |         |
| Assignment | `=`, `+=`, `-=`, etc.          |   |         |
| Comparison | `==`, `===`, `!=`, `>`, `<`    |   |         |
| Logical    | `&&`, \`                       |   | `, `!\` |
| Unary      | `typeof`, `+`, `-`, `++`, `--` |   |         |
| Ternary    | `cond ? trueVal : falseVal`    |   |         |

---
