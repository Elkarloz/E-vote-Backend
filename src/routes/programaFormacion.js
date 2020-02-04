const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/', async function(req, res){ 
const {ProforNombre,ProforEstado}=req.body;
   conexion.query('INSERT INTO tblprogramaformacion(ProforNombre,ProforEstado) VALUES(?,?)',
   [ProforNombre,ProforEstado],(err,result)=>{
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


router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query('SELECT * FROM tblprogramaformacion',(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.get('/:codigo', async function(req,res){
   conexion.query('SELECT * FROM tblprogramaformacion WHERE tblprogramaformacion.ProforCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.put('/:codigo', async function(req, res){
   const {ProforNombre,ProforEstado}=req.body;
   conexion.query('UPDATE tblprogramaformacion SET ProforNombre = ?,ProforEstado = ? WHERE ProforCodigo = ?',
   [ProforNombre,ProforEstado,req.params.codigo],(err,result)=>{
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

router.delete('/:codigo', async function(req, res){

   conexion.query('DELETE FROM tblprogramaformacion WHERE tblprogramaformacion.ProforCodigo = ?',[req.params.codigo],(err,result)=>{
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