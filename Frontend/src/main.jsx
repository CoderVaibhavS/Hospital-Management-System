import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import './index.css'
import Patient from './JSX Components/Patient';
import Doctor from './JSX Components/Doctor';
import Staff from './JSX Components/Staff';

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
  {
    path: "/patient",
    element: <Patient />,
  },
  {
    path: "/doctor",
    element: <Doctor />,
  },
  {
    path: "/staff",
    element: <Staff />,
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
