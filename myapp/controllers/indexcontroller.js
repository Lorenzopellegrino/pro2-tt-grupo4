const db = require('../database/models');
const op = db.Sequelize.Op;

const indexcontroller = {
    index: function(req, res){
        let filtro = {
            order:[["createdAt" , "DESC"]],
            include: [
                {association: "comentarios"},
                {association: "usuario"}
            ]
        }

        db.Producto.findAll(filtro)
        .then(function(results) {
            return res.render("index", {title: "Home", productos: results});
        })
        .catch(function (error) {
            console.log(error);
        });
    },

    // return res.render('index', {title : 'Home', productos: db.productos})

    search: function(req, res){

        let busqueda = req.query.search;

        let filtro = {
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

        db.Producto.findAll(filtro)
        .then(function(results) {
            return res.render('search-results', {title: `Resultados busqueda: ${busqueda}`, productos : results})
        })
        .catch(function(error) {
            console.log(error);
        });
    }
};


module.exports = indexcontroller;

