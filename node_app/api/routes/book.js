const express = require('express');
const router = express.Router();

const bookController = require('../controllers/books');

router.get("/",bookController.getBook);
router.get("/search", bookController.searchBook);
router.post("/scrape", bookController.scrapeBook);

module.exports = router;