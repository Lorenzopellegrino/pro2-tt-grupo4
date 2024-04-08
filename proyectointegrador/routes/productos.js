const express = require('express');
const productoscontroller = require('../controllers/productoscontroller');
const router = express.Router();

router.get('/', productoscontroller);

module.exports = router;