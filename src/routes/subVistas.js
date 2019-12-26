const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/agregar', async function(req, res){ //agregar nuevo 
const {SubUrl,SubTitulo,SubEstado,SubVisCodigo}=req.body;
   conexion.query('INSERT INTO tblsubvistas(SubUrl,SubTitulo,SubEstado,SubVisCodigo) VALUES(?,?,?,?)',
   [SubUrl,SubTitulo,SubEstado,SubVisCodigo],(err,result)=>{
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
   conexion.query('SELECT * FROM tblsubvistas',(err,result)=>{
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
   conexion.query('SELECT * FROM tblsubvistas WHERE tblsubvistas.SubCodigo = ?',[req.params.codigo],(err,result)=>{
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
   const {SubUrl,SubTitulo,SubEstado,SubVisCodigo}=req.body;
   conexion.query('UPDATE tblsubvistas SET SubUrl = ?,SubTitulo = ?,SubEstado = ?,SubVisCodigo = ? WHERE SubCodigo = ?',
   [SubUrl,SubTitulo,SubEstado,SubVisCodigo,req.params.codigo],(err,result)=>{
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

   conexion.query('DELETE FROM tblsubvistas WHERE tblsubvistas.SubCodigo = ?',[req.params.codigo],(err,result)=>{
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