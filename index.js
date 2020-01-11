//declarations

import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import path from 'path';
const bodyParser = require('body-parser');
const AuthToken =require('./src/middlewares/AuthToken')

const app = express();


app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "http://localhost:8080");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });

//settings
const port = process.env.PORT || 4000;



//middlewares
app.use(AuthToken);
app.use(morgan('tiny'));
app.use(cors());
app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));




//routes
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



// Middleware para Vue.js router modo history
const history = require('connect-history-api-fallback');
app.use(history());
app.use(express.static(path.join(__dirname, '/src/public')));

//listen
app.listen(port, () => {
    console.log(`listening on ${port}`);
});