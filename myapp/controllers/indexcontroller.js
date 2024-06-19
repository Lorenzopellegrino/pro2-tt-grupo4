const db = require('../database/models');
const op = db.Sequelize.Op;

const indexcontroller = {
    index: function(req, res){
        let filtrado = {
            order:[["createdAt" , "DESC"]],
            include: [
                {association: "comentarios"},
                {association: "usuario"}
            ]
        }

        db.Producto.findAll(filtrado)
        .then(function(result) {
            //return res.send(result)
            return res.render("index", {title: "Home", productos: result});
        })
        .catch(function (error) {
            console.log(error);
        });
    },

    // return res.render('index', {title : 'Home', productos: db.productos})

    search: function(req, res){

        let busqueda = req.query.search;

        let filtrado = {
            where: {
                [op.or] :[
                    {nombreProducto:{[op.like]: "%" + busqueda + "%"}},
                    {descripcionProducto:{[op.like]: "%" + busqueda + "%"}}
                ]
            },
            order:[["createdAt" , "DESC"]],
            include: [
                {association: "comentarios"},
                {association: "usuario"}
            ]
        }

        db.Producto.findAll(filtrado)
        .then(function(result) {
            return res.render('search-results', {title: `Resultados de la busqueda: ${busqueda}`, productos : result})
        })
        .catch(function(error) {
            console.log(error);
        });
    }
};


module.exports = indexcontroller;

