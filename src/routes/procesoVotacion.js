const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();

router.get('/consultar', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query('SELECT * FROM tblprocesovotacion',(err,result)=>{
       try {
          res.json(result);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
 });

router.post('/agregar', async function(req, res){
    const {ProVotInicio,ProVotFin,ProVotRegEstInicio,ProVotRegEstFin,ProVotValAspInicio,ProVotValAspFin,ProVotRegPropInicio,ProVotRegPropFin,ProVotFechaJornada,ProVotEstado,ProVotAdmCodigo}=req.body;
       conexion.query('INSERT INTO tblprocesovotacion(ProVotInicio,ProVotFin,ProVotRegEstInicio,ProVotRegEstFin,ProVotValAspInicio,ProVotValAspFin,ProVotRegPropInicio,ProVotRegPropFin,ProVotFechaJornada,ProVotEstado,ProVotAdmCodigo) VALUES(?,?,?,?,?,?,?,?,?,?,?)',
       [ProVotInicio,ProVotFin,ProVotRegEstInicio,ProVotRegEstFin,ProVotValAspInicio,ProVotValAspFin,ProVotRegPropInicio,ProVotRegPropFin,ProVotFechaJornada,ProVotEstado,ProVotAdmCodigo],(err,result)=>{
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

router.put('/actualizar/:codigo', async function(req, res){
    const {ProVotInicio,ProVotFin,ProVotRegEstInicio,ProVotRegEstFin,ProVotValAspInicio,ProVotValAspFin,ProVotRegPropInicio,ProVotRegPropFin,ProVotFechaJornada,ProVotEstado,ProVotAdmCodigo}=req.body;
    conexion.query('UPDATE tblprocesovotacion SET ProVotInicio=?,ProVotFin=?,ProVotRegEstInicio=?,ProVotRegEstFin=?,ProVotValAspInicio=?,ProVotValAspFin=?,ProVotRegPropInicio=?,ProVotRegPropFin=?,ProVotFechaJornada=?,ProVotEstado=?,ProVotAdmCodigo=?',
    [ProVotInicio,ProVotFin,ProVotRegEstInicio,ProVotRegEstFin,ProVotValAspInicio,ProVotValAspFin,ProVotRegPropInicio,ProVotRegPropFin,ProVotFechaJornada,ProVotEstado,ProVotAdmCodigo,req.params.codigo],(err,result)=>{
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
    conexion.query('DELETE FROM tblprocesovotacion WHERE tblprocesovotacion.ProVotCodigo = ?',[req.params.codigo],(err,result)=>{
       try {
            res.json({
             message: 'Eliminado satisfactoriamente',
             Method: 'PUT',
             Status: 'Eliminado'
             });
        } catch (error) {
            res.status(500).json({
                message: 'Ocurrio un error',
              })
           }
        })
     });      
module.exports=router; // exportando las rutas