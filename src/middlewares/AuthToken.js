const jwt = require('jsonwebtoken');
const secret='evote';

module.exports = function(req,res,next){
   var ruta=req.path
   var metodo=req.method;
   var Rolpeticion= req.headers.rolseleccionado;
   var RolToken=[];
   if(ruta !='/api/login'){
       if(metodo !='OPTIONS'){
        if(req.headers.authorization!='Bearer null'){
            let token =req.headers.authorization.split(' ')[1]
            jwt.verify(token,secret,function(error,decoded){
                if(error){
                    res.status(403).json({
                Error : error
            })
                }else{
                    //console.log(req.headers.rolseleccionado);
                    var RolToken=[];
                    var existe =false;
                    for (let index = 0; index < decoded.aux[0].roles.length; index++) {
                        RolToken[index]=decoded.aux[0].roles[index].RolNombre;
                        if(decoded.aux[0].roles[index].RolNombre===req.headers.rolseleccionado){
                            existe=true;
                        }
                    }
                    if(existe===true){
                        next();
                        existe=false;
                          //console.log(RolToken)
                    }else{
                        res.status(403).json({
                            Error :{
                                message: 'No tiene permisos para realizar Esta accion'
                            }
                        })
                    }
                }
            })
           }else{
            res.status(403).json({
                Error :{
                    message: 'No Posee Token de validacion'
                }
            })
           }
       }else next();
       
   }else next();

}