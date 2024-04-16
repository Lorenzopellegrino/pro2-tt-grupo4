const db = require('../db/data')

const usercontroller = {
    login: function(req, res){
        return res.render("login", {title: "LOGIN"})
    },
    register: function(req, res){
        return res.render("register", {title: "REGISTER"})
    },
    profile: function(req, res){
        return res.render("profile", {title: "PROFILE", usuario: db.usuarios, producto: db.productos})
    },
    edit: function(req, res){
        return res.render("edit", {title: "EDIT", usuario: db.usuario})
    }
};

module.exports = usercontroller