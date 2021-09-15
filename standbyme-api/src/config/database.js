module.exports = {
    dialect: 'mssql',
    dialectOptions: {
        options: {
            encrypt: false,
            validateBulkLoadParameters: true
        },
    },
    host: 'regulus.cotuca.unicamp.br',
    username: 'BD19183',
    password: 'juliakimura03',
    database: 'BD19183',
    define: {
        timestamps: true,
        
    }
};