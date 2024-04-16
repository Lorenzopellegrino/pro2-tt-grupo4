const db = require('../db/data')

const indexcontroller = {
    index: function(req, res){
        return res.render('index', {title : 'Home', productos: db.productos})
    },
    search: function(req, res){
        return res.render('search-results', {title: 'search results', productos : db.productos})
    }
};


module.exports = indexcontroller

