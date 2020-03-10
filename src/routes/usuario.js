const express =require ('express');
const router= express.Router();
const dbconnection = require('../models/dbconnection');
const conexion= dbconnection();



router.get('/', async function(req,res){
conexion.query('SELECT PerCodigo,PerDocumento,PerNombre,PerApellido,EstEstado,SexNombre FROM tblestudiante INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblsexo ON tblpersona.PerSexCodigo = tblsexo.SexCodigo',(err,result)=>{
  if (err) {
      res.status(500).json({
          message: 'Ocurrio un error',
        })
    }else{
      res.status(200).json(result);
    }
  })
});

//Consulta para todos los comboBox
router.get('/comboBox', async function(req,res){
  conexion.query('SELECT SexCodigo,SexNombre,TipdocCodigo,TipdocNombre, ProforCodigo, ProforNombre, JorCodigo, JorNombre FROM tblsexo, tbltipodocumento, tblprogramaformacion, tbljornada',(err,result)=>{
    if (err) {
        res.status(500).json({
            message: 'Ocurrio un error',
          })
      }else{
        res.status(200).json(result);
      }
    })
});

///buscar x parametros
router.get('/:DocPer/:NomPer/:ApePer/:Sex/:Estado', async function(req,res){
  conexion.query('SELECT PerCodigo, PerDocumento, PerNombre, PerApellido, SexNombre, PerEstado FROM tblpersona INNER JOIN tblsexo ON tblpersona.PerSexCodigo = tblsexo.SexCodigo WHERE tblpersona.PerDocumento = ? OR tblpersona.PerNombre = ? OR tblpersona.PerApellido = ? OR tblsexo.SexNombre = ? OR tblpersona.PerEstado = ?',
  [req.params.DocPer,req.params.NomPer,req.params.ApePer,req.params.Sex,req.params.Estado],(err,result)=>{
     try {
        res.json(result);
        // console.log(result);
     } catch (err) {
        res.status(500).json({
           message: 'Ocurrio un error',
         })
     }
  })
});

router.get('/:codigo', async function(req,res){
conexion.query('SELECT PerCodigo,PerDocumento,PerNombre,PerApellido,EstEstado,EstFicha,JorNombre,ProforNombre,SexNombre,TipdocNombre FROM tblestudiante INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo INNER JOIN tblsexo ON tblpersona.PerSexCodigo = tblsexo.SexCodigo INNER JOIN tbltipodocumento ON tblpersona.PerTipdocCodigo = tbltipodocumento.TipdocCodigo WHERE PerCodigo = ?',[req.params.codigo],
(err,result)=>{
    if (err) {
        res.status(500).json({
            message: 'Ocurrio un error',
          })
      }else{
        res.status(200).json(result);
      }
})
});

router.post('/', async function(req,res){
  console.log(req.body)
    const {PerDocumento,PerNombre,PerApellido,EstFicha, JorCodigo, ProforNombre, SexNombre,TipdocNombre}=req.body;
    conexion.query('call Agrear_Estudiante_persona (?,?,?,?,?,?,?,?)',
    [PerDocumento,PerNombre,PerApellido,EstFicha, JorCodigo, ProforNombre, SexNombre,TipdocNombre],
    (err,result)=>{
        if (err) {
             res.status(500).json({
                message: 'Ocurrio un error',
              })
          }else{
            res.status(200).json({
                message: 'Usuario agregado satisfactoriamente',
                Method: 'POST',
                Status: 'Recibido'
              })
             
          }
    })

});

router.put('/:codigo', async function(req,res){
/*     console.log(req.params.codigo); */
    const {PerCodigo,PerDocumento,PerNombre,PerApellido,EstFicha,JorNombre,ProforNombre,SexNombre,TipdocNombre,EstEstado}=req.body;
    /* console.log(req.body); */
    conexion.query('CALL Actualizar_Estudiante_persona(?,?,?,?,?,?,?,?,?,?)',
    [PerCodigo,PerDocumento,PerNombre,PerApellido,EstFicha,JorNombre,ProforNombre,SexNombre,TipdocNombre,EstEstado],
    (err,result)=>{
        if (err) {
            res.status(500).json({
               message: 'Ocurrio un error',
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


router.delete('/:codigo', async function(req,res){
    console.log(req.params.codigo);
    conexion.query('CALL Eliminar_Estudiante_persona(?)',[req.params.codigo],
    (err,result)=>{
        if (err) {
            res.status(500).json({
               message: 'Ocurrio un error',
             })
         }else{
           res.status(200).json({
            message: 'Usuario Elimiando Saisfactoriamente',
            Method: 'PUT',
            Status: 'Eliminado'
             })
         }
    })
});
module.exports=router;