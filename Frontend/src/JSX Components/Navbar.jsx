import React from 'react'
import { Link, BrowserRouter as Router } from 'react-router-dom'

export default function Navbar() {
    return (
        <nav className="navbar navbar-expand-lg bg-body-tertiary">
            <div className="container-fluid">
                <Link className="navbar-brand" to="/">Hospital Management System</Link>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div className="navbar-nav">
                        <Link className="nav-link" aria-current="page" to="/">Home</Link>
                        <a className="nav-link" href="#">Appointment</a>
                        <a className="nav-link" href="#">Bill</a>
                        <a className="nav-link" href="#">Admin</a>
                    </div>
                </div>
            </div>
        </nav>
    )
}
