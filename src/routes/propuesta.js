const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();
//cosultar la de todos los candidatos
router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query("SELECT CONCAT(PerNombre,' ',PerApellido) nombre, ProNombre,ProDescripcion,CanNTarjeton,CanFotoRuta FROM tblpropuesta INNER JOIN tblcandidato ON tblpropuesta.ProCanCodigo = tblcandidato.CanCodigo INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo",(err,result)=>{
       try {
          res.json(result);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
});
//traer estos datos y img para la vista de agregar propuestas
router.get('/img/:codigo', async function(req,res){
   conexion.query("SELECT CONCAT( PerNombre, ' ', PerApellido ) nombre, CanNTarjeton, CanFotoRuta FROM tblcandidato INNER JOIN tblestudiante ON tblcandidato.CanEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON EstPerCodigo = tblpersona.PerCodigo WHERE PerCodigo = ?",[req.params.codigo],(err,result)=>{
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
     
module.exports=router; // exportando las rutas