//declarations
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const path =require('path');
const app = express();

//settings
const port = process.env.PORT || 4000;

//middlewares
app.use(morgan('tiny'));
app.use(cors());
app.use(bodyParser.json());
//app.use(express.json());

//static files
app.use(express.static(path.join(__dirname, '/src/public')))

//routes
app.use('/',require('./src/routes/index'));
app.use('/home',require('./src/routes/home'));
app.use('/login',require('./src/routes/login'));
app.use('/usuario',require('./src/routes/usuario'));

//listen
app.listen(port, () => {
    console.log(`listening on ${port}`);
});