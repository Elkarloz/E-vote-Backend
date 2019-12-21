const mysql = require('mysql');

module.exports = ()=>{
return mysql.createConnection({
    host:'198.71.225.53',
    user: 'evote',
    password:'evote123',
    database:'E-VOTE_pruebas'
})
}