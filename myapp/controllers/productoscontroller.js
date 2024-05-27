const db = require('../db/data');

const productocontoller = {
    index: function(req, res){

        db.productos.findByPk(id)
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

module.exports = productocontoller;