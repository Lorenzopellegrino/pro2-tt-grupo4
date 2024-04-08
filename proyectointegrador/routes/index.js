var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;

const express = require('express');
const indexcontroller = require('../controllers/indexcontroller');
const router = express.Router();

router.get('/', indexcontroller.index);

module.exports = router;