const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/agregar', async function(req, res){ //agregar nuevo 
const {HueCaracter1,HueCaracter2,HueCaracter3,HueCaracter4,HueCaracter5,HueEstado}=req.body;
   conexion.query('INSERT INTO tblhuella(HueCaracter1,HueCaracter2,HueCaracter3,HueCaracter4,HueCaracter5,HueEstado) VALUES(?,?,?,?,?,?)',
   [HueCaracter1,HueCaracter2,HueCaracter3,HueCaracter4,HueCaracter5,HueEstado],(err,result)=>{
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
   conexion.query('SELECT * FROM tblhuella',(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.get('/consultar/:codigo', async function(req,res){
   conexion.query('SELECT * FROM tblhuella WHERE tblhuella.HueCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.put('/actualizar/:codigo', async function(req, res){
   const {HueCaracter1,HueCaracter2,HueCaracter3,HueCaracter4,HueCaracter5,HueEstado}=req.body;
   conexion.query('UPDATE tblhuella SET HueCaracter1 = ?,HueCaracter2 = ?,HueCaracter3 = ?,HueCaracter4 = ?,HueCaracter5 = ? WHERE HueCodigo = ?',
   [HueCaracter1,HueCaracter2,HueCaracter3,HueCaracter4,HueCaracter5,HueEstado,req.params.codigo],(err,result)=>{
      try {
         res.json({
            message: ' Actualizado satisfactoriamente',
            Method: 'PUT',
            Status: 'Actualizado'
             });
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.delete('/eliminar/:codigo', async function(req, res){

   conexion.query('DELETE FROM tblhuella WHERE tblhuella.HueCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json({
            message: 'Eliminado satisfactoriamente',
            Method: 'PUT',
            Status: 'Actualizado'
             });
      } catch (error) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })

});

module.exports=router; // exportando las rutas