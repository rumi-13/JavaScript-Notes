
#  Object in JavaScript

**Objects** in JavaScript are collections of related data and functionality—specifically, key-value pairs where the key (property) is a string (or symbol) and the value can be any JavaScript value (primitive, object, function, etc.)

- Objects can represent real-world entities or abstract collections, and group data together efficiently.
- Keys are unique within an object.
- Objects can be created:
  - Using **object literal** syntax (most common):
    ```js
    const user = { name: "Alice", age: 25 };
    ```
  - Using the **Object constructor**:
    ```js
    const obj = new Object();
    obj.name = "Alice";
    ```
  - With class constructors, `Object.create`, or factory functions for advanced usage.

To access values:
- Use **dot notation** (when key is a valid identifier):
  ```js
  user.name // "Alice"
  ```
- Or **square bracket notation** (for dynamic keys or keys with special characters):
  ```js
  user["age"] // 25
  ```

##  Dot (`.`) vs Square Bracket (`[]`) Operators

- **Dot (`.`)**: Use when property name is a valid identifier (letters, digits, $, _; cannot start with a digit).
  ```js
  object.property
  ```
- **Square Bracket (`[]`)**: Use for property names stored in variables, with spaces, special characters, or not valid as identifiers.
  ```js
  object["property"]
  let key = "property";
  object[key]
  // With special characters:
  object["prop-name"]
  ```

# Nesting & Deep Access

- Objects can contain nested structures: other objects, arrays, or functions.
  ```js
  const company = {
    founder: {
      name: "Sam",
      details: {
        age: 30,
        hobbies: ["cycling", "coding"]
      }
    }
  };
  ```
- To access deeply nested values, chain keys:
  ```js
  company.founder.details.hobbies[1] // "coding"
  ```

- Accessing missing properties returns `undefined`.
  - Use **optional chaining (`?.`)** to guard against errors:
    ```js
    company.founder.location?.city // undefined, but does not throw error
    ```

# Object Destructuring

**Destructuring** simplifies extracting multiple properties into variables.

- **Basic Destructuring**:
  ```js
  const { name, age } = user;
  ```
- **Renaming** and **Default Values**:
  ```js
  const { name: userName, location = "N/A" } = user;
  ```
- **Nested Destructuring**:
  ```js
  const { founder: { details: { hobbies } } } = company;
  ```

# Looping: `for...in`, `Object.keys`, `Object.entries`

## a. `for...in`
- Iterates over all enumerable property keys (including inherited)[1].
  ```js
  for (let key in user) {
    console.log(key, user[key]);
  }
  ```
## b. `Object.keys(obj)`
- Returns an array of the object's own (not inherited) property keys.
  ```js
  Object.keys(user).forEach(key => {
    console.log(key);
  });
  ```
## c. `Object.entries(obj)`
- Returns an array of `[key, value]` pairs for the object's own properties.
  ```js
  for (const [key, value] of Object.entries(user)) {
    console.log(key, value);
  }
  ```

## ✨ Theory Quick Reference Table

| Concept            | What It Means                                                                                                        |
|--------------------|---------------------------------------------------------------------------------------------------------------------|
| Object             | Collection of key-value pairs (properties). Can contain any value, including methods.                               |
| Creation           | `{}` for literals; `new Object()` for constructor-based. Literals are simpler and preferred[6].                     |
| Access             | Dot for known, valid keys; bracket for dynamic or invalid (spaces/special).                                         |
| Nested Structure   | Objects can contain other objects/arrays. Deep access uses chaining (e.g., `obj.a.b.c`).                            |
| Destructuring      | Unpacks properties into variables; supports renaming and default values.                                            |
| Looping            | `for...in` (all enumerable keys), `Object.keys` (own keys), `Object.entries` (own key-value pairs).                 |
| Methods            | Functions attached to objects (object methods). Call using `object.method()`.                                       |
| Dynamic Behavior   | Properties can be added, modified, or deleted at runtime.                                                           |

**Note**: Understanding objects is fundamental to JavaScript; they are the primary building blocks of most JavaScript code, and the language itself is object-based (but not strictly class-based OOP). Primitives (string, number, boolean, etc.) are not objects—however, JavaScript can temporarily wrap them for method access.
