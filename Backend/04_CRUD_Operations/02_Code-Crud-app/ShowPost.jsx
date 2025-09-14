import React, { useEffect, useState } from "react";
import "./ShowPost.css";
import axios from "axios";
import ShowCard from './ShowCard'
import { useParams } from "react-router-dom";

function ShowPost() {
  // State to store the post details
  const [idPost, setIdPost] = useState({
    id: '',
    username: '',
    post: ''
  });

  // Extracting the `id` parameter from the URL
  let { id } = useParams();

  // Function to fetch the post data from the API
  let getPost = async () => {
    console.log("fetching..");
    console.log(id);
    
    // Making an API call to fetch the post data
    let response = await axios.get(`/api/posts/${id}`);
    console.log(response);
    
    // Updating the state with the fetched data
    setIdPost({
      id: response.data.id,
      username: response.data.username,
      post: response.data.post,
    });
  };

  // useEffect to fetch the post data when the component mounts or `idPost.id` changes
  useEffect(() => {
    getPost();
  }, [idPost.id]);

  // Rendering the ShowCard component with the fetched post data
  return <ShowCard id={idPost.id} username={idPost.username} postText={idPost.post}></ShowCard>;
}

export default ShowPost;
