const jwt = require('jsonwebtoken');
const secret='evote';

module.exports = function(req,res,next){
   var ruta=req.path
   var metodo=req.method;
   var Rolpeticion= req.headers.rolseleccionado;
   var RolToken=[];
   //var rutaAdmin=[],[];
   //var rutaVotante=[],[];
   //var rutaAspirante=[],[];
   //var rutaCandidatp=[],[];
   //console.log(Rolpeticion)


   if(ruta !='/api/login'){
       if(metodo !='OPTIONS'){
           //console.log(req.headers)
        if(req.headers.authorization){
            let token =req.headers.authorization.split(' ')[1]
            jwt.verify(token,secret,function(error,decoded){
                if(error){
                    res.status(403).json({
                Messaje : error
            })
                }else{ 
                    console.log();
                    var RolToken=[];
                    for (let index = 0; index < decoded.aux[0].roles.length; index++) {
                        RolToken[index]=decoded.aux[0].roles[index].RolNombre;
                    }
                    console.log(RolToken)
                    next(); 
                }
            })

  
           }else{
            res.status(403).json({
                Messaje :'No Posee Token de validacion'
            })
           }
       }else next();
       
   }else next();

}

/*
 
*/