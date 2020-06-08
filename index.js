const dotenv = require('dotenv');
dotenv.config();
const connection = require('./conf');
const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT;

app.use(express.json());

app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use(cors());

// appel des photos disponible

app.get('/api/pics', (req, res) => {
  connection.query('SELECT * FROM base_pic', (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send('something bad happenned');
    } else {
      if (!results.length) {
        res.status(404).send('Pas de photos disponible');
      } else {
        res.status(200).json(results);
      }
    }
  });
});

// appel des memes enregistrés

app.get('/api/memes', (req, res) => {
  connection.query('SELECT * FROM meme', (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send('something bad happenned');
    } else {
      if (!results.length) {
        res.status(404).send('Pas de meme disponible');
      } else {
        res.status(200).json(results);
      }
    }
  });
});

// poster un meme

app.post('/api/memes', (req, res) => {
  const text = req.body;
  connection.query('INSERT INTO meme SET ?', [text], (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send('Problème lors de la sauvegarde');
    } else {
      res.status(200).send('Enregistrement effectué');
    }
  });
});

app.listen(port, (err) => {
  if (err) {
    throw new Error('Something bad happened...');
  }

  console.log(`Server is listening on ${port}`);
});
