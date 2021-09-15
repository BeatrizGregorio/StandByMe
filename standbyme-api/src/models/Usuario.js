const { Model, DataTypes } = require('sequelize');

const bcrypt = require('bcrypt');

class Usuario extends Model {
    static init(sequelize){
        super.init( {
            nomeUsuario: DataTypes.STRING,
            sobrenomeUsuario: DataTypes.STRING,
            email: DataTypes.STRING,
            senha: DataTypes.STRING,
            telefone: DataTypes.STRING
        }, {
            sequelize
        })
        this.addHook('beforeSave', async client => {
            if (client.senha) {
              client.senha = await bcrypt.hash(client.senha, 8);
            }
          });
          return this;
    }
    
}

module.exports = Usuario;