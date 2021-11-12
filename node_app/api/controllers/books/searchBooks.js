const Book = require('../../models/book');
const errorJson = require('../../../utils/error');

module.exports = async (req, res) => {
    const result = Book.find( { book_name:`/^${req.body.name}/i` } ).catch( (e) => {
        return res.status(500).send( errorJson(e, "An unexpected error occured while filtering db.") )
    });

    return res.status(200).send( result );
}