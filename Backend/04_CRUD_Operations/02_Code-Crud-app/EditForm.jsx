import React from "react";
import './editForm.css'; // Importing the CSS file for styling
import { useLocation, useNavigate, useParams } from "react-router-dom"; // Importing hooks from react-router-dom
import { useState } from "react"; // Importing useState hook for state management
import axios from "axios"; // Importing axios for making HTTP requests

function EditForm() {
  // Using hooks to get location, navigation, and route parameters
  const location = useLocation();
  const { username, postText } = location.state || {}; // Destructuring state passed via location
  const [post, setPost] = useState(postText || ""); // Initializing state for the post text
  const { id } = useParams(); // Getting the post ID from the route parameters
  const navigate = useNavigate(); // Hook for programmatic navigation

  // Handler for textarea value change
  const handleChange = (e) => {
    setPost(e.target.value); // Updating the state with the new value
  };

  // Handler for form submission
  const handleSubmit = (e) => {
    e.preventDefault(); // Preventing the default form submission behavior

    // Function to update the post
    const updatePost = async () => {
      const response = await axios.patch(`/api/posts/${id}/edit`, { post }); // Sending a PATCH request to update the post
      //console.log("updated successfully");
      navigate('/posts'); // Navigating to the posts page after successful update
    };

    updatePost(); // Calling the updatePost function
  };

  return (
    <div className="form-container">
      <h1>Edit Form</h1>
      <form onSubmit={handleSubmit}>
        <h1>Username: {username} </h1> {/* Displaying the username */}

        <label htmlFor="post"></label>
        <textarea
          id="post"
          name="post"
          required
          value={post} // Binding the textarea value to the state
          onChange={handleChange} // Handling changes in the textarea
        ></textarea>

        <button type="submit">Submit</button> {/* Submit button */}
      </form>
    </div>
  );
}

export default EditForm; // Exporting the component
