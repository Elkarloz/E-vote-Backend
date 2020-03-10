const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();



router.get('/consulta',function(req,res){
    res.redirect('consulta.html');

})

router.get('/json',(req, res) =>{
    res.json({
        message: 'Behold The MEVN Stack!'
    });
});

router.get('/:fecha', async function(req,res){
   console.log(req.params.fecha);
   conexion.query('SELECT ProVotCodigo FROM tblprocesovotacion WHERE ProVotFechaJornada = ?',
   [req.params.fecha],(err,result)=>{
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

module.exports=router;