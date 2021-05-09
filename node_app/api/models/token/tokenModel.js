const mongoose = require('mongoose');

const tokenSchema = mongoose.Schema({
    userId: {type:mongoose.Schema.Types.ObjectId, ref:'User'},
    refreshToken: {type:String, required:true},
    expires: {type:Date, required:true},
    createdAt: {type:Date, required:true},
    status: {type:Boolean , required:true}
});

const Token = mongoose.model('Token',tokenSchema);

module.exports = {
    Token: Token,
    tokenSchema: tokenSchema
};