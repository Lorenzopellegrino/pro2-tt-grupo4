const express = require('express');
const router = express.Router();
const userscontroller = require('../controllers/users');

router.get('/login', userscontroller.login);

router.get('/register', userscontroller.register);

router.get('/profile', userscontroller.profile);

router.get('/edit', userscontroller.edit);

module.exports = router;