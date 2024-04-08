var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;

const express = require('express');
const userscontroller = require('../controllers/users');
const router = express.Router();

router.get('/', users);

module.exports = router;