const db = require('../database/models');

const indexcontroller = {
    index: function(req, res){
        db.Usuario.findAll()
        .then(function(result) {
            return res.send(result)
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

