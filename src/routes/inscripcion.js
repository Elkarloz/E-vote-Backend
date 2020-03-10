const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();


router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query('SELECT InsCodigo, InsFecha, InsEstado, InsProVotCodigo, PerDocumento, PerNombre, PerApellido FROM tblinscripcion INNER JOIN tblaspirante ON tblinscripcion.InsAspCodigo = tblaspirante.AspCodigo INNER JOIN tblpersona ON tblaspirante.AspPerCodigo =tblpersona.PerCodigo',(err,result)=>{
      try {
         res.json(result);
         console.log(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});


router.post('/:codigo', async function(req, res){ //agregar nuevo 
const {InsFecha,InsEstado,InsProVotCodigo,InsAspCodigo}=req.body;
   conexion.query('INSERT INTO tblinscripcion(InsFecha,InsEstado,InsProVotCodigo,InsAspCodigo) VALUES(?,?,?,?)',
   [InsFecha,InsEstado,InsProVotCodigo,InsAspCodigo],(err,result)=>{
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

router.get('/:codigo', async function(req,res){
   conexion.query('SELECT * FROM tblinscripcion WHERE tblinscripcion.InsCodigo = ?',[req.params.codigo],(err,result)=>{
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
   const {InsFecha,InsEstado,InsProVotCodigo,InsAspCodigo}=req.body;
   conexion.query('UPDATE tblinscripcion SET InsFecha = ?,InsEstado = ?,InsProVotCodigo = ?,InsAspCodigo = ? WHERE InsCodigo = ?',
   [InsFecha,InsEstado,InsProVotCodigo,InsAspCodigo,req.params.codigo],(err,result)=>{
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

   conexion.query('DELETE FROM tblinscripcion WHERE tblinscripcion.InsCodigo = ?',[req.params.codigo],(err,result)=>{
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