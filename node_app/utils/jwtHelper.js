const JWT = require('jsonwebtoken');
require('dotenv').config();

module.exports = {
    signAccessToken: async (userId) => {
        const authorization = await JWT.sign({_id: userId}, process.env.JWT_SECRET_KEY,{expiresIn: '5h'});
        return authorization;
    },
    signRefreshToken: async (userId) => {
        const refreshToken = await JWT.sign(
            {_id:userId},
            process.env.REFRESH_TOKEN_SECRET_KEY,
            {
                expiresIn:'7d',
            }
        );
        return refreshToken;
    },
}