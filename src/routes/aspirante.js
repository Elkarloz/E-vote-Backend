const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();


///buscar x parametros
router.get('/:DocPer/:NomPer/:ApePer/:Ficha/:Jornada/:Programa', async function(req,res){
   conexion.query('SELECT AspCodigo,AspEstado,PerDocumento,PerNombre,PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo WHERE tblpersona.PerDocumento = ? OR tblpersona.PerNombre = ? OR tblpersona.PerApellido = ? OR tblestudiante.EstFicha = ? OR tbljornada.JorNombre = ? OR tblprogramaformacion.ProforNombre = ?',
   [req.params.DocPer,req.params.NomPer,req.params.ApePer,req.params.Ficha,req.params.Jornada,req.params.Programa],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   }) 
});
//consultar todos los aspirantes
router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query('SELECT AspCodigo, AspEstado, PerDocumento, PerNombre, PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE AspEstado = "Activo"',(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

//consultar por codigo aspirantes
router.get('/:codigo', async function(req,res){
   conexion.query('SELECT AspCodigo,AspEstado,PerDocumento,PerNombre,PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo WHERE AspCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});
// agregar aspirante
router.put('/:codigo', async function(req, res){
   const {AspDoc1,AspDoc2,AspEstado,AspFormPost,AspPerCodigo}=req.body;
   conexion.query('UPDATE tblaspirante SET AspDoc1 = ?,AspDoc2 = ?,AspEstado = ?,AspFormPost = ?,AspPerCodigo = ? WHERE AspCodigo = ?',
   [AspDoc1,AspDoc2,AspEstado,AspFormPost,AspPerCodigo,req.params.codigo],(err,result)=>{
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
// eliminar aspirante
router.delete('/:codigo', async function(req, res){

   conexion.query('DELETE FROM tblaspirante WHERE tblaspirante.AspCodigo = ?',[req.params.codigo],(err,result)=>{
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
//agregar nuevo aspirante
router.post('/', async function(req, res){ 
   const {AspFormPost,AspDoc1,AspDoc2,AspEstado,AspPerCodigo}=req.body;
      conexion.query('INSERT INTO tblaspirante(AspFormPost,AspDoc1,AspDoc2,AspEstado,AspPerCodigo) VALUES(?,?,?,?,?)',
      [AspFormPost,AspDoc1,AspDoc2,AspEstado,AspPerCodigo],(err,result)=>{
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
// validar aspirante a candidato
router.post('/validar', async function(req,res){
   const {CanNTarjeton,PerDocumento}=req.body;
   conexion.query('CALL Validar_candidato(?,?)',
   [CanNTarjeton,PerDocumento],(err,result)=>{

   try {
      res.status(200).json({
         message: 'Validado correctamente',
         Method: 'POST',
         Status: 'Actualizado' 
      })
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
   })
});

module.exports=router; // exportando las rutas