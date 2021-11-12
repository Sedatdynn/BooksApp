const express = require("express");
const router = express.Router();
require("express-async-errors");
const user = require("./user");
const book = require('./book');

router.use('/user', user);
router.use('/book', book);

module.exports = router;