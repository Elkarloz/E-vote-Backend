const mysql = require('mysql');

module.exports = ()=>{
/*
        host:'localhost',
        user: 'root',
        password:'Jo.dussan',
        database:'prueba2'

        host:'198.71.225.53',
        user: 'evote',
        password:'evote123',
        database:'E-VOTE_pruebas'
*/
    return mysql.createConnection({
        
        host:'10.224.0.250',
        user: 'evote',
        password:'1234',
        database:'Evote'
    /*  host:'localhost',
        user: 'root',
        password:'Jo.dussan',
        database:'prueba2'¨*/
   
        
})
}