const db = require('../db/data')

const productocontoller = {
    index: function(req, res){
        return res.render('product' , {title : 'Detalle Producto' , productos : db.productos})
    },
    create: function(req, res){
        return res.render('product' , {title : 'Agregar Producto' , productos : db.productos , usuario : db.usuario})
}};

module.exports = productocontoller;