const { Book } = require('../../models/book');
const errorJson = require('../../../utils/error');

module.exports = async (req, res) => {
    const books = await Book.find().sort( { length: -1 } ).limit(25).catch( (e) => {
        return res.status(500).errorJson(errorJson(e , 'Error occured while getting books from db.'));
    })

    return res.status(200).send( { data: books } );
}