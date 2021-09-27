module.exports = {
    dialect: 'postgres',
    dialectOptions: {
        options: {
            encrypt: false,
            validateBulkLoadParameters: true
        },
    },
    host: 'standbyme-db.ccdvu9dqr23y.us-east-2.rds.amazonaws.com',
    username: 'standbyme',
    password: 'standbymeTCC',
    database: 'postgres',
    define: {
        timestamps: false,
        freezeTableName: false,
    }
};