const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/agregar', async function(req, res){ //agregar nuevo 
const {VotGenPeriodo,VotGenVotBlanco,VotGenTotal,VotGenEstado,VotGenProVotCodigo}=req.body;
   conexion.query('INSERT INTO tblvotaciongeneral(VotGenPeriodo,VotGenVotBlanco,VotGenTotal,VotGenEstado,VotGenProVotCodigo) VALUES(?,?,?,?,?)',
   [VotGenPeriodo,VotGenVotBlanco,VotGenTotal,VotGenEstado,VotGenProVotCodigo],(err,result)=>{
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
   conexion.query('SELECT * FROM tblvotaciongeneral',(err,result)=>{
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
   conexion.query('SELECT * FROM tblvotaciongeneral WHERE tblvotaciongeneral.VotGenCodigo = ?',[req.params.codigo],(err,result)=>{
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
   const {VotGenPeriodo,VotGenVotBlanco,VotGenTotal,VotGenEstado,VotGenProVotCodigo}=req.body;
   conexion.query('UPDATE tblvotaciongeneral SET VotGenPeriodo = ?,VotGenVotBlanco = ?,VotGenTotal = ?,VotGenEstado = ?,VotGenProVotCodigo = ? WHERE VotGenCodigo = ?',
   [VotGenPeriodo,VotGenVotBlanco,VotGenTotal,VotGenEstado,VotGenProVotCodigo,req.params.codigo],(err,result)=>{
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

   conexion.query('DELETE FROM tblvotaciongeneral WHERE tblvotaciongeneral.VotGenCodigo = ?',[req.params.codigo],(err,result)=>{
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