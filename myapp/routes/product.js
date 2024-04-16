const express = require('express');
const productoscontroller = require('../controllers/productoscontroller');
const router = express.Router();

router.get('/', productoscontroller.index);

router.get('/add', productoscontroller.create);

module.exports = router;