const express =require ('express');

const dbconnection = require('../models/dbconnection');
const conexion= dbconnection();

const router= express.Router();

router.get('/', async function(req,res){

    conexion.query('select * from tblpersona',(err,result)=>{
res.json(result);
    })
});

router.post('/', async function(req,res){
    console.log(req.body);
    const {PerDocumento,PerNombre,PerApellido,EstFicha,EstJornada,EstProgForm}=req.body;
    conexion.query('call Agrear_Estudiante_persona(?,?,?,?,?,?)',
    [PerDocumento,PerNombre,PerApellido,EstFicha,EstJornada,EstProgForm],
    (err,result)=>{
        res.json({
            message: 'Usuario',
            Method: 'POST',
            Status: 'Recibido'
        });
    })

});

router.put('/:codigo', async function(req,res){
    console.log(req.params.codigo);
    const {PerDocumento,PerNombre,PerApellido}=req.body;
    console.log(PerDocumento,PerNombre,PerApellido);
    conexion.query('Update tblpersona Set PerDocumento= ? ,PerNombre= ?,PerApellido= ? where PerCodigo= ?',
    [PerDocumento,PerNombre,PerApellido,req.params.codigo],
    (err,result)=>{
         res.json({
            message: 'Usuario',
            Method: 'PUT',
            Status: 'Actualizado'
        });
    })
});


router.delete('/:codigo', async function(req,res){
    console.log(req.params.codigo);
    conexion.query('delete from tblpersona where PerCodigo= ?',[req.params.codigo],
    (err,result)=>{
         res.json({
            message: 'Usuario',
            Method: 'PUT',
            Status: 'Eliminado'
        });
    })
})

module.exports=router;