const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());

const db = mysql.createConnection({
    host: "localhost",
    user: 'root',
    password: '1234',
    database: "hospital"
})

app.get('/', (req, res) => {
    const sql = `select * from staff`;
    db.query(sql, (err, data) => {
        if(err) return res.json(err);
        return res.json(data);
    })
})

app.post('/patient', async(req, res) => {
    const sql = `insert into patient (name, age, sex, phone) values (?)`;
    const values = [req.query.name, req.query.age, req.query.sex, req.query.phone];
    db.query(sql, [values], (err, data) => {
        if(err) return res.json(err);
        return res.json(data);
    })
})

app.post('/doctor', async(req, res) => {
    const sql = `insert into doctor (name, age, sex, specialisation, phone) values (?)`;
    const values = [req.query.name, req.query.age, req.query.sex, req.query.spec, req.query.phone];
    db.query(sql, [values], (err, data) => {
        if(err) return res.json(err);
        return res.json(data);
    })
})

app.post('/staff', async(req, res) => {
    const sql = `insert into staff (name, age, sex, phone, salary) values (?)`;
    const values = [req.query.name, req.query.age, req.query.sex, req.query.phone, req.query.salary];
    db.query(sql, [values], (err, data) => {
        if(err) return res.json(err);
        return res.json(data);
    })
})

app.listen(8081, () => {
    console.log("Listening");
})