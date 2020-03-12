const express = require('express');
const upload = require('../middlewares/storage');
import path from 'path';

const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();

router.post('/subir', upload.single('imagen'), async function(req,res){
   try {
      console.log(req);
      res.redirect('http://localhost:8080/dashboard');
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
});

router.post('/subir:codigo', upload.single('imagen'), async function(req,res){
   try {
      console.log(req);
      res.redirect('http://localhost:8080/dashboard');
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
});

router.get('/ret_img', async function(req,res){
   try {

      res.sendFile(path.join(__dirname, '../../src\\img\\cover.jpg'));
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
});



router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query('SELECT CanCodigo,CanNTarjeton,PerNombre,PerApellido,CanEstado FROM tblcandidato INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo',(err,result)=>{
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
    conexion.query('SELECT CanCodigo,CanNTarjeton,PerNombre,PerApellido,CanEstado FROM tblcandidato INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE CanCodigo = ?',[req.params.codigo],(err,result)=>{
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
    const {CanNTarjeton,CanEstado}=req.body;
    console.log(req.body);
    conexion.query('UPDATE tblcandidato SET CanNTarjeton = ?,CanEstado = ? WHERE CanCodigo = ?',
    [CanNTarjeton,CanEstado,req.params.codigo],(err,result)=>{
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

//agregar propuestas
router.post('/propuestas', async function(req, res){
   const {codigo,ProNombre,ProDescripcion}=req.body;
      console.log(req.body);
      conexion.query('CALL agregar_propuestas(?,?,?)',
      [codigo, ProNombre,ProDescripcion],(err,result)=>{
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


module.exports=router; // exportando las rutas