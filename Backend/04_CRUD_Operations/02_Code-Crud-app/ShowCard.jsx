import { useNavigate, useParams } from "react-router-dom";
import axios from "axios";
import "./showCard.css";

// ShowCard component displays a post card with options to edit or delete the post
const ShowCard = ({ id, username, postText }) => {
  const navigate = useNavigate();

  // Function to handle the edit button click
  const handleEdit = () => {
    // Navigate to the edit page with the post's id and pass the username and postText as state
    navigate(`/posts/${id}/edit`, { state: { username, postText } });
  };

  // Function to handle the delete button click
  const handleDelete = () => {
    console.log("deleting..");

    // Async function to delete the post
    const deletePost = async () => {
      // Send a DELETE request to the API to delete the post
      const response = await axios.delete(`/api/posts/${id}/delete`);
      console.log("Deleted Successfully..");
      // Navigate back to the posts list after deletion
      navigate("/posts");
    };

    deletePost();
  };

  return (
    <div className="post-card">
      <div className="post-card-content">
        {/* Display the username */}
        <div className="post-card-title">
          <span className="post-username">@ {username}</span>
        </div>
        {/* Display the post ID */}
        <span className="post-username">ID: {id}</span>
        {/* Display the post text */}
        <p className="post-card-text">{postText}</p>
      </div>

      {/* Button to edit the post */}
      <button onClick={handleEdit}>Edit Post</button>
      {/* Button to delete the post */}
      <button onClick={handleDelete}>Delete Post</button>
    </div>
  );
};

export default ShowCard;
