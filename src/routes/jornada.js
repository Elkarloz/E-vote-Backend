const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/agregar', async function(req, res){ 
const {JorNombre,JorEstado}=req.body;
   conexion.query('INSERT INTO tbljornada(JorNombre,JorEstado) VALUES(?,?)',
   [JorNombre,JorEstado],(err,result)=>{
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
   conexion.query('SELECT * FROM tbljornada',(err,result)=>{
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
   conexion.query('SELECT * FROM tbljornada WHERE tbljornada.JorCodigo = ?',[req.params.codigo],(err,result)=>{
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
   const {JorNombre,JorEstado}=req.body;
   conexion.query('UPDATE tbljornada SET JorNombre = ?,JorEstado = ? WHERE JorCodigo = ?',
   [JorNombre,JorEstado,req.params.codigo],(err,result)=>{
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

   conexion.query('DELETE FROM tbljornada WHERE tbljornada.JorCodigo = ?',[req.params.codigo],(err,result)=>{
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