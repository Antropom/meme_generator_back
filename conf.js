const mysql = require('mysql');
const connection = mysql.createConnection({
  host: process.env.DB_HOST, // adresse du serveur
  user: process.env.DB_USERNAME, // le nom d'utilisateur
  password: process.env.DB_PASSWORD, // le mot de passe
  database: process.env.DB_NAME, // le nom de la base de données
});
module.exports = connection;
