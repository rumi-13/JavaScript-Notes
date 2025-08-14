# 1\. `FETCH` 

**`fetch()`** is a modern, promise-based JavaScript API for making network requests. It's used to retrieve resources (like JSON data or HTML) from a server. The `fetch()` function returns a **Promise**, which simplifies handling asynchronous operations.

The basic syntax involves calling `fetch()` with the URL you want to retrieve. The promise that's returned resolves with a **`Response`** object when the request is complete, even if it's an HTTP error (like a 404).

```javascript
fetch('https://api.example.com/data')
  .then(response => {
    // The promise resolves here, but we still need to check if the request was successful
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    // We can then process the response
    return response.json();
  })
  .then(data => {
    // This 'then' block gets the parsed JSON data
    console.log(data);
  })
  .catch(error => {
    // This 'catch' block handles any errors during the fetch or parsing process
    console.error('Fetch error:', error);
  });
```

-----

## 1.1\. Why Convert to JSON?

The `fetch()` API's `Response` object is a generic container for the response. It doesn't automatically parse the body of the response. The `response.json()` method is an asynchronous operation that reads the entire response body and parses it as **JSON**. It returns a **Promise** that resolves with the parsed JavaScript object. You must call this method to access the data sent from the server.

-----

# 2\. HTTP Basics: `GET` and `POST`

**HTTP (Hypertext Transfer Protocol)** is the foundation of data communication on the web. It defines a set of methods, or "verbs," for performing actions on a resource.

  * **`GET`**: Used to **request data** from a specified resource. It's a read-only operation and should not have any side effects on the server. `GET` requests can be cached and remain in the browser history.
  * **`POST`**: Used to **submit data** to a specified resource, often causing a change in state or a side effect on the server. For example, submitting a form or creating a new user account. `POST` requests are not cached and are not idempotent (meaning multiple identical requests may have different outcomes).

# 3\. Response Status Codes

**HTTP response status codes** are three-digit numbers returned by a server to indicate the status of an HTTP request. They are grouped into five classes:

  * **1xx (Informational):** The request has been received and the process is continuing.
  * **2xx (Success):** The request was successfully received, understood, and accepted.
      * `200 OK`: The request has succeeded.
      * `201 Created`: The request has been fulfilled and resulted in a new resource being created.
  * **3xx (Redirection):** Further action needs to be taken to complete the request.
      * `301 Moved Permanently`: The requested resource has been permanently moved to a new URL.
  * **4xx (Client Error):** The request contains bad syntax or cannot be fulfilled.
      * `400 Bad Request`: The server cannot or will not process the request due to a client error.
      * `401 Unauthorized`: The client must authenticate itself to get the requested response.
      * `404 Not Found`: The server cannot find the requested resource.
  * **5xx (Server Error):** The server failed to fulfill an apparently valid request.
      * `500 Internal Server Error`: The server encountered an unexpected condition that prevented it from fulfilling the request.