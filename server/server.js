const express = require('express');
const {Client} = require('pg');
const cors = require('cors');
require('dotenv').config({ path: '../client/.env' });


const app = express();
app.use(cors());
app.use(express.json());

const db = new Client({
    host: process.env.POSTGRES_HOST,
    port: Number(process.env.POSTGRES_PORT),
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DB,
});


const connectDb = async () => {
    try {
        await db.connect();
        console.log('Database connected');
    } catch (err) {
        console.error('Database connection error', err.stack);
    }
};

connectDb();

app.get('/days_of_week_name', (req, res)=>{
    const sql = "SELECT * FROM days_of_week_name"
    db.query(sql)
        .then(result => {
            return res.json(result.rows)
        }).catch(err => {
            console.error(err)
    })

})
app.get('/days' , (req, res) => {
    const sql = "SELECT * FROM days"
    db.query(sql)
        .then(result => {
            //console.log(result)
            return res.json(result.rows)
        }).catch(err => {
        console.log(err)
    })
})

app.get('/notes/', (req, res)=>{
const sql = "SELECT * FROM notes WHERE status != 'Deleted'"
    db.query(sql)
        .then(result => {
            //console.log(result)
            return res.json(result.rows)
        }).catch(err => {
            console.error(err)
    })
})

app.post('/notes/:month/:day', (req, res)=>{
    const {note} = req.body;
    const {day} = req.params;
    const {month} = req.params;
    const status = "InProgress";

    const sql = "INSERT INTO notes (notes, date, status) VALUES ($1, $2, $3) RETURNING *";

    const values = [note, "2025-" + month + "-" + day, status];

    db.query(sql, values)
        .then(result => {
            return res.status(200).json({
                message: 'Notes are added!',
                data: result.rows[0]
            });
        })
        .catch(err => {
            console.error(err)
            return res.status(500).json({ error: 'Error inserting note' });
        })

})

app.post('/notes', async (req, res)=>{
    const {isClickDeleteBut = [], doneNotes = [], inProgress= []} = req.body;

        try{
            const allRows = [];

            if(isClickDeleteBut.length){
                const checkedQuery = await db.query("UPDATE notes SET status = 'Deleted' WHERE id = ANY($1::int[]) RETURNING *", [isClickDeleteBut]);
                allRows.push(...checkedQuery.rows)
            }

            if(doneNotes.length){
                const doneQuery = await db.query("UPDATE notes SET status = 'Done' WHERE id = ANY($1::int[]) RETURNING *", [doneNotes]);
                allRows.push(...doneQuery.rows)
            }

            if(inProgress.length){
                const checkedQuery = await db.query("UPDATE notes SET status = 'inProgress' WHERE id = ANY($1::int[]) RETURNING *", [inProgress]);
                allRows.push(...checkedQuery.rows)
            }

            res.status(200).json({
                message: 'CHANGED!',
                data: allRows
            });
        } catch (err) {
            console.error(err)
            return res.status(500).send('Error change');
        }
})

app.get('/deleted', (req, res) => {
    const sql = "SELECT * FROM notes WHERE status = 'Deleted'"
    db.query(sql)
        .then(result => {
            //console.log(result)
            return res.json(result.rows)
        }).catch(err => {
        console.error(err)
    })
})


app.listen(1234, ()=>{
    console.log("Listen port: http://localhost:1234/")
})