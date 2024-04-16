
const express = require('express');
const router = express.Router();
const indexcontroller = require('../controllers/indexcontroller');

router.get('/', indexcontroller.index);

router.get('/search-results', indexcontroller.search);

module.exports = router;