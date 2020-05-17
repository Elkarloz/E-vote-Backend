const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();

router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query('SELECT EstCodigo, PerDocumento, PerNombre, PerApellido, EstFicha, JorNombre, ProforNombre  FROM tblestudiante INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo where EstFicha !=0 ORDER BY EstCodigo ASC',(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
         })
      }
   })
 });

//Consulta para todos los comboBox
router.get('/comboBox1', async function(req,res){
   conexion.query('SELECT ProforCodigo, ProforNombre FROM tblprogramaformacion',(err,result)=>{
     if (err) {
         res.status(500).json({
             message: 'Ocurrio un error',
           })
       }else{
         res.status(200).json(result); 
       }
     })
});

//Consulta para todos los comboBox
router.get('/comboBox2', async function(req,res){
   conexion.query('SELECT JorCodigo, JorNombre FROM tbljornada',(err,result)=>{
     if (err) {
         res.status(500).json({
             message: 'Ocurrio un error',
           })
       }else{
         res.status(200).json(result); 
       }
     })
});

router.get('/comboBox3', async function(req,res){
   conexion.query('SELECT TipdocCodigo,TipdocNombre FROM tbltipodocumento',(err,result)=>{
     if (err) {
         res.status(500).json({
             message: 'Ocurrio un error',
           })
       }else{
         res.status(200).json(result);
       }
     })
 });
router.get('/:codigo', async function(req,res){
   conexion.query('SELECT EstCodigo, PerDocumento, PerNombre, PerApellido, EstFicha, JorNombre, ProforNombre  FROM tblestudiante INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo WHERE tblestudiante.EstCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});
// verificar si ya voto
router.post('/verificar', async function(req,res){
      console.log(req.body)
        const {doc}=req.body;
        conexion.query('call verificarsivoto (?)',
        [doc],
        (err,result)=>{
            if (err) {
                 res.status(500).json({
                    message: 'Ocurrio un error',
                  })
              }else{    
                res.status(200).json(result[0])
              }
        })
    
});

router.delete('/:codigo', async function(req, res){
   conexion.query('DELETE FROM tblestudiante WHERE tblestudiante.EstCodigo = ?',[req.params.codigo],(err,result)=>{
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

///buscar x parametros
router.get('/:DocPer/:NomPer/:ApePer/:Ficha/:Jornada/:Programa', async function(req,res){
   conexion.query("SELECT EstCodigo, PerDocumento, PerNombre, PerApellido, EstFicha, JorNombre, ProforNombre  FROM tblestudiante INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo WHERE tblpersona.PerDocumento = '"+req.params.DocPer+"' OR tblpersona.PerNombre like '%"+req.params.NomPer+"%' OR tblpersona.PerApellido like '%"+req.params.ApePer+"%' OR tblestudiante.EstFicha like '%"+req.params.Ficha+"%'  OR tbljornada.JorNombre like '%"+req.params.Jornada+"%' OR tblprogramaformacion.ProForNombre like '%"+req.params.Programa+"%' ",
   [req.params.DocPer],(err,result)=>{
      try {
         res.json(result);
         // console.log(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
 });
module.exports=router; // exportando las rutas