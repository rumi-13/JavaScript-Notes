# Cookies in JavaScript

Cookies are small pieces of data that websites store directly in the user's browser. Unlike `localStorage` and `sessionStorage`, cookies are automatically sent to the server with every HTTP request, making them useful for server-side operations like authentication and user tracking.

# 1. What are Cookies?

Cookies are **key-value pairs** stored in the browser that:
- Have an **expiration date** (can be set to expire)
- Are **domain-specific** (only accessible to the domain that created them)
- Are **automatically sent** to the server with every request
- Have a **size limit** of about 4KB per cookie
- Allow a **maximum of ~300 cookies** total per domain

# 2. How Do Cookies Work?

**The Cookie Lifecycle:**

1. **Server sets cookie** → Browser stores it
2. **Browser automatically sends** cookie with every request to that domain  
3. **Server reads** the cookie data
4. **Cookie expires** or gets deleted

```javascript
// When you visit a website:
// 1. Server response includes: Set-Cookie: username=john; expires=Wed, 21 Oct 2025 07:28:00 GMT
// 2. Browser stores this cookie
// 3. Future requests automatically include: Cookie: username=john
```

# 3. Setting Cookies Using JavaScript

JavaScript provides the `document.cookie` property to work with cookies. However, it has a **quirky syntax** - you can't directly set cookies like objects.

## **A. Creating/Setting Cookies**

```javascript
// Basic syntax: document.cookie = "key=value";

// Simple cookie (expires when browser closes)
document.cookie = "username=john";

// Cookie with expiration date
document.cookie = "theme=dark; expires=Wed, 21 Oct 2025 07:28:00 GMT";

// Cookie with max-age (expires in 7 days)
document.cookie = "language=en; max-age=" + (7 * 24 * 60 * 60); // 7 days in seconds

// Cookie with path and domain
document.cookie = "sessionID=abc123; path=/; domain=.example.com";
```

## **B. Reading Cookies**

The tricky part: `document.cookie` returns **all cookies as one string**.

```javascript
// If you have: username=john; theme=dark; language=en
console.log(document.cookie); // "username=john; theme=dark; language=en"

// Helper function to get a specific cookie
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) {
        return parts.pop().split(';').shift();
    }
    return null;
}

// Usage
const username = getCookie('username'); // "john"
const theme = getCookie('theme');       // "dark"
```

## **C. Updating Cookies**

To update a cookie, simply set it again with the same name:

```javascript
// Update existing cookie
document.cookie = "username=jane"; // Updates username from "john" to "jane"
```

## **D. Deleting Cookies**

Set the cookie with a **past expiration date**:

```javascript
// Delete a cookie by setting past expiration
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";

// Helper function to delete cookies
function deleteCookie(name) {
    document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/`;
}

// Usage
deleteCookie('username');
```

## **E. Cookie Attributes**

| Attribute | Purpose | Example |
|-----------|---------|---------|
| `expires` | Set expiration date | `expires=Wed, 21 Oct 2025 07:28:00 GMT` |
| `max-age` | Set expiration in seconds | `max-age=3600` (1 hour) |
| `path` | Restrict to specific path | `path=/admin` |
| `domain` | Restrict to specific domain | `domain=.example.com` |
| `secure` | Only send over HTTPS | `secure` |
| `httpOnly` | Only accessible via HTTP (not JS) | `httpOnly` |

```javascript
// Cookie with multiple attributes
document.cookie = "userToken=xyz789; max-age=86400; path=/; secure; SameSite=Strict";
```

# **Key Differences: Cookies vs Web Storage**

| Feature | Cookies | localStorage/sessionStorage |
|---------|---------|---------------------------|
| **Size Limit** | ~4KB | ~5-10MB |
| **Server Access** | ✅ Sent automatically | ❌ Client-side only |
| **Expiration** | ✅ Can set custom | localStorage: never, sessionStorage: tab close |
| **Syntax** | 😤 Quirky string format | 😊 Simple key-value methods |

**When to Use Cookies:**
- User authentication tokens
- Server-side session management  
- Cross-request data that the server needs

**Key Takeaway:** Cookies are great for server communication but have a clunky JavaScript API. Use them when you need server access; otherwise, stick with `localStorage`/`sessionStorage` for pure client-side storage.