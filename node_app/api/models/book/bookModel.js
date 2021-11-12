const mongoose = require('mongoose');

const bookSchema = mongoose.Schema({

    image_src: {type:String},
    book_name: {type:String},
    author_name: {type:String},
    publisher_name: {type:String},
    short_info: {type:String},
    book_details: [String],
    orginal_price: {type:String},
    discount_price: {type:String},
    discount_amount: {type:String}
      
},{timestamps:true});

const Book = mongoose.model('Book', bookSchema);

module.exports = {
    Book:Book,
    bookSchema:bookSchema
}