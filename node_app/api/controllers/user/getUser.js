const { User } = require('../../models/user');
const errorJson = require('../../../utils/error');
require('dotenv').config();

module.exports = async (req, res) => {
	let user = await User.findById(req.user._id)
		.catch((e) => {
			return res.status(500).json( errorJson(e.message,'An interval server error occurred while getting your information, please try again.'));
		});

    return res.status(200).json({
        resultMessage: 'Your information has gotten successfully.',
        user: user
    });
	
};