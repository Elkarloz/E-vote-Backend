const mysql = require('mysql');

module.exports = ()=>{
/*
        host:'localhost',
        user: 'root',
        password:'Jo.dussan',
        database:'prueba2'
*/
    return mysql.createConnection({
        host:'198.71.225.53',
        user: 'evote',
        password:'evote123',
        database:'E-VOTE_pruebas'

        
})
}