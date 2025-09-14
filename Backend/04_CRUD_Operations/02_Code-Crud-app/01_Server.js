const express = require("express");
const cors = require("cors"); // Import CORS middleware
const app = express();
const port = 8080;
const { v4: uuidv4 } = require("uuid");

// Middleware to parse JSON and URL-encoded data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); // Enable CORS for all routes

// In-memory array to store post data
let postData = [
  {
    id: uuidv4(),
    username: " Tom",
    post: "I Love Coding!",
  },
  {
    id: uuidv4(),
    username: " Henry ",
    post: "I Love Cooking!",
  },
  {
    id: uuidv4(),
    username: " Smith ",
    post: "I Love Driving!",
  },
  {
    id: uuidv4(),
    username: " Jerry ",
    post: "I Love Cricket!",
  },
];

// Get all posts
app.get("/api/posts", (req, res) => {
  res.send(postData);
});

// Create a new post
app.post("/api/posts/create", (req, res) => {
  const { username, post } = req.body;
  const id = uuidv4();
  postData.push({ id, username, post });
  res.json({ success: true });
});

// Get a single post by ID
app.get("/api/posts/:id", (req, res) => {
  const { id } = req.params;
  const post = postData.find((p) => p.id === id);
  res.send(post);
});

// Edit a post by ID
app.patch("/api/posts/:id/edit", (req, res) => {
  const { id } = req.params;
  const { post } = req.body;
  const postItem = postData.find((p) => p.id === id);
  postItem.post = post;
  res.json({ success: true });
});

// Delete a post by ID
app.delete("/api/posts/:id/delete", (req, res) => {
  const { id } = req.params;
  postData = postData.filter((p) => p.id !== id);
  res.json({ success: true });
});

// Start the server
app.listen(port, () => {
  console.log(`Listening at port: ${port}`);
});
