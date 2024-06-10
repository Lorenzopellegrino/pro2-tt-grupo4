const db = require('../database/models');
const op = db.Sequelize.Op;

const indexcontroller = {
    index: function(req, res){
        let filtrado = {
            include: [
                {association: "comentarios"},
                {association: "usuario"}
            ]
        }


        db.Producto.findAll(filtrado)
        .then(function(result) {
            return res.send(result)
            return res.render("index", {title: "Home", productos: results});
        })
        .catch(function (error) {
            console.log(error);
        })
    },

    // return res.render('index', {title : 'Home', productos: db.productos})

    search: function(req, res){

        return res.render('search-results', {title: 'search results', productos : db.productos})
    }
};


module.exports = indexcontroller;

