const express = require('express');
const router = express.Router();

const userController = require('../controllers/user');
const duplicateEmail = require('../middleware/auth/checkEmail');

router.post("/", [duplicateEmail], userController.register);
router.post('/login', userController.login);
module.exports = router;