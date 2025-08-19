// index.js

// -----------------------------------------------------------
// 1. Module Imports and Application Initialization
// -----------------------------------------------------------

// Import the Express framework
const express = require('express');

// Initialize the Express application
const app = express();

// Set the port number for the server to listen on
const port = 8080;

// Use built-in middleware to parse incoming JSON payloads. 
// This is essential for handling POST requests with JSON data.
app.use(express.json());


// -----------------------------------------------------------
// 2. HTTP Route Handlers
// -----------------------------------------------------------

// A basic GET route for the root URL
// This will respond to a GET request to http://localhost:8080/
app.get('/', (req, res) => {
    res.send("Hello! This is the Home Path");
});

// A GET route for the '/help' path
// This will respond to a GET request to http://localhost:8080/help
app.get('/help', (req, res) => {
    res.send("Hello! This is the Help Path");
});

// A dynamic GET route with path parameters
// This route will match any URL with a username and an ID, like /john_doe/123
app.get('/:username/:id', (req, res) => {
    // Access the parameters from the req.params object using object destructuring
    let { username, id } = req.params;
    res.send(`Welcome ${username}! Your ID is: ${id}`);
});

// A POST route example
// This route will handle a POST request to http://localhost:8080/submit
// It expects a JSON body and uses the parsed data.
app.post('/submit', (req, res) => {
    // Access the data sent in the request body
    const { name, email } = req.body;
    // Log the received data to the console
    console.log(`Received submission from: ${name} with email: ${email}`);
    // Send a JSON response back to the client
    res.json({ message: "Data received successfully!" });
});


// -----------------------------------------------------------
// 3. Catch-all Route for 404 Not Found
// -----------------------------------------------------------

// This route uses the wildcard '*' to catch all undefined routes.
// It is crucial to place this at the very end of your routes.
// If a request does not match any of the above routes, this one will be executed.
app.get('*', (req, res) => {
    // Send a 404 status code and a message to the user.
    res.status(404).send('404 Not Found');
});


// -----------------------------------------------------------
// 4. Server Initialization
// -----------------------------------------------------------

// Start the server and make it listen for incoming requests on the specified port.
app.listen(port, () => {
    console.log(`Express server listening at http://localhost:${port}`);
});