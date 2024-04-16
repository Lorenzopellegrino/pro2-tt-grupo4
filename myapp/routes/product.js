const express = require('express');
const router = express.Router();
const productoscontroller = require('../controllers/productoscontroller');

router.get('/', productoscontroller.index);

router.get('/add', productoscontroller.create);

module.exports = router;