const db = require('../database/models');
const bcrypt = require("bcryptjs");
const op = db.Sequelize.Op;
const {validationResult} = require('express-validator');


const usercontroller = {
    login: function(req, res){
        return res.render("login", {title: "LOGIN"})
    },
    register: function(req, res, next){
        if (req.session.usuario != undefined) {
            return res.redirect("/")
        }
        else{
            res.render("register", {title: "REGISTER"})
        } 
    },

    profile: function(req, res){
        res.render("profile", {title: "PROFILE", usuario: db.usuario, producto: db.productos})
    },

    store : function(req , res){
        let form = req.body;
        let usuario = {
        email:form.email,
        nombredeusuario: form.usuario,
        contrasenia: bcrypt.hashSync(form.password , 10),
        fechadenacimiento: form.birthdate,
        numerodedocumento: form.documento,
        fotodeperfil: form.fotodeperfil
    }
    db.Usuario.create(usuario)
    .then((result) => {
        return res.redirect("/users/login");
    }).catch((err) => {
        return console.log(err);
    });

    },

    loginUser: function(req,res) {
        let form = req.body;

        let filtro = {
            where: [{email:form.email}]
        };

        db.Usuario.findOne(filtro)
        .then((result) => {
            if (result != null){
                let check = bcrypt.compareSync(form.password,result.password);

                if (check){
                    req.session.user = result;
                    if (form.rememberme != undefined){
                        res.cookie("userId", result.id,{maxAge: 1000 * 60 * 35})
                    }
                    return res.redirect("/users/profile");
                }else {
                    return res.send("error en la contrasenia");
                }
            }else {
                return res.send ("No hay email parecidos a :" + form.email);
            }
        }).catch((err) => {
            return console.log(err);
        });
    },

    logout: function (req,res) {
        req.session.destroy();
        res.clearCookie("userId")
        return res.redirect("/")
    },

    edit: function(req, res){
        res.render("profile-edit", {title: "EDIT", usuario: db.usuario})
    }
};



module.exports = usercontroller;

