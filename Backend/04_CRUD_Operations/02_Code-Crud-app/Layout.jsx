import React from 'react'
import './Layout.css'
import PostCard from './PostCard'
import { useState } from 'react'
import axios from 'axios'
import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'

function Layout() {
    // State to store the posts data
    const [postData, setPostData] = useState([])

    // Hook to navigate programmatically
    const navigate = useNavigate()

    // Function to fetch posts from the API
    const handlePosts = async () => {
        try {
            // Make a GET request to fetch posts
            const response = await axios.get("/api/posts")
            // Update the state with the fetched data
            setPostData(response.data)
        } catch (error) {
            // Log any errors that occur during the fetch
            console.error("Error fetching posts:", error);
        }
    }

    // useEffect to fetch posts when the component mounts
    useEffect(() => {
        handlePosts();
    }, [])

    return (
        <>
            {/* Page title */}
            <h1>Post It ✍️</h1>

            {/* Button to navigate to the create post page */}
            <button onClick={() => { navigate('/posts/create') }}>Create New Post</button>

            {/* Container for the posts */}
            <div className="layout-container">
                {postData.length > 0 ? (
                    // Map through the posts and render a PostCard for each
                    postData.map((post, index) => (
                        <PostCard
                            key={post.id} // Use a unique ID as the key
                            id={post.id}
                            username={post.username}
                            postText={post.post}
                        />
                    ))
                ) : (
                    // Display a message if no posts are available
                    <p>Loading posts or no posts to display...</p>
                )}
            </div>
        </>
    );
}

export default Layout
