const express = require('express');
const userscontroller = require('../controllers/users');
const router = express.Router();

router.get('/login', userscontroller.login);

router.get('/register', userscontroller.register);

router.get('/profile', userscontroller.profile);

router.get('/edit', userscontroller.edit);

module.exports = router;