
const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());

app.post('/create-user', async(req, res, next)=>{
  const name = req.body.name;
  const lastName = req.body.lastName;
  const email = req.body.email;
  const password = req.body.password;
  const tel = req.body.tel;
  
  await db.query("INSERT INTO usuario (nomeUsuario, sobrenomeUsuario, emailUsuario, senhaUsuario, telefoneUsuario) VALUES (?);", [name], [lastName], [email], [password], [tel]);

  res.json({status:"OK"});
  next();
});
app.get('/usuario', async (req, res, next) => {

  const [rows] = await db.query("SELECT * FROM usuario;");

  res.json(rows);
  next();
});

async function main(){
    db = await mysql.createConnection({
        host:"localhost",
        user:"root",
        password:"senhaBancoMYSQL21",
        database:"tcc",
        timezone:"+00:00",
        charset:"utf8mb4_general_ci",
    });

    app.listen(8000);
}

main();