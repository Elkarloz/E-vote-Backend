const express = require('express');
const upload = require('../middlewares/storage');
import path from 'path';

const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();

router.post('/subir', upload.single('imagen'), async function(req,res){
   try {
      console.log(path);
      res.redirect('http://localhost:8080/dashboard');
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
});

router.post('/subir/:codigo', upload.single('imagen'), async function(req,res){
   
   var path=('../../'+req.file.path);//nombre de la imagen (ruta de la imagen)
   var fotoruta= ('http://localhost:4000/api/candidato/retimg/'+req.params.codigo);
   console.log(req.params.codigo);
   console.log(fotoruta);
   path=path.replace(String.fromCharCode(92),String.fromCharCode(47));
   path=path.replace(String.fromCharCode(92),String.fromCharCode(47));
   console.log(path);

   conexion.query("UPDATE tblcandidato SET CanFoto = '"+path+"', CanFotoRuta = '"+fotoruta+"' WHERE CanCodigo = "+req.params.codigo+"",(err,result)=>{
      try {
         res.redirect('http://localhost:8080/dashboard/candidatos/actualizar')
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.get('/retimg/:codigo', async function(req,res){
   
   //var prueba='../../src\\\\img\\\\cover.jpg';
   conexion.query('SELECT CanFoto from tblcandidato WHERE CanCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         var aux=result
         var foto=aux[0].CanFoto
         console.log('ruta mk carlos:',path.join(__dirname,foto));
         res.sendFile(path.join(__dirname,foto));
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
   
});

router.get('/id/:codigo', async function(req,res){
   //var prueba='../../src\\\\img\\\\cover.jpg';
   conexion.query('SELECT CanCodigo,CanFotoRuta FROM tblcandidato INNER JOIN tblestudiante on (EstCodigo = CanEstCodigo) INNER JOIN tblpersona on (PerCodigo=EstPerCodigo) WHERE PerCodigo=?',[req.params.codigo],(err,result)=>{
      try {
         res.json(result[0]);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

router.get('/:DocPer/:NomPer/:ApePer/:Estado', async function(req,res){
   conexion.query("SELECT PerCodigo,PerDocumento,PerNombre,PerApellido,CanEstado,CanCodigo,CanNTarjeton FROM tblcandidato INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE tblpersona.PerDocumento = '"+req.params.DocPer+"' OR tblpersona.PerNombre like '%"+req.params.NomPer+"%' OR tblpersona.PerApellido like '%"+req.params.ApePer+"%' OR tblcandidato.CanEstado = ?",
   [req.params.Estado],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
         })
      }
   })
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
//consular propuestas
router.get('/propuestas/:codigo', async function(req,res){
   conexion.query('SELECT ProNombre,ProDescripcion FROM tblpropuesta INNER JOIN tblcandidato ON tblpropuesta.ProCanCodigo = tblcandidato.CanCodigo INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE PerCodigo = ?',[req.params.codigo],(err,result)=>{
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
//actualizar propuestas
router.put('/propuestas/:codigo', async function(req,res){
       const {ProNombre,ProDescripcion,codigo}=req.body;
        console.log(req.body);
       conexion.query('CALL actualizar_propuestas(?,?,?)',
       [ProNombre,ProDescripcion,codigo],
       (err,result)=>{
           if (err) {
             console.log(err);
               res.status(500).json({
                  message: err,
                })
            }else{
              res.status(200).json({
               message: ' Actualizado satisfactoriamente',
               Method: 'PUT',
               Status: 'Actualizado'
                })
            }
       })
   });

module.exports=router; // exportando las rutas