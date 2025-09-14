import React, { useState } from 'react';
import './postForm.css';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

/**
 * PostForm Component
 * 
 * This component renders a form that allows users to create a new post. 
 * It includes fields for entering a username and the post content. 
 * Upon submission, the form sends the data to the server and navigates to the posts page.
 * 
 * @component
 * 
 * @returns {JSX.Element} The rendered PostForm component.
 * 
 * @example
 * <PostForm />
 * 
 * @function
 * @name PostForm
 * 
 * @description
 * - Manages form state using the `useState` hook.
 * - Handles input changes with the `handleChange` function.
 * - Submits the form data to the server via an API call in the `handleSubmit` function.
 * - Navigates to the posts page upon successful submission.
 * 
 * @dependencies
 * - `useNavigate` from `react-router-dom` for navigation.
 * - `useState` from `react` for state management.
 * - `axios` for making HTTP requests.
 * 
 * @throws {Error} Logs an error to the console if the API call fails.
 */
function PostForm() {
    const navigate = useNavigate()
  const [postData, setPostData] = useState(
    {
        username: "",
        post: " ",
    }
  )
  const handleChange = (e) =>{
    setPostData(
       {
         ...postData,
        [e.target.name] : e.target.value,
       }
    );
  }
  const handleSubmit = async (e) =>{
    e.preventDefault();

    try {
        console.log("Sending...");
        
        const response = await axios.post('/api/posts/create', postData);
        console.log("Post created, navigating...");
        navigate("/posts")
        console.log("Navigation Failed..");
        
    } catch (error) {
        console.error("Error raised! ", error)
    }
  }
  return (
    <form className="post-form" onSubmit={handleSubmit} >
      <h2>Create a Post</h2>

      <label htmlFor="username">Username</label>
      <input
        type="text"
        name = "username"
        id="username"
        required
        placeholder="Enter your username"
        value={postData.username}
        onChange={handleChange}
      />

      <label htmlFor="post">Post</label>
      <textarea
        id="post"
        name= "post"
        required
        placeholder="What's on your mind?"
        value={postData.post}
        onChange={handleChange}
      ></textarea>

      <button type="submit">Submit</button>
    </form>
  );
}

export default PostForm;
