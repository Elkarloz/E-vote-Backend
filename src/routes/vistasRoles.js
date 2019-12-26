const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/agregar', async function(req, res){ //agregar nuevo 
const {VisRolEstado,VisRolSubCodigo,VisRolRolCodigo}=req.body;
   conexion.query('INSERT INTO tblvistasroles(VisRolEstado,VisRolSubCodigo,VisRolRolCodigo) VALUES(?,?,?)',
   [VisRolEstado,VisRolSubCodigo,VisRolRolCodigo],(err,result)=>{
      try {
         res.json({
            message: 'Agregado correctamente'
         })
      } catch (error) {
         res.status(500).json({
            message: 'Ocurrio un error'
         })
      }
   })
});


router.get('/consultar', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query('SELECT * FROM tblvistasroles',(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});


module.exports=router; // exportando las rutas