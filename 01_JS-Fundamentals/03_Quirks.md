
# 🧠 JavaScript Variables & Data Types – Quirks 


## 📦 `typeof` Oddities

**`typeof null` → `"object"`**  
This is a historical bug in JS; `null` is a primitive but returns `"object"`.

**`typeof NaN` → `"number"`**  
Although `NaN` means "Not a Number", it is technically a numeric type in JS.

**`typeof function() {}` → `"function"`**  
Functions are objects but have a distinct `"function"` type.

**`typeof []` → `"object"`**  
Arrays are a special type of object; no separate `"array"` type exists.

---

## 🔁 Coercion Confusion (`==` vs `===`)

**`==` allows coercion, `===` does not**  
`==` converts types to match; `===` checks type and value strictly.

**`[] == 0` → `true`**  
`[]` coerces to `""`, then to `0`, so `0 == 0` is `true`.

**`null == undefined` → `true`**  
They are loosely equal but not strictly (`null === undefined` → `false`).

**`"0" === 0` → `false`**  
Same value after coercion, but different types (string vs number).

---

## 💡 Truthy & Falsy Tricks

**Falsy values: `0`, `""`, `null`, `undefined`, `NaN`, `false`**  
Anything else, including `[]`, `{}`, `"false"`, is truthy.

**`true + false` → `1`**  
Booleans are coerced to numbers: `1 + 0 = 1`.

**`undefined + 1` → `NaN`**  
You can't do arithmetic with `undefined`, so it returns Not-a-Number.

**`{} == true` → `false`**  
An object doesn't coerce to `1` like `true` does.

---

## 🔢 Data Type Behavior

**Primitive types**: `string`, `number`, `bigint`, `boolean`, `undefined`, `symbol`, `null`  
All others like `Array`, `Object`, `Function` are **non-primitives** (reference types).

**`"5" + 2` → `"52"`**  
`+` with a string triggers string concatenation, not arithmetic.

**`{} + []` → `0` (sometimes)**  
In global scope, this is parsed as `(+[])` which becomes `+"" → 0`.

**`0 == false` → `true`**, **`"" == false` → `true`**  
Because both sides get coerced to `0`, the comparison is true.

---

## 🔭 Special Types

**`BigInt`** handles numbers beyond `Number.MAX_SAFE_INTEGER`.  
Declared with an `n` suffix like `12345678901234567890n`.

**`Symbol`** is a unique and immutable primitive used as object keys.  
Two symbols with the same description are never equal.

---


