const express = require('express');
const router = express.Router();
const userscontroller = require('../controllers/users');
const {body} = require("express-validator");
const db = require ("../database/models");
const session = require('express-session');
const bcrypt = require("bcryptjs");
const usercontroller = require('../controllers/users');

let validationsLogin = [
    body('email')
    .notEmpty().withMessage('Este campo es obligatorio. ').bail()
    .isEmail().withMessage('Tiene que tener rquisitos de email').bail()
    .custom(function(value, {req}){
        return db.Usuario.findOne({where: {mail: req.body.email},})
            .then(function(user){
                if(user != undefined){
                    return true;
                }
                else{
                    throw new Error ('no existe')
                }

            })
        }),
    
    body('password')
    .notEmpty().withMessage('Este campo es obligatorio. ').bail()
    .custom(function(value, {req}){
        return db.Usuario.findOne({where: {mail: req.body.email},})
            .then(function(result){
                if (result != undefined){
                    let check = bcrypt.compareSync(req.body.password, result.contrasenia);
                    if(!check){
                        throw new Error ('La contraseña es incorrecta')
                    }
                }
                    else{
                        throw new Error ('No existe ese mail')
                    }
                })
            
            })
        
]

let validationRegister = [
    body('email')
    .notEmpty().withMessage('Este campo es obligatorio. ').bail()
    .isEmail().withMessage('Tiene que tener rquisitos de email').bail()
    .custom(function(value){
        return db.Usuario.findOne({where: {mail: value}})
            .then(function(user){
                if (user == undefined){
                    return true;
                }
                else{
                    throw new Error ('El email ya existe')
                }
            })
    }),

    body('username')
    .notEmpty().withMessage("Introduzca su nombre de usuario."),

    body('password')
    .notEmpty().withMessage("Este campo es obligatorio.").bail()
        .isLength({min: 4}).withMessage("La contraseña debe tener al menos 4 caracteres.") 
]

let validationEdit = [
    body("mail")
    .notEmpty().withMessage("Este campo es obligatorio.").bail()
    .isEmail().withMessage("Debe ser un email valido.").bail(),

    body("usuario")
    .isEmpty().withMessage("El campo es obligatorio.").bail()
    .isLength({ min:4 }).withMessage("La contraseña debe tener al menos 4 caracteres.")
]


router.get('/login', userscontroller.login);
routee.post("/login", validationsLogin, userscontroller.loginUser);

router.get('/register', userscontroller.register);
router.post("/register", validationRegister, userscontroller.store)

router.get('/profile', userscontroller.profile);

router.get('/edit', userscontroller.edit);
router.post("/edit", validationEdit, userscontroller.update);

router.post("/logout", userscontroller.logout);

module.exports = router;