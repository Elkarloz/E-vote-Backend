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
<<<<<<< Updated upstream
        host:'localhost',
=======
        

        host:'localhost',
        user: 'root',
        password:'Jo.dussan',
        database:'evote'
    /*  host:'localhost',
>>>>>>> Stashed changes
        user: 'root',
        password:'',
        database:'evote'       
})
}