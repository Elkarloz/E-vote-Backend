const express = require('express');
const router = express.Router();
const dbconnection = require('../models/dbconnection'); // importando el modelo
const conexion= dbconnection();
const fs = require('fs');
const PDFDocument = require('pdfkit');
const doc = new PDFDocument;
const download = require('download-pdf');
var f = new Date();


///buscar x parametros
router.get('/:DocPer/:NomPer/:ApePer/:Ficha/:Jornada/:Programa', async function(req,res){
   conexion.query('SELECT AspCodigo,AspEstado,PerDocumento,PerNombre,PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo WHERE tblpersona.PerDocumento = ? OR tblpersona.PerNombre = ? OR tblpersona.PerApellido = ? OR tblestudiante.EstFicha = ? OR tbljornada.JorNombre = ? OR tblprogramaformacion.ProforNombre = ?',
   [req.params.DocPer,req.params.NomPer,req.params.ApePer,req.params.Ficha,req.params.Jornada,req.params.Programa],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   }) 
});
//consultar todos los aspirantes
router.get('/', async function(req,res){ //req = va tener la solicitud  res = va tener la respuesta
   conexion.query('SELECT AspCodigo, AspEstado, PerDocumento, PerNombre, PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE AspEstado = "Activo"',(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});
//consultar por codigo aspirantes
router.get('/:codigo', async function(req,res){
   conexion.query('SELECT AspCodigo,AspEstado,PerDocumento,PerNombre,PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tbljornada ON tblestudiante.EstJorCodigo = tbljornada.JorCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo INNER JOIN tblprogramaformacion ON tblestudiante.EstProforCodigo = tblprogramaformacion.ProforCodigo WHERE AspCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json(result);
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});
//Mostrar el PDF
router.get('/PDF/:codigo', async function(req,res){
   conexion.query('SELECT AspRutaDoc FROM tblaspirante WHERE AspCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         var pdf = result[0].AspRutaDoc;
         pdf=pdf.replace("/", String.fromCharCode(92));
         pdf=pdf.replace("/", String.fromCharCode(92));
         pdf=pdf.replace("/", String.fromCharCode(92));
         var peth = (__dirname);
         peth=peth.replace("routes", "")   
         result=peth+pdf
         res.json(result);
         console.log(result);

        /*  fs.readFile(__dirname + filePath , function (err,data){
            res.contentType("application/pdf");
            res.send(data);
         }); */
        
      } catch (err) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })
});
// agregar aspirante
router.put('/:codigo', async function(req, res){
   const {AspDoc1,AspDoc2,AspEstado,AspFormPost,AspPerCodigo}=req.body;
   conexion.query('UPDATE tblaspirante SET AspDoc1 = ?,AspDoc2 = ?,AspEstado = ?,AspFormPost = ?,AspPerCodigo = ? WHERE AspCodigo = ?',
   [AspDoc1,AspDoc2,AspEstado,AspFormPost,AspPerCodigo,req.params.codigo],(err,result)=>{
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
// eliminar aspirante
router.delete('/:codigo', async function(req, res){

   conexion.query('DELETE FROM tblaspirante WHERE tblaspirante.AspCodigo = ?',[req.params.codigo],(err,result)=>{
      try {
         res.json({
            message: 'Eliminado satisfactoriamente',
            Method: 'PUT',
            Status: 'Actualizado'
             });
      } catch (error) {
         res.status(500).json({
            message: 'Ocurrio un error',
          })
      }
   })

});
//agregar nuevo aspirante
router.post('/', async function(req, res){ 
   const {AspFormPost,AspDoc1,AspDoc2,AspEstado,AspPerCodigo}=req.body;
      conexion.query('INSERT INTO tblaspirante(AspFormPost,AspDoc1,AspDoc2,AspEstado,AspPerCodigo) VALUES(?,?,?,?,?)',
      [AspFormPost,AspDoc1,AspDoc2,AspEstado,AspPerCodigo],(err,result)=>{
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
// validar aspirante a candidato
router.post('/validar', async function(req,res){
   const {CanNTarjeton,PerDocumento}=req.body;
   conexion.query('CALL Validar_candidato(?,?)',
   [CanNTarjeton,PerDocumento],(err,result)=>{

   try {
      res.status(200).json({
         message: 'Validado correctamente',
         Method: 'POST',
         Status: 'Actualizado' 
      })
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
   })
});

router.post('/Registrar', async function(req,res){
   const {Documento,Nombre,Apellido,Ficha,Jornada,Formacion,Tipdoc,Correo1,Correo2,Nivel,Codigo}=req.body;
   const Ruta= `/src/docs/Doc-${Apellido}-${Documento}.pdf`;
   conexion.query('CALL Agregar_aspirante(?,?)',
   [Codigo,Ruta],(err,result)=>{

   try {
      res.status(200).json({
         message: 'Registrado correctamente',
         Method: 'POST',
         Status: 'Agregado' 
      })
      // doc pdf
      doc.pipe(fs.createWriteStream(`./src/docs/Doc-${Apellido}+${Documento}.pdf`)); 
      const titulo = 'FORMULARIO DE INSCRIPCION DE CANDIDATO A REPRESENTANTE DE APRENDICES 2020'
      var jornada = req.body.Jornada 
      var Nombre = (req.body.Nombre +(" ")+ req.body.Apellido)
      var TipoDoc = req.body.Tipdoc
      var NDoc = req.body.Documento
      var NivelFor = req.body.Nivel
      var ficha = req.body.Ficha
      var Profor = req.body.Formacion
      var correo = req.body.Correo1
      var correo2 = req.body.Correo2                            
      doc
      .font('Times-Bold', 13)
      .image('src/img/Sena.png', 400, 50, {width: 100})
      .text(titulo, 100, 80,{
         columns:2,
         align: 'center'
      });

      doc
      .font('Times-Bold', 11)
      .text('Regional Caquetá', 100,180)
      .text('Centro tecnológico de la Amazonía', 350,180)

      .text(`Jornada a la cual pertenece: _______________________`, 100,210)
      .text(`${jornada}`, 270,210)

      .text(`Nombre completo: _______________________________________________________________`, 100,240)
      .text(`${Nombre}`, 200,240)
      
      .text(`Tipo de documento: ________________________`, 100,270)
      .text(`${TipoDoc}`, 200,270)

      .text(`N° documento: _____________________`, 350,270)
      .text(`${NDoc}`, 450,270)

      .text(`Nivel de formación: ________________________`, 100,300)
      .text(`${NivelFor}`, 230,300)

      .text(`N° de ficha: _______________________`, 350,300)
      .text(`${ficha}`, 450,300)

      .text(`Nombre del programa de formación: _______________________________________________`, 100,330)
      .text(`${Profor}`, 300,330)

      .text(`Email: _______________________________`, 100,360)
      .text(`${correo}`, 150,360)

      .text(`Email Misena: ________________________`, 330,360)
      .text(`${correo2}`, 410,360);

      doc
      .font('Times-Bold', 11)
      .text('COMO ASPIRANTE A REPRESENTANTE DE APRENDICES:', 100,400);

      doc
      .font('Times-Roman', 11)
      .text('He leído y entendido el Acuerdo 00002 del 2014 y que cumplo las siguientes condiciones para como Representante de aprendices de mi jornada:', 100,420);

      doc
      .font('Times-Roman', 11)
      .text('1.  Estoy vinculado a uno programa de formación técnica o tecnológica en el SENA', 120,450)
      .text('2.  No he cursado más de tres (3) trimestres en mi programa de formación (9 meses)', 120,470)
      .text('3.  No he sido representante de aprendices en ningún centro de formación del SENA', 120,490)
      .text('4.  Tengo la aptitud de responsabilidad para asumir como Representante, sin descuidar las obligaciones de mi proceso de aprendizaje', 120,510)
      .text('5.  No presento plan de mejoramiento, condicionamiento de matrícula, ni llamados de atención por escrito', 120,540)
      .text('6. No presento antecedentes disciplinarios en la Policía', 120,570)

      .font('Times-Roman', 11)
      .text('Certifico con mi firma que la información aquí otorgada es real y me prometo asumir las responsabilidades como representante, en el caso de ser elegido, sin descuidar las obligaciones de mi proceso de formación.', 100,600)

      .font('Times-Roman', 10)
      .text('__________________________________________', 100,680)
      .text('Firma del aspirante a candidato a Representante de aprendices', 100,700)

      .font('Times-Roman', 10)
      .text(`${f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear()}`, 430,680)
      .text('______________________', 400,680)
      .text('Fecha de inscripción día/mes/año', 400,700)


      .image('src/img/Logo.png', 500,750, {width: 100})
      doc.end(); //finaliza
      console.log('archivo generado');   
  
      
   } catch (error) {
      res.status(500).json({
         message: 'Ocurrio un error'
      })
   }
   })
});
router.get('/:DocPer/:NomPer/:ApePer', async function(req,res){
   conexion.query("SELECT AspCodigo, AspEstado, PerDocumento, PerNombre, PerApellido FROM tblaspirante INNER JOIN tblestudiante ON tblaspirante.AspEstCodigo = tblestudiante.EstCodigo INNER JOIN tblpersona ON tblestudiante.EstPerCodigo = tblpersona.PerCodigo WHERE tblpersona.PerDocumento = '"+req.params.DocPer+"' OR tblpersona.PerNombre like '%"+req.params.NomPer+"%' OR tblpersona.PerApellido like '%"+req.params.ApePer+"%'",
   [req.params.DocPer],(err,result)=>{
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

module.exports=router; // exportando las rutas