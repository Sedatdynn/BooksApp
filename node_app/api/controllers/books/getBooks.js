const { Book } = require('../../models/book');
const errorJson = require('../../../utils/error');

module.exports = async (req, res) => {
    const PAGE_SIZE = req.query.limit;          

    let skip = (req.query.page - 1) * PAGE_SIZE;


    const books = await Book.find().sort( { _id: -1 } ).skip( skip ).limit(PAGE_SIZE).catch( (e) => {
        return res.status(500).errorJson(errorJson(e , 'Error occured while getting books from db.'));
    })

    return res.status(200).send( { books } );
}