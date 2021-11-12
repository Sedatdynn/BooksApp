const Joi = require('joi');
Joi.objectId = require('joi-objectid')(Joi);

function validateRegister(user){
    const schema = Joi.object({
        email:Joi.string().trim().email().min(3).required(),
        password: Joi.string().min(6).max(20).required(),
        username:Joi.string().min(3).max(24).required(),
    })
    return schema.validate(user);
}

function validateUserLogin(user){
    const schema = Joi.object({
        email: Joi.string().trim().email().min(3).required(),
        password: Joi.string().min(6).max(20).required(),
    });
    return schema.validate(user);
}

function validateRefreshToken(data){
    const schema = Joi.object({
        refreshToken: Joi().string().min(1).required(),
        userId: Joi.objectId().required()
    });

    return schema.validate(data);
}

module.exports = {
    register:validateRegister,
    login: validateUserLogin,
    token: validateRefreshToken
}