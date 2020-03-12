const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();


router.post('/', async function(req, res){
    console.log(req.body); 
    const {Documento,Usuario,Contraseña}=req.body;
       conexion.query('Call crear_usuario(?,?,?)',
       [Usuario,Contraseña,Documento],(err,result)=>{
          try {
            res.status(200).json(result[0])
          } catch (error) {
             res.status(500).json({
                message: err
             })
          }
       })
    });
    module.exports=router; // exportando las rutas