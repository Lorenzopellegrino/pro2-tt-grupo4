const db = require('../db/data');

const productoContoller = {
    index: function(req, res){
        
        let id = req.params.id;

        let criterio = {
            include: [
            {association: "comentarios"},
            {association: "usuario"}
            ]
        }
        
        db.productos.findByPk(id, criterio)
        .then(function (results) {
           return res.send("OK")
           
        }).catch(function(respuestaNegativa) {
            console.log(respuestaNegativa);
        })
        // return res.render('product', {title : 'Detalle Producto' , productos : db.productos})
    },

    add: function(req, res){

        db.usuario.findOne()
        .then(function (results) {
            return res.send("OK")    

        }).catch(function (respuestaNegativa) {
            console.log(respuestaNegativa);
        })

        // return res.render('product-add' , {title : 'Agregar Producto' , usuario : db.usuario})
}};

module.exports = productoContoller;