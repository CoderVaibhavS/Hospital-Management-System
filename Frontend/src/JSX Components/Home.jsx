import React from 'react'
import '../CSS Components/Home.css'
import Navbar from './Navbar'
import { Link } from 'react-router-dom'

export default function Home() {
  return (
    <div className='home'>
      <Navbar />
        <div className="options">
        <button type="button" className="btn btn-light"><Link to='/patient'>Add Patient</Link></button>
        <button type="button" className="btn btn-light"><Link to='/doctor'>Add Doctor</Link></button>
        <button type="button" className="btn btn-light"><Link to='/staff'>Add Staff</Link></button>
        </div>
    </div>
  )
}
