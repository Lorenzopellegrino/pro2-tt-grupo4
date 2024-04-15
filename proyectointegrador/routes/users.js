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

router.get('/login', userscontroller.login);

router.get('/register', userscontroller.register);

router.get('/profile', userscontroller.profile);

router.get('/edit', userscontroller.edit);

module.exports = router;