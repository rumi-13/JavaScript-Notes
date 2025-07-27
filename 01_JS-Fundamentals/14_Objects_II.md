#  Object Copying, Optional Chaining, Computed Properties  


# 1. Object Copying

## Reference Copy (Object Assignment)
- **Theory:** In JavaScript, objects are *reference types*. When you assign one object variable to another, you *do not* create a new object. Instead, both variables point to the same object in memory. Any change through one reference is reflected in the other.
- **Use-case:** Useful but risky—accidental mutations can cause bugs, especially in large apps or when dealing with state (e.g. in React).
- **Drawback:** Changes to either variable affect the same underlying object.

```js
const a = { foo: 1 };
const b = a;   // Both 'a' and 'b' point to the same object
b.foo = 42;
console.log(a.foo); // 42 (modifying b changes a)
```

## Shallow Copy

#### a. Spread Syntax (`...`)
- **Theory:** The spread operator creates a new object containing *copies* of the original object's *top-level* properties. HOWEVER, if those properties themselves are objects or arrays, *their references* are copied, not their contents. That means nested objects or arrays are *still linked* between the old and the new object.
- **When to Use:** Fast, useful for flat objects or when you don’t care about mutating nested data.
- **Limitation:** Unsafe if your data is nested.

```js
const obj1 = { num: 2, nested: { value: 10 } };
const copy = { ...obj1 };
copy.num = 100;        // OK: only copy changed
copy.nested.value = 50;// PROBLEM: also changes obj1.nested.value!
console.log(obj1.nested.value); // 50
```

#### b. `Object.assign()`
- **Theory:** Takes one or more *source* objects and copies their *own* (not inherited) properties into a *target* object. Like spread syntax, only does a "one-level-deep" copy.
- **Limitation:** Same as spread—nested objects are shared, not cloned fully.

```js
const obj2 = { x: 1, inner: { y: 2 } };
const copy2 = Object.assign({}, obj2);
copy2.inner.y = 99;
console.log(obj2.inner.y); // 99 (shared reference)
```

## Deep Copy

#### a. `JSON.parse(JSON.stringify(obj))`
- **Theory:** This approach serializes the object to JSON (which can only represent simple structures), and then parses it back, resulting in a *completely independent* object. All nested levels are duplicated, so changes don't leak back to the original.
- **Limitations:**
    - Only works with JSON-safe data: loses functions, `Date`, `undefined`, symbols, circular references, and special types.
    - Dates become strings, functions/undefined values get removed.

```js
const orig = { a: [1, 2], func: () => 42, d: new Date() };
const deepCopy = JSON.parse(JSON.stringify(orig));
deepCopy.a[0] = 999;
console.log(orig.a[0]);    // 1 (copied deeply)
console.log(deepCopy.func); // undefined (lost)
console.log(typeof deepCopy.d); // 'string' (not Date!)
```

#### b. `structuredClone` (modern JS)
- **Theory:** Clones almost any built-in object or value, including arrays, maps, dates, and can handle circular references.
- **Limitation:** Only available in modern browsers/environments.

```js
const original = { date: new Date(), nested: { v: 3 } };
const clone = structuredClone(original);
clone.nested.v = 99;
console.log(original.nested.v); // 3 (safe, deep copy)
console.log(clone.date instanceof Date); // true
```

# Optional Chaining (`?.`)
- **Theory:** Optional chaining allows you to safely access *deeply nested* properties of an object without having to check every step for null or undefined. It *short-circuits*: if any reference in the chain is nullish (`null` or `undefined`), the whole expression safely returns `undefined` instead of throwing an error.
- **Use-case:** Access data from dynamic sources (APIs, configs, user input) where keys or properties might or might not exist.
- **Limitation:** Short-circuits only on `null` or `undefined`, not on other falsy values (like `''`, `0`, or `false`).

```js
const user = {
  profile: {
    email: "x@y.com"
  }
};

console.log(user.profile?.email);    // 'x@y.com'
console.log(user.contacts?.phone);   // undefined (NO error)
console.log(user.contacts.phone);    // TypeError (if not using '?.')
```

- **Also valid for functions and arrays:**

```js
const api = { get: () => "hi" };
console.log(api.get?.());         // "hi"
console.log(api.missing?.());     // undefined (no error)
```

# Computed Properties

- **Theory:** Computed properties let you use *dynamic expressions or variables* for object property names at creation time. Instead of a static key, you can bracket and evaluate any expression (`[expression]`). Very useful when building objects where keys are generated or not known ahead of time.
- **Use-cases:** Creating objects from user input, API results, or when looping over arrays to generate property names.
- **Edge Case:** If two computed keys evaluate to the same result, the last one takes precedence.

```js
const suffix = 'World';
const dynamicObject = {
  ['hello' + suffix]: 'JS',
  [1 + 1]: 22,
  ['foo']: 44
};
console.log(dynamicObject.helloWorld); // "JS"
console.log(dynamicObject[2]);         // 22
```

- **Overriding property example:**
```js
const k = 'dup';
const obj = { [k]: 1, [k]: 99 };
console.log(obj.dup); // 99 (last wins)
```

# Summary Table

| Copying Type         | Code Example                           | Deep?     | Notes                      |
|----------------------|----------------------------------------|-----------|----------------------------|
| Reference Copy       | `let b = a;`                           | No        | Both vars, same object     |
| Shallow (Spread)     | `{ ...a }`                             | No        | Nested props are shared    |
| Shallow (assign)     | `Object.assign({}, a)`                 | No        | Same as spread, 1 level    |
| Deep (JSON method)   | `JSON.parse(JSON.stringify(a))`        | Yes*      | Can't copy Date, functions |
| Deep (structuredClone)| `structuredClone(a)`                  | Yes       | Modern JS only             |

## ☑️ Key Points to Remember
- Know when you want true, independent copies (deep) versus just a new reference (shallow/reference).
- Use **optional chaining** to avoid runtime errors when accessing nested properties that might not exist.
- Use **computed properties** to dynamically create object keys from variables or expressions.
