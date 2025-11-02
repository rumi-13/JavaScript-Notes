

# 🧾 Ownership Authorization in MERN Applications

### A Complete Guide to Restricting “Edit” and “Delete” Access to Listing Owners Only

---

## 📌 Overview

In multi-user MERN (MongoDB + Express + React + Node) applications, it’s common to have users create resources — such as listings, posts, or reviews.
However, a key security issue often arises:

> Any logged-in user can attempt to **edit or delete** resources they don’t own.

This guide provides a **complete end-to-end solution** to implement **ownership-based authorization**, ensuring that only the **creator (owner)** of a listing can modify or remove it.

---

## 🎯 Objective

The goal is to:

1. **Restrict Edit/Delete access** to only the owner of each listing.
2. **Hide or disable buttons** in the frontend for unauthorized users.
3. **Validate ownership** again on the backend (to prevent API tampering).

---

## ⚙️ Backend Implementation (Express + Passport Local Strategy)

### 1. `isLoggedIn` Middleware

Protects routes that require authentication.

```js
// middleware/isLoggedIn.js
function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }

  req.session.returnTo = req.originalUrl;
  return res.status(401).json({ message: "Login required" });
}

module.exports = { isLoggedIn };
```

This ensures only authenticated users can reach protected routes such as create, edit, or delete.

---

### 2. Route: Check Authentication Status

Create a dedicated endpoint to check if a user is logged in and retrieve their details.

```js
// routes/auth.js
router.get("/check-auth", (req, res) => {
  if (req.isAuthenticated()) {
    return res.status(200).json({
      authenticated: true,
      user: req.user, // includes _id, username, email, etc.
    });
  }

  return res.status(401).json({
    authenticated: false,
    user: null,
  });
});
```

The frontend will use this endpoint to know **who is logged in**.

---

### 3. Route: Delete Listing (with Ownership Check)

```js
// routes/listings.js
router.delete(
  "/delete/:id",
  isLoggedIn,
  asyncWrap(async (req, res) => {
    const { id } = req.params;
    const listing = await Listing.findById(id);

    if (!listing) return res.status(404).json({ message: "Listing not found" });

    // 🧠 Ownership check
    if (!listing.owner.equals(req.user._id)) {
      return res.status(403).json({ message: "Unauthorized" });
    }

    await Listing.findByIdAndDelete(id);
    res.status(200).json({ message: "Listing deleted successfully" });
  })
);
```

✅ This ensures that **even if someone manually sends a DELETE request via Postman**, they can only delete their own listings.

---

## 💻 Frontend Implementation (React)

### 1. Fetch Both Required Data

We need:

* The listing details (`/api/listings/:id`)
* The currently authenticated user (`/api/check-auth`)

```jsx
useEffect(() => {
  const fetchData = async () => {
    try {
      // 🟢 Fetch listing data
      const listResponse = await axios.get(`/api/listings/${id}`);
      setListData(listResponse.data);

      // 🟣 Fetch current user
      const authResponse = await axios.get("/api/check-auth", { withCredentials: true });
      setCurrentUser(authResponse.data.user);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  fetchData();
}, [id]);
```

---

### 2. Compare Ownership

Once both are available, determine ownership:

```jsx
const isOwner =
  listData?.owner?._id?.toString() === currentUser?._id?.toString();
```

---

### 3. Conditional Rendering of Buttons

Only show the **Edit** and **Delete** buttons if `isOwner` is true:

```jsx
{isOwner && (
  <div className="flex flex-col sm:flex-row gap-3 mt-4">
    <button
      onClick={() => navigate(`/home/listings/edit/${id}`)}
      className="bg-yellow-500 hover:bg-yellow-600 text-white font-semibold rounded-lg px-6 py-2 shadow-md"
    >
      Edit Details
    </button>

    <button
      onClick={handleDelete}
      className="bg-red-500 hover:bg-red-600 text-white font-semibold rounded-lg px-6 py-2 shadow-md"
    >
      Delete
    </button>
  </div>
)}
```

For all other users, the buttons won’t appear — creating a clean and secure UI.

---

## 🔐 Full Ownership Flow Summary

| Layer                                 | Responsibility                         | Example Code                                      |
| ------------------------------------- | -------------------------------------- | ------------------------------------------------- |
| 🧱 **Backend (Auth Middleware)**      | Verify user is logged in               | `isLoggedIn()`                                    |
| 🧱 **Backend (Ownership Validation)** | Verify logged-in user owns the listing | `listing.owner.equals(req.user._id)`              |
| 🖥️ **Frontend (Data Fetch)**         | Retrieve both listing + user           | `/api/listings/:id` + `/api/check-auth`           |
| ⚖️ **Frontend (Logic)**               | Compare IDs to determine ownership     | `isOwner = listing.owner._id === currentUser._id` |
| 🎨 **Frontend (UI)**                  | Show/hide buttons accordingly          | `{isOwner && <Buttons />}`                        |

---

## ✅ Security Benefits

1. **Defense in Depth** — both client-side and server-side verification.
2. **Prevents Unauthorized Modifications** — backend blocks non-owners.
3. **Improved UX** — non-owners never see misleading controls.
4. **Reusable Pattern** — works for blogs, products, reviews, etc.

---

## 💡 Pro Tip

If your app grows, consider extracting ownership logic into a **reusable authorization middleware**:

```js
function isOwner(model) {
  return async (req, res, next) => {
    const resource = await model.findById(req.params.id);
    if (!resource.owner.equals(req.user._id)) {
      return res.status(403).json({ message: "Unauthorized" });
    }
    next();
  };
}
```

Then apply it like:

```js
router.delete("/delete/:id", isLoggedIn, isOwner(Listing), async (req, res) => {
  await Listing.findByIdAndDelete(req.params.id);
  res.json({ message: "Deleted successfully" });
});
```

---

## 🏁 Conclusion

By combining **Express route protection**, **Passport.js authentication**, and **React-based UI conditional rendering**, we achieved a **secure and user-friendly authorization system**.

This pattern ensures that:

* Users can only modify **their own data**.
* The backend remains **tamper-proof**.
* The frontend reflects **accurate permissions**.

---

> 🔒 **In short:**
> “If you don’t own it — you can’t touch it.”

---

