const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.get('/consultar', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query('SELECT * FROM tblcandidato',(err,result)=>{
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
    conexion.query('SELECT * FROM tblcandidato WHERE tblcandidato.CanCodigo = ?',[req.params.codigo],(err,result)=>{
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
    const {CanNTarjerton,CanFoto,CanEstado,CanProVotCodigo,CanPerCodigo}=req.body;
       conexion.query('INSERT INTO tblcandidato(CanNTarjerton,CanFoto,CanEstado,CanProVotCodigo,CanPerCodigo) VALUES(?,?,?,?,?)',
       [CanNTarjerton,CanFoto,CanEstado,CanProVotCodigo,CanPerCodigo],(err,result)=>{
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
    const {CanNTarjerton,CanFoto,CanEstado,CanProVotCodigo,CanPerCodigo}=req.body;
    conexion.query('UPDATE tblcandidato SET CanNTarjerton = ?,CanFoto = ?,CanEstado = ?,CanProVotCodigo = ?,CanPerCodigo = ? WHERE CanCodigo = ?',
    [CanNTarjerton,CanFoto,CanEstado,CanProVotCodigo,CanPerCodigo,req.params.codigo],(err,result)=>{
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
    conexion.query('DELETE FROM tblcandidato WHERE CanCodigo = ?',[req.params.codigo],(err,result)=>{
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