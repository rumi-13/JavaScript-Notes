
# JavaScript Data Types

## 📚 Table of Contents

- [📦 What Are Data Types?](#-what-are-data-types)
- [🔹 Primitive Data Types](#-primitive-data-types)
- [🔧 Special Cases](#-special-cases)
- [🔸 Reference Data Types](#-reference-data-types)
- [🔍 typeof Operator](#-typeof-operator)
- [🔁 Type Coercion (Automatic Type Conversion)](#-type-coercion-automatic-type-conversion)
- [🚨 Loose vs Strict Equality](#-loose-vs-strict-equality)
- [🧪 NaN – Not a Number](#-nan--not-a-number)
- [🔦 Truthy and Falsy Values](#-truthy-and-falsy-values)
- [🔥 Edge Cases & Gotchas](#-edge-cases--gotchas)


---

## 📦 What Are Data Types?

In JavaScript, **every value has a type**. These types define how data behaves, how it's stored in memory, and how operations treat them.

There are **two main categories** of data types:

| Category      | Description                           | Examples                      |
| ------------- | ------------------------------------- | ----------------------------- |
| **Primitive** | Stored directly (by value)            | `number`, `string`, `boolean` |
| **Reference** | Stored via memory references (by ref) | `object`, `array`, `function` |

---

## 🔹 Primitive Data Types

These are **immutable** and stored directly in the call stack.

| Type        | Example                           | typeof result        |
| ----------- | --------------------------------- | -------------------- |
| `String`    | `"hello"`, `'JS'`                 | `"string"`           |
| `Number`    | `42`, `-3.14`                     | `"number"`           |
| `Boolean`   | `true`, `false`                   | `"boolean"`          |
| `Undefined` | declared but not assigned         | `"undefined"`        |
| `Null`      | explicitly empty                  | `"object"` ← *(bug)* |
| `Symbol`    | `Symbol("id")`                    | `"symbol"`           |
| `BigInt`    | `123456789012345678901234567890n` | `"bigint"`           |

---

## 🔧 Special Cases

- `typeof null` returns `"object"` — this is a **historical bug** in JavaScript.
- `undefined` ≠ `null`

  - `undefined` → not yet assigned  
  - `null` → explicitly “empty”

---

## 🔸 Reference Data Types

These are **stored in the heap**, and variables store only a reference (pointer) to the data.

| Type       | Example               | typeof result |
| ---------- | --------------------- | ------------- |
| `Object`   | `{ name: "Harsh" }`   | `"object"`    |
| `Array`    | `[10, 20, 30]`        | `"object"`    |
| `Function` | `function greet() {}` | `"function"`  |

---

## 🔍 typeof Operator

```js
typeof "JS"         // "string"
typeof 10           // "number"
typeof true         // "boolean"
typeof undefined    // "undefined"
typeof null         // "object"  ← bug
typeof []           // "object"
typeof {}           // "object"
typeof function(){} // "function"
````

---

## 🔁 Type Coercion (Automatic Type Conversion)

JavaScript is **loosely typed**, so it tries to convert types automatically:

```js
"5" + 1        // "51" (number → string)
"5" - 1        // 4    (string → number)
true + 1       // 2
null + 1       // 1
undefined + 1  // NaN
```

> 🤯 JavaScript tries to “guess” what you meant — this leads to **unexpected results**.

---

## 🚨 Loose vs Strict Equality

```js
5 == "5"     // ✅ true → compares after coercion
5 === "5"    // ❌ false → checks both value and type
```

| Operator | Compares     | Type Conversion |
| -------- | ------------ | --------------- |
| `==`     | Value        | ✅ Yes           |
| `===`    | Value + Type | ❌ No            |

> 🔒 **Best Practice:** Always use `===` for reliable comparisons.

---

## 🧪 NaN – Not a Number

```js
typeof NaN // "number"
```

You get `NaN` when a **mathematical operation fails**:

```js
0 / 0             // NaN
parseInt("abc")   // NaN
```

---

## 🔦 Truthy and Falsy Values

| Falsy Values        | Why?           |
| ------------------- | -------------- |
| `false`, `0`, `""`  | Clearly empty  |
| `null`, `undefined` | No value       |
| `NaN`               | Invalid number |

Everything else is truthy:

```js
if ("0") console.log("Runs");  // ✅ runs, because "0" is truthy
```

---

## 🔥 Edge Cases & Gotchas

> **1. typeof null → "object"**
> A bug that remains for legacy reasons.

> **2. Arrays & objects return "object"**

```js
typeof []     // "object"
typeof {}     // "object"
typeof null   // "object" ← but it’s NOT an object
```

> **3. Loose comparisons can trick you**

```js
[] == 0             // true
[] == false         // true
null == undefined   // true
```

---

## ✅ Quick Summary Box

| Concept         | Summary                                        |
| --------------- | ---------------------------------------------- |
| Primitive Types | Stored directly (string, number, etc.)         |
| Reference Types | Stored via memory reference (object, array)    |
| typeof null     | `"object"` (bug)                               |
| Type Coercion   | JS auto-converts types in operations           |
| == vs ===       | Prefer `===` (checks type + value)             |
| Falsy Values    | `false`, `0`, `""`, `null`, `undefined`, `NaN` |

---

