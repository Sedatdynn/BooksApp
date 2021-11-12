const register = require('./auth/register');
const login = require('./auth/login');
const refreshToken = require('./auth/refreshToken');
const getUser = require('./getUser');
module.exports = {
    register: register,
    login:login,
    refreshToken: refreshToken,
    getUser:getUser
};