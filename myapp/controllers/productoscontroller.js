const db = require('../db/data');

const productocontoller = {
    index: function(req, res){
        return res.render('product' , {title : 'Detalle Producto' , productos : db.productos})
    },
    add: function(req, res){
        return res.render('product-add' , {title : 'Agregar Producto' , usuario : db.usuario})
}};

module.exports = productocontoller;