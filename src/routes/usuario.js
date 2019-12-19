const express =require ('express');
const router= express.Router();
const dbconnection = require('../models/dbconnection');
const conexion= dbconnection();



router.get('/', async function(req,res){

    conexion.query('select * from tblpersona',(err,result)=>{
        if (err) {
            res.status(500).json({
               message: 'Ocurrio un error',
             })
         }else{
           res.status(200).json(result);
         }
       })
   });



   router.get('/:codigo', async function(req,res){
    conexion.query('select * from tblpersona where PerCodigo= ?',[req.params.codigo],
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
    const {PerDocumento,PerNombre,PerApellido,EstFicha,EstJornada,EstProgForm}=req.body;
    conexion.query('call Agrear_Estudiante_persona(?,?,?,?,?,?)',
    [PerDocumento,PerNombre,PerApellido,EstFicha,EstJornada,EstProgForm],
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
    console.log(req.params.codigo);
    const {PerDocumento,PerNombre,PerApellido}=req.body;
    console.log(req.body);
    conexion.query('Update tblpersona Set PerDocumento= ? ,PerNombre= ?,PerApellido= ? where PerCodigo= ?',
    [PerDocumento,PerNombre,PerApellido,req.params.codigo],
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
    conexion.query('delete from tblpersona where PerCodigo= ?',[req.params.codigo],
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