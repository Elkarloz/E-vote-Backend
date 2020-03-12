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



module.exports=router; // exportando las rutas