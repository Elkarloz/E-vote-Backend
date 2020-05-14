const mysql = require('mysql');

module.exports = ()=>{
/*
        host:'localhost',
        user: 'root',
        password:'Jo.dussan',
        database:'prueba2'

        host:'10.224.0.250',
        user: 'evote',
        password:'1234',
        database:'Evote''
*/
    return mysql.createConnection({
        host:'localhost',
        user: 'root',
        password:'',
        database:'evote'       
})
}