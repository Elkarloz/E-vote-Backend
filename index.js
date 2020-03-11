//declarations

import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import path from 'path';
const bodyParser = require('body-parser');
const AuthToken =require('./src/middlewares/AuthToken');
const fs = require('fs');
const PDFDocument = require('pdfkit');
const doc = new PDFDocument;
var aleatorio = Math.random();



// doc pdf

/* doc.pipe(fs.createWriteStream(__dirname +`/src/docs/Doc-${aleatorio}.pdf`)); 
const titulo = 'FORMULARIO DE INSCRIPCION DE CANDIDATO A REPRESENTANTE DE APRENDICES 2020'
var jornada = 'Mañana' 
var Nombre = 'Carlos Mauricio Roa Meneses' 
var TipoDoc = 'Cédula de Ciudadanía'
var NDoc = '1007620672'
var NivelFor = 'Técnico'
var ficha = '172340'
var Profor = 'Técnico en programación de software' 
var correo = 'croameneses@gmail.com' 
var correo2 = 'croameneses@gmail.com'
var f = new Date()   
                         
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

  .text(`Nombre completo: _______________________________`, 100,240)
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
.text(`${f.getDay()+1} / ${f.getMonth()+1} / ${f.getFullYear()}`, 430,680)
.text('______________________', 400,680)
.text('Fecha de inscripción día/mes/año', 400,700)


.image('src/img/Logo.png', 550,780, {width: 50})
doc.end(); //finaliza
console.log('archivo generado');  */




const app = express();


app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });

//settings
const port = process.env.PORT || 4000;






//middlewares
//app.use(AuthToken);
app.use(morgan('tiny'));
app.use(cors());
app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));




//routes
app.use('/api/index',require('./src/routes/index'))
app.use('/api/dashboard',require('./src/routes/dashboard'));
app.use('/',require('./src/routes/index'));
app.use('/api/home',require('./src/routes/home'));
app.use('/api/login',require('./src/routes/login'));
app.use('/api/usuario',require('./src/routes/usuario'));
app.use('/api/aspirante',require('./src/routes/aspirante'));
app.use('/api/candidato',require('./src/routes/candidato'));
app.use('/api/estudiante',require('./src/routes/estudiante'));
app.use('/api/procesoVotacion',require('./src/routes/procesoVotacion'));
app.use('/api/propuesta',require('./src/routes/propuesta'));
app.use('/api/funcion',require('./src/routes/funcion'));
app.use('/api/huella',require('./src/routes/huella'));
app.use('/api/inscripcion',require('./src/routes/inscripcion'));
app.use('/api/jornada', require('./src/routes/jornada'));
app.use('/api/programaFormacion', require('./src/routes/programaFormacion'));
app.use('/api/rol', require('./src/routes/rol'));
app.use('/api/rolUsuario',require('./src/routes/rolUsuario'));
app.use('/api/sexo',require('./src/routes/sexo'));
app.use('/api/subVistas',require('./src/routes/subVistas'));
app.use('/api/tipoDocumento',require('./src/routes/tipoDocumento'));
app.use('/api/vistas',require('./src/routes/vistas'));
app.use('/api/vistasRoles',require('./src/routes/vistasRoles'));
app.use('/api/votacionGeneral',require('./src/routes/votacionGeneral'));
app.use('/api/voto',require('./src/routes/voto'));
app.use('/api/votante',require('./src/routes/votante'));


// Middleware para Vue.js router modo history
const history = require('connect-history-api-fallback');
app.use(history());
app.use(express.static(path.join(__dirname, '/src/public')));

//listen
app.listen(port, () => {
    console.log(`listening on ${port}`);
});