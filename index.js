//declarations

import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import path from 'path';
const bodyParser = require('body-parser');

const app = express();

//settings
const port = process.env.PORT || 4000;

//middlewares
app.use(morgan('tiny'));
app.use(cors());
app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));



//routes
app.use('/',require('./src/routes/index'));
app.use('/api/home',require('./src/routes/home'));
app.use('/api/login',require('./src/routes/login'));
app.use('/api/usuario',require('./src/routes/usuario'));

// Middleware para Vue.js router modo history
const history = require('connect-history-api-fallback');
app.use(history());
app.use(express.static(path.join(__dirname, '/src/public')));

//listen
app.listen(port, () => {
    console.log(`listening on ${port}`);
});