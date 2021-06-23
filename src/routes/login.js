const express = require("express");
const router = express.Router();
const dbconnection = require("../models/dbconnection");
const conexion = dbconnection();
const jwt = require("jsonwebtoken");
const secret = "evote";

router.post("/", async function(req, res) {
  var aux;
  const { UsuNombre, UsuContraseña } = req.body;
  console.log(req.body);
  //console.log(UsuNombre);
  //console.log(UsuContraseña);
  conexion.query(
    "call logintemp(?,?)",
    [UsuNombre, UsuContraseña],
    (err, result) => {
      if (err) {
        res.status(500).json({
          message: err,
        });
      } else {
        if (result[0].length > 0) {
          //console.log(result[0])
          aux = [result[0][0]];
          conexion.query(
            "SELECT RolNombre FROM tblrolusuario INNER JOIN" +
              " tblusuario on (UsuCodigo = RolUsuUsuCodigo)" +
              " INNER JOIN tblrol on(RolCodigo=RolUsuRolCodigo)WHERE UsuNombre = ?",
            [aux[0].UsuNombre],
            (err, result) => {
              if (err) {
                res.status(500).json({
                  message: err,
                });
              } else {
                //aqui se autentica
                aux[0].roles = result;
                var payload = {
                  aux,
                };
                //var a= JSON.stringify(result)
                //var b=a.replace(/[{}]/gi,'');
                //b=b.replace('[','');
                // b=b.replace(']','');
                //b=JSON.parse(a)

                jwt.sign(payload, secret, { expiresIn: 300 }, function(
                  error,
                  token
                ) {
                  if (error) {
                    console.log(error);
                  } else {
                    aux[0].token = token;
                    res.status(200).json(aux[0]);
                  }
                });
              }
            }
          );
        } else {
          res.status(500).json({
            message:
              "Las credenciales no coinciden con ningun usuario, por favor verifique las mismas",
            Method: "POST",
            Status: "No autenticado",
          });
        }
      }
    }
  );
});
module.exports = router;
