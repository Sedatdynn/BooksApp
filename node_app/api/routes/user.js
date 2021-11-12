const express = require('express');
const router = express.Router();

const userController = require('../controllers/user');
const duplicateEmail = require('../middleware/auth/checkEmail');


router.get("/", userController.getUser); 

router.post("/register", [duplicateEmail], userController.register);
router.post('/login', userController.login);
router.post('/refreshToken', userController.refreshToken);

module.exports = router;