const express = require('express');
const router = express.Router();
const productoscontroller = require('../controllers/productoscontroller');
const {body} = require("express-validator");

let validations = [
    body("nombreProducto")
        .notEmpty().withMessage("Este campo es obligatorio."),
    body("descripcionProducto")
        .notEmpty().withMessage("Este campo es obligatorio."),
    body("imagenProducto")
        .notEmpty().withMessage("Este campo es obligatorio.").bail()
        .isURL().withMessage("Este campo debe tener una URL valida.")
]

let validationsComentario = [
    body("comentario")
        .notEmpty().withMessage("Este campo no puede estar vacio.").bail()
        .isLength({min:3}).withMessage("El comentario debe tener al menos 3 caracteres.")
];

router.get('/id/:id', productoscontroller.index);
router.post("/id/:id", validationsComentario, productoscontroller.comment)

router.get('/add', productoscontroller.add);
router.post("/add", validations, productoscontroller.store);

router.post("/editProduct", productoscontroller.edit);
router.post("/edit", validations, productoscontroller.update);

router.post("/delete", productoscontroller.delete)

module.exports = router;