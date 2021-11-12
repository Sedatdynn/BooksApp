const express = require('express');
const router = express.Router();

const bookController = require('../controllers/books');

router.get("/",bookController.getBooks);
router.get("/search", bookController.searchBooks);
router.post("/scrape", bookController.scrapeBooks);

module.exports = router;