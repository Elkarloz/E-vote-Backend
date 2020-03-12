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

router.get('/api/consulta/:codigo', async function(req,res){
   console.log(req.params.codigo);
   conexion.query("SELECT CONCAT(PerNombre,' ',PerApellido) Nombre, PerDocumento Documento, EstFicha Ficha,ProforNombre Prog_Form,JorNombre Jornada,EstEstado Estado FROM tblpersona INNER JOIN tblestudiante on(PerCodigo=EstPerCodigo) INNER JOIN tblprogramaformacion on(ProforCodigo=EstProforCodigo) INNER JOIN tbljornada on(JorCodigo=EstJorCodigo) WHERE PerDocumento=?",
   [req.params.codigo],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});

module.exports=router;