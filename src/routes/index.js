const express =require ('express');

const router= express.Router();

router.get('/',function(req,res){
    res.send('Hola Mundo');

})
router.get('/consulta',function(req,res){
    res.redirect('consulta.html');

})

router.get('/json',(req, res) =>{
    res.json({
        message: 'Behold The MEVN Stack!'
    });
});

module.exports=router;