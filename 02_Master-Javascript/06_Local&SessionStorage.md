# Web Storage: `localStorage` and `sessionStorage`

Web storage allows you to save key-value pairs locally within the user's browser. This is useful for remembering user preferences, keeping a user logged in, or saving application state on the client-side without needing a server. There are two types: `localStorage` and `sessionStorage`.

# 1. Local Storage

`localStorage` is a web storage mechanism that allows you to save data that persists even after the browser window is closed. The data has no expiration date and will remain until it is explicitly cleared by the user or web application.

## How to Use `localStorage`

The `localStorage` object is available globally on the `window` object. Data is stored as strings in key-value pairs.

**A. Store Data**

Use the `setItem()` method to add a key-value pair. If the key already exists, `setItem()` will update its value.

```javascript
// Syntax: localStorage.setItem('key', 'value');

localStorage.setItem('username', 'JohnDoe');
localStorage.setItem('theme', 'dark');

// Storing an object (requires converting to a string)
const userProfile = { id: 123, is_verified: true };
localStorage.setItem('profile', JSON.stringify(userProfile));
```

**B. Fetch (Get) Data**

Use `getItem()` to retrieve the value associated with a key. It returns `null` if the key doesn't exist.

```javascript
// Syntax: localStorage.getItem('key');

const username = localStorage.getItem('username'); // "JohnDoe"
const theme = localStorage.getItem('theme');       // "dark"

// Retrieving and parsing an object
const profileString = localStorage.getItem('profile');
const userProfile = JSON.parse(profileString); // { id: 123, is_verified: true }
```

**C. Remove a Specific Item**

Use `removeItem()` to delete a single key-value pair.

```javascript
// Syntax: localStorage.removeItem('key');

localStorage.removeItem('theme'); // Removes the 'theme' item
```

**D. Clear All Data**

Use `clear()` to remove all key-value pairs from `localStorage` for that domain.

```javascript
// Syntax: localStorage.clear();

localStorage.clear(); // Deletes everything in localStorage
```
Of course. Here are the notes on handling objects and arrays in Web Storage.

## Handling Objects & Arrays in Web Storage

A crucial aspect of `localStorage` and `sessionStorage` is that they can **only store data as strings**. If you try to store a complex data type like an object or an array directly, JavaScript will automatically convert it into a string, which often leads to data loss.

# Why it stores Strings only?
Because the developers of localStroage made it for storing strings only.

### The Problem: Storing Objects/Arrays Directly

When you use `setItem()` with a non-string value, it calls the `toString()` method on it. For objects and arrays, this results in unhelpful strings like `"[object Object]"` or a simple comma-separated list.

```javascript
const userProfile = { name: 'Alex', level: 99 };
const userSkills = ['JavaScript', 'HTML', 'CSS'];

// Storing them directly (The wrong way)
localStorage.setItem('profile', userProfile);
localStorage.setItem('skills', userSkills);

// Retrieving the data
const profile = localStorage.getItem('profile'); // Returns "[object Object]"
const skills = localStorage.getItem('skills');   // Returns "JavaScript,HTML,CSS"

console.log(profile); // You can't access profile.name
console.log(skills[0]); // Returns "J", not "JavaScript"
```
As you can see, the original data structure is lost.

### The Solution: `JSON.stringify` and `JSON.parse`

To correctly store and retrieve objects or arrays, you need to serialize and deserialize them using the global `JSON` object.

1.  **`JSON.stringify()`**: Converts a JavaScript object or array into a JSON string representation. You use this *before* storing the data.
2.  **`JSON.parse()`**: Converts a JSON string back into a JavaScript object or array. You use this *after* retrieving the data.

This two-step process ensures your data structure is preserved perfectly.

```javascript
const userProfile = { name: 'Alex', level: 99 };
const userSkills = ['JavaScript', 'HTML', 'CSS'];

// 1. Stringify before storing
localStorage.setItem('profileData', JSON.stringify(userProfile));
localStorage.setItem('skillData', JSON.stringify(userSkills));

// 2. Retrieve and parse
const retrievedProfileString = localStorage.getItem('profileData');
const retrievedProfile = JSON.parse(retrievedProfileString);

const retrievedSkillsString = localStorage.getItem('skillData');
const retrievedSkills = JSON.parse(retrievedSkillsString);

// Now the data is in its original format
console.log(retrievedProfile.name); // "Alex"
console.log(retrievedSkills[0]);    // "JavaScript"
```

**Key Takeaway:** Always use `JSON.stringify()` when saving objects/arrays to web storage and `JSON.parse()` when reading them back. This applies to both `localStorage` and `sessionStorage`.


# 2. Session Storage

`sessionStorage` is nearly identical to `localStorage` but has a different lifespan. Data stored in `sessionStorage` is cleared as soon as the page session ends—that is, when the browser tab is closed.

#### How to Use `sessionStorage`

The methods are exactly the same as `localStorage`.

**A. Store Data**

```javascript
// Syntax: sessionStorage.setItem('key', 'value');

sessionStorage.setItem('sessionID', 'xyz-789');
```

**B. Fetch (Get) Data**

```javascript
// Syntax: sessionStorage.getItem('key');

const sessionID = sessionStorage.getItem('sessionID'); // "xyz-789"
```

**C. Remove a Specific Item**

```javascript
// Syntax: sessionStorage.removeItem('key');

sessionStorage.removeItem('sessionID');
```

**D. Clear All Data**

```javascript
// Syntax: sessionStorage.clear();

sessionStorage.clear(); // Deletes everything in the current session's storage
```

# 3. Local Storage vs. Session Storage

Here’s a quick comparison to help you decide which one to use.

| Feature         | `localStorage`                                              | `sessionStorage`                                             |
|-----------------|-------------------------------------------------------------|--------------------------------------------------------------|
| **Lifespan**    | Persistent. Data remains until explicitly cleared.          | Session-based. Data is cleared when the tab is closed.       |
| **Scope**       | Shared across all tabs and windows from the same origin.    | Scoped to a single browser tab or window.                    |
| **Use Cases**   | - User preferences (e.g., theme) - "Remember me" functionality - JWT tokens for persistent login | - Data for a single-session form - State for a multi-step process (like a checkout) - Storing data you don't want to persist between visits |
| **Clearing**    | Manually via `localStorage.clear()` or browser settings.    | Automatically on tab close or manually via `sessionStorage.clear()`. |

**Key Takeaway:**

*   Use **`localStorage`** when you need data to be available for a long time and across different browser sessions.
*   Use **`sessionStorage`** for temporary data that should be discarded after the user finishes their current task or closes the tab.