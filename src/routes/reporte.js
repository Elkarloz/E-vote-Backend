const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();

router.get('/candidatos', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query("SELECT CONCAT(PerNombre,' ',PerApellido) Nombre,COUNT(VotCodigo) Votacion FROM tblvoto RIGHT JOIN tblcandidato on(CanCodigo=VotCanCodigo) INNER JOIN tblestudiante on(EstCodigo=CanEstCodigo) INNER JOIN tblpersona on(PerCodigo=EstPerCodigo) GROUP BY PerCodigo ORDER BY Votacion DESC",(err,result)=>{
       try {
          res.json(result);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
 });

 router.get('/candidatos2', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query("SELECT CONCAT(PerNombre,' ',PerApellido) Nombre,COUNT(VotCodigo) Votacion FROM tblvoto RIGHT JOIN tblcandidato on(CanCodigo=VotCanCodigo) INNER JOIN tblestudiante on(EstCodigo=CanEstCodigo) INNER JOIN tblpersona on(PerCodigo=EstPerCodigo) GROUP BY PerCodigo ORDER BY CanNTarjeton ASC",(err,result)=>{
       try {
          res.json(result);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
 });

 router.get('/aptos', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query("SELECT COUNT(EstCodigo) aptos FROM tblestudiante WHERE EstFicha <> 0",(err,result)=>{
       try {
          res.json(result[0]);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
 });

 router.get('/si', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query("SELECT COUNT(EstCodigo) valor FROM tblestudiante WHERE EstFicha <> 0 AND EstEstado ='inactivo';",(err,result)=>{
       try {
          res.json(result[0]);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
 });
 router.get('/no', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
    conexion.query("SELECT COUNT(EstCodigo) valor FROM tblestudiante WHERE EstFicha <> 0 AND EstEstado ='Activo';",(err,result)=>{
       try {
          res.json(result[0]);
       } catch (err) {
          res.status(500).json({
             message: 'Ocurrio un error',
           })
       }
    })
 });





 
module.exports=router; // exportando las rutas