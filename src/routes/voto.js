const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.post('/agregar', async function(req, res){ //agregar nuevo 
const {VotFecha,VotEstado,VotEstCodigo,VotCanCodigo}=req.body;
   conexion.query('INSERT INTO tblvoto(VotFecha,VotEstado,VotEstCodigo,VotCanCodigo) VALUES(?,?,?,?)',
   [VotFecha,VotEstado,VotEstCodigo,VotCanCodigo],(err,result)=>{
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
   conexion.query('SELECT * FROM tblvoto',(err,result)=>{
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
   conexion.query('SELECT * FROM tblvoto WHERE tblvoto.VotCodigo = ?',[req.params.codigo],(err,result)=>{
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
   const {VotFecha,VotEstado,VotEstCodigo,VotCanCodigo}=req.body;
   conexion.query('UPDATE tblvoto SET VotFecha = ?,VotEstado = ?,VotEstCodigo = ?,VotCanCodigo = ? WHERE VotCodigo = ?',
   [VotFecha,VotEstado,VotEstCodigo,VotCanCodigo,req.params.codigo],(err,result)=>{
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

   conexion.query('DELETE FROM tblvoto WHERE tblvoto.VotCodigo = ?',[req.params.codigo],(err,result)=>{
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

router.get('/candidatos', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query("SELECT CONCAT(PerNombre,' ',PerApellido) Nombre,CanCodigo Codigo, CanNTarjeton Numero, CanEstado Estado FROM tblcandidato INNER JOIN tblestudiante on (EstCodigo=CanEstCodigo) INNER JOIN tblpersona on (PerCodigo=EstPerCodigo) ORDER BY CanNTarjeton ASC",(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.post('/Votar', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   const {numero,documento,tipo}=req.body;
   conexion.query('CALL Generar_voto(?,?,?)',
   [numero,documento,tipo],(err,result)=>{
      try {
         res.json({
            message: 'Voto Agregado correctamente'
         })
      } catch (err) {
         res.status(500).json({
            message: err,
          })
      }
   })
});

module.exports=router; // exportando las rutas