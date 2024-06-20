const db = require('../database/models');
const bcrypt = require("bcryptjs");
const op = db.Sequelize.Op;
const {validationResult} = require('express-validator');


const usercontroller = {
    login: function(req, res, next){
        if (req.session.user != undefined) {
            return res.redirect("/")
        }
        else{
            return res.render("login", {title: "LOGIN"})
        }
    },
    register: function(req, res, next){
        if(req.session.user != undefined) {
            return res.redirect("/")
        }
        else{
            res.render("register", {title: "REGISTER"})
        } 
    },

    profile: function(req, res){
        let id = req.params.id;
        
        let criterio = {
            include: [
                {association: "productos"},
                {association: "comentarios"}
            ],
            order: [[{model: db.Producto, as: "producto"}, "createdAt", "DESC"]]
        }

        db.Usuario.findByPk(id, criterio)
        .then(function(results) {
            let condition = false;

            if (req.session.usuario != undefined && req.session.usuario.id == results.id){
                condition = true;
            }

            return res.render("profile", {title: `@${results.usuario}`, usuario: results.usuario , producto: results.productos, comentarios: results.comentarios.length, condition: condition});
        })
        .catch(function (error){
            console.log(error);
        });
        
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
        let errors = validationResult(req); // Terminar

        let filtro = {
            where: [{email:form.email}]
        };

        db.Usuario.findOne(filtro)
        .then((result) => {
            if (result != null){
                req.session.usuario = result;
                if (form.remember != undefined){
                    res.cookie("userId",result.id,{maxAge: 1000 * 60 * 35})
                }
                return res.redirect("/")   
            }
            else{
                return res.redirect("/users/login");
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

