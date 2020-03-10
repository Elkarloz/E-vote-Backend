const express = require('express');
const upload = require('../middlewares/storage')

const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();

router.post('/subir', upload.single('imagen'), async function(req,res){
   try {
      console.log(req.file);
      res.json({
      message: 'subio exitosamente'
   })
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

module.exports=router; // exportando las rutas