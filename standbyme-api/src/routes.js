const express = require('express');
const UsuarioController = require('./controllers/UsuarioController.js');

const routes = express.Router();

routes.post('/usuarios', UsuarioController.store);

routes.post('/usuarios/login', UsuarioController.login);

routes.get('/usuarios', UsuarioController.index)

module.exports = routes; 

