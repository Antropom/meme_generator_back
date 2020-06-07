const dotenv = require('dotenv');
const express = require('express');
const app = express();
const port = 3000;


app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

// appel des photos disponible

app.get('/api/pics', (req, res) => {
    connection.query('SELECT * FROM ', (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send('something bad happenned')
        } else {
            if (!results.length) {
                res.status(404).send('Pas de photos disponible')
            } else {
                res.status(200).json(results);
            }
        }
    })
})

// appel des memes enregistrés

app.get('/api/meme', (req, res) => {
    connection.query('SELECT * FROM meme', (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send('something bad happenned')
        } else {
            if (!results.length) {
                res.status(404).send('Pas de meme disponible')
            } else {
                res.status(200).json(results);
            }
        }
    })
})

// poster un meme

app.post('/api/meme', (req, res) => {
    const text = req.body;
    connection.query('INSERT INTO meme SET ?', [text], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send('Problème lors de la sauvegarde')
        } else {
            res.status(200).send('enregistrement effectué')
        }
    })
})

app.listen(port, (err) => {
    if (err) {
        throw new Error('Something bad happened...');
    }

    console.log(`Server is listening on ${port}`);
});
