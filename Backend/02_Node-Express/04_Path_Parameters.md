# Path Parameters?

**Path parameters** are segments of a URL that are used to capture the values specified at their position in the URL. They're a core part of creating **dynamic routes**, allowing you to write a single route that can handle a wide range of similar URLs, each with a unique value. You define a path parameter in Express by placing a colon (`:`) before the parameter name in the route path.

-----

## How They Work

When a client makes a request to a route with path parameters, Express extracts the values from the URL and populates the **`req.params`** object. This object is a key-value pair where the key is the parameter name you defined (e.g., `username`, `id`) and the value is the data provided in the URL. This allows your route handler to easily access and use these values.

-----

## Code Illustration

Let's look at the code you provided:

```javascript
app.get('/:username/:id', (req, res)=>{
   let {username,id} = req.params;
   res.send(`Welcome ${username}! Your ID is: ${id}`);
})
```

  * **Route Definition**: The path `/:username/:id` tells Express to expect two path parameters.
  * **Request**: If a user navigates to a URL like `http://localhost:3000/john_doe/123`, Express will match this route.
  * **`req.params`**: Express will then create the `req.params` object:
    ```json
    {
      "username": "john_doe",
      "id": "123"
    }
    ```
  * **Destructuring**: The line `let {username,id} = req.params;` uses **object destructuring** to extract the `username` and `id` properties from the `req.params` object, making them easy to use as variables.
  * **Response**: Finally, the response will be "Welcome john\_doe\! Your ID is: 123", using the dynamic values captured from the URL.

This approach is highly effective for building RESTful APIs, where a single route like `/users/:id` can be used to fetch any specific user by their ID.