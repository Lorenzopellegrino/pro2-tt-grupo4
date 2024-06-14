const db = require('../db/data');
const bcrypt = require("bcryptjs")

const usercontroller = {
    login: function(req, res){
        return res.render("login", {title: "LOGIN"})
    },
    register: function(req, res){
        res.render("register", {title: "REGISTER"})
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
                    req.session.user
                }
            }
        }
    },
    edit: function(req, res){
        res.render("profile-edit", {title: "EDIT", usuario: db.usuario})
    }
};



module.exports = usercontroller;

