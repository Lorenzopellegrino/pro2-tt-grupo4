const db = require('../database/models');
const op = db.Sequelize.Op;
const {validationResult} = require("express-validator")

const productocontoller = {
    index: function(req, res){
        
        let id = req.params.id;

        let criterio = {
            include: [
            {association: "usuario"},
            {association: "comentarios",
                include: [{association: "usuario"}
            ]}
        ],
        order: [
            ["comentario", "createdAt", "DESC"]
        ]
        };
        db.Producto.findByPk(id, criterio)
        .then(function (results) {
            let condition = false;
            if (req.session.usuario != undefined && req.session.usuario.id == results.usuario.id) {
                condition = true;
            }
            return res.render('product', {title : 'Detalle Producto' , productos: results, condition: condition})
           
        }).catch(function(respuestaNegativa) {
            console.log(respuestaNegativa);
        })
         
    },
    

    add: function(req, res){

        if (req.session.usuario != undefined) {
            return res.render("product-add", {title: "Agregar Producto"})
        } else {
            return res.redirect("/users/login")
        }
},

    store: function(req, res) {
        let form = req.body;
        let errors = validationResult(req)

        if (errors.isEmpty()) {
            db.Producto.create(form)
            .then((result)=>{
                return res.redirect("/product/id/" + result.id)
            }).catch((error) => {
                return console.log(error);
            })
        } else {
            return res.render("product-add", {title: "Register", errors: errors.mapped(), old: req.body})
        }
    },

    edit: function(req, res) {
        let form = req.body;

        let criterio = {
            include: [
                {association: "usuario"}
            ]}
            db.Producto.findByPk(form.id, criterio)
            .then(function (results) {
                return res.render("product-edit", {title: `Editar producto ${results.nombreProducto}`, productos: results})
            })
            .catch((error) => {
                return console.log(error);
            })
    },

    update: function(req, res) {
        let form = req.body;
        let errors = validationResult(req);
        if (errors.isEmpty()){
            let filtro = {
                where: {
                  id:form.id
                }  
              }  

            if (req.session.user != undefined ){
                let id = req.session.user.id;
                if (form.usuarioId == id) {
                    db.Producto.update (form, filtro)
                    .then((result) => {
                        return res.redirect("/product/id/" + form.id)
                    }).catch((err) => {
                        return console.log(err);
                    });
                }
                else {
                    return res.redirect("/users/profile/id/" + id);
            }
            }
             else {
                return res.redirect ("/users/login");
        } 
        }
        else {
            let criterio = {
                include: [
                    {association: "usuario"}
                ]
            }
        }
    },

    delete: function(req, res) {
        let form = req.body;

        let filtro = {
            where: {
                id: form.id
            }
                
        }

        if (req.session.usuario != undefined) {
            let id = req.session.usuario.id;
            if (form.idUsuario == id) {
                db.Producto.destroy(filtro)
                .then((result) => {
                    return res.redirect("/");
                }).catch((error) => {
                    return console.log(error);
                })
            } else {
                return res.redirect("/users/profile/id" + id);
            }
        } else {
            return res.redirect("/users/login");
        }
    },

    comment: function(req, res) {
        let form = req.body;
        let errors = validationResult(req)
        if (errors.isEmpty()) {
            let comentario = {
                usuarioId: req.session.usuario.id,
                productoId: req.params.id,
                comentario: form.comentario
            }

            db.Comentario.create(comentario)
            .then((resultados) => {
                return res.reditect("/product/id/" + req.params.id)
            }).catch((error)=> {
                return console.log(error);
            });
        }
        else {
            let id = req.params.id
            let condition = false
            
            let criterio = {
                include: [
                    {association: "usuario"},
                    {association: "comentarios",
                include: [{association: "usuario"}
            ]}
            ],
            order: [[{model: db.Comentario, as: "comentarios"}, "createdAt", "DESC"]]
            }
            db.Producto.findByPk(id, criterio)
            .then(function(results) {
                if (req.session.usuario != undefined && req.session.usuario.id == results.usuario.id) {
                    condition = true;                   
                }

                return res.render("producto", {title: "Producto", productos: results, comentarios: results.comentarios, condition: condition }) // errors: errors.mapped(), old: req.body
                
                .catch(function(error) {
                    return console.log(error);
                })
            })
        }
    }
}

module.exports = productocontoller;