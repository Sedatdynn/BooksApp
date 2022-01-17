const JWT = require("jsonwebtoken");
const mongoose = require("mongoose");
const { User } = require("../../models/user");
const { Token } = require("../../models/token");
const errorJson = require("../../../utils/error");

module.exports = async (req, res, next) => {
    //.. check token here.s
    let token = req.headers["x-access-token"]
    if(!token){
        return res.status(403).send( {"msg":"No token provided!"} );

    }
    
    JWT.verify(token, process.env.REFRESH_TOKEN_SECRET_KEY, (err, decoded) => {
        if (err){
        console.log(err)
        }
    
        req.userId = decoded.id
    next();
    
    });


};