const errorJson = require('../../../utils/error');
const axios = require('axios');
const cheerio = require('cheerio');
const {Book} = require('../../models/book');

/** 
 * Scrape books source links from home page end return them in the list.
 * 
 * @param {int} startPage - the start page number
 * @param {int} endPage - the last page number
*/
const scrapePages = async (startPage = 1 , endPage = 1) => {
    var sourceLinks = [];
    
    for(startPage; startPage <= endPage; startPage++) {

        let url = `https://www.kitapyurdu.com/index.php?route=product/category&filter_category_all=true&path=1&filter_in_stock=1&sort=publish_date&order=DESC&page=${startPage}`;

        let html_source = await axios.get(url);

        let $ = await cheerio.load(html_source.data);

        $('.name.ellipsis > a').each((i, elem) => {
            sourceLinks.push( $(elem).attr('href') );
        });

    }

    return sourceLinks;
    
}

/**
 * Scrape book details from source link and append to dict. 
 * 
 * @param {Array} sourceLinks - Contains source links
 */
const scrapeDetails = async (sourceLinks) => {

    var loop_data = { "books":[] }
    for (let i = 0; i < sourceLinks.length; i++) {
        
        let html_source = await axios.get( sourceLinks[i] );

        let $ = cheerio.load( html_source.data );

        let js_data = {}

        let image_src = $('.book-front > a > img').attr('src');

        let book_name = $('.pr_header__heading').text();

        let author_name = $('.pr_producers__link').eq(0).text();

        let publisher_name = $('.pr_producers__link').eq(1).text();

        let book_short_info = $('.info__text').text();
        
        let orginal_price = $('.pr_price__strikeout-list').text();

        let discount_price = $('.price__item').text();

        let discount_amount = "%" +  $('.pr_discount__amount').text();

        let to_book_details = $('.attributes > table > tbody').find('tr');

        book_details = [];
        to_book_details.each( (i, element) => {

            let key = $(element).find('td').eq(0).text().replace(':','')
            
            let value = $(element).find('td').eq(1).text();
            
            book_details.push(key +  " " + value)
            

        });

        $('.name.ellipsis > a').each((i, elem) => {
            sourceLinks.push( $(elem).attr('href') );
        });


        js_data['image_src'] = image_src
        js_data['book_name'] = book_name
        js_data['author_name'] = author_name
        js_data['publisher_name'] = publisher_name
        js_data['short_info'] = book_short_info
        js_data['book_details'] =  book_details
        js_data['orginal_price'] = orginal_price
        js_data['discount_price'] = discount_price
        js_data['discount_amount'] = discount_amount

        loop_data['books'].push( js_data )
       
    }

    return loop_data['books']
}

module.exports = async (req, res) => {
    let {startPage, endPage} = req.params

    var sourceLinks;
    if (startPage){
        sourceLinks = await scrapePages(startPage, endPage);
    } else {
        sourceLinks = await scrapePages(1,1)
    }

    let bookDetails = await scrapeDetails(sourceLinks);

    const result = await Book.collection.insertMany( bookDetails, { ordered: true } ).catch( (e) => {
        return res.status(500).errorJson(errorJson(e, 'An interval server error occurred while saving books into db.'))
    })

    return res.status(200).send( {'msg': result.insertedCount + " documents were inserted."} )

};

/*const test = async () => {

    let sourceLinks = await scrapePages(1, 1);

    let scrapeDetail = await scrapeDetails(sourceLinks);

    console.log(scrapeDetail[0])
}

test();*/