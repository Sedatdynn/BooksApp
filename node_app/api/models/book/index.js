const bookModel = require('./bookModel');

module.exports = {
    Book:bookModel.Book,
    bookSchema: bookModel.bookSchema,
};