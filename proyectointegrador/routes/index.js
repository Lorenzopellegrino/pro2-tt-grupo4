
const express = require('express');
const indexcontroller = require('../controllers/indexcontroller');
const router = express.Router();

router.get('/', indexcontroller.index);

router.get('/search-results', indexcontroller.search);

module.exports = router;