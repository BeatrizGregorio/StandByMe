const Usuario = require('../models/Usuario');
const bcrypt = require('bcrypt');

module.exports = {
    async store(req, res) {
        console.log(req.body);
        const {nomeUsuario, sobrenomeUsuario, email, senha, telefone} = req.body;
    
        const isEmailExistente = await Usuario.findAll({ where: {email:email}});
        if(isEmailExistente.length > 0)
            return res.status(401).json({error:'Você ja possui uma conta!'});
        const usuario = await Usuario.create({ nomeUsuario, sobrenomeUsuario, email, senha, telefone});

        return res.status(200).json(usuario);
    },

    async login(req, res) {
        const {email, senha} = req.body;
        const usuarioDesejado = await Usuario.findAll({where: {email:email}});

        if(usuarioDesejado.length == 0)
            return res.status(401).json({error:'Email ou senha incorretos!'});
        
        await bcrypt.compare(senha, usuarioDesejado[0].senha).then(result => {
        if(!result)
            return res
            .status(401)
            .json({error:'Email ou senha incorretos.'});
        
        return res.status(200).json(usuarioDesejado[0]);
    })
    },

    async index(req, res){
        const usuarios = await Usuario.findAll();
        return res.json(usuarios);
    }
}
