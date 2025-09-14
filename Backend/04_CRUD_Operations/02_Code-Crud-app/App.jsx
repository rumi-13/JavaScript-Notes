import {
  createBrowserRouter,
  createRoutesFromElements,
  RouterProvider,
  Route,
} from "react-router-dom";

import Layout from "./components/Layout";
import PostForm from "./components/PostForm";
import ShowPost from "./components/ShowPost";
import EditForm from "./components/EditForm";

// Main App component
export default function App() {
  // Define the router with routes
  const router = createBrowserRouter(
    createRoutesFromElements(
      <>
        {/* Root route */}
        <Route path="/" element={<Layout />} />

        {/* Posts routes */}
        <Route path="/posts" element={<Layout />} />
        <Route path="/posts/create" element={<PostForm />} />
        <Route path="/posts/:id" element={<ShowPost />} />
        <Route path="/posts/:id/edit" element={<EditForm />} />
      </>
    )
  );

  // Render the RouterProvider with the defined router
  return (
    <div className="app-container">
      <RouterProvider router={router} />
    </div>
  );
}
