import React from 'react'; // Import React library
import { createRoot } from 'react-dom/client'; // Import createRoot for rendering (not used in this file)
import './PostCard.css'; // Import CSS for styling the PostCard component
import { useNavigate } from 'react-router-dom'; // Import useNavigate hook for navigation

// Define the PostCard component
const PostCard = ({ id, username, postText }) => {
  const navigate = useNavigate(); // Initialize the navigate function

  // Function to handle button click and navigate to the post's detail page
  const handleClick = () => {
    navigate(`/posts/${id}`); // Navigate to the post detail page using the post ID
  };

  return (
    <div className="post-card"> {/* Main container for the post card */}
      <div className="post-card-content"> {/* Content container */}
        <div className="post-card-title"> {/* Title container */}
          <span className="post-username">@ {username}</span> {/* Display the username */}
        </div>
        <p className="post-card-text"> {/* Display the post text */}
          {postText}
        </p>
      </div>
      <button onClick={handleClick}>Show More</button> {/* Button to navigate to post details */}
    </div>
  );
};

export default PostCard; // Export the PostCard component
