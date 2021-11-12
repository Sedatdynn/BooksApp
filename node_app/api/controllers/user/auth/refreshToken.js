const { Token } = require("../../../models/token");
const { User, userValidate } = require("../../../models/user");
const jwt = require("../../../../utils/jwtHelper");
const JWT = require("jsonwebtoken");
const errorJson = require("../../../../utils/error");

module.exports = async (req, res) => {
    const { error } = userValidate.token(req.body);

    if (error) {
        if (error.details[0].message.includes("refreshToken"))
          errorObject = { msg: "Please provide a refresh token to refresh!"};

        else if (error.details[0].message.includes("userId"))
          errorObject = { msg: "Please provide an user id!" };

        else
          errorObject = { msg: "Please provide all the required fields!" };

        
        return res.status(400).json(errorJson("Validation error!", errorObject.msg))
    }

    const userToken = await Token.findOne( { userId: req.body.userId } ).catch( (e) => {
        return res.status(500).json(errorJson(
            e, "An internal server error occurred, please try again."
        ))
    });

    if (String( userToken.refreshToken )  !== String( req.body.refreshToken ) ) {
        return res.status(404).json( errorJson( "Error", "User token could not found, please register" ) )
    }

    if( !(await JWT.verify(req.body.refreshToken, process.env.REFRESH_TOKEN_SECRET_KEY)) || userToken.refreshToken.experies <= Date.now() || !userToken.status ){
        await Token.updateOne( { _id: userToken._id }, {
            $set: { status: false, expires: Date.now() }
        }).catch( (e) => {
            return res.status(500).json( errorJson( e, 'A server error occured.'))
        })

        return res.status(403).json(errorJson( "403 error", "Refresh token is not valid, please log in again.") );
    }
    
    const accessToken = await jwt.signAccessToken(req.body.userId);
    const refreshToken = await jwt.signRefreshToken(req.body.userId);

    await Token.findOneAndUpdate( { userId: req.body.userId }, {
        $set: {
            refreshToken: refreshToken,
            createdAt: Date.now(),
            expires: Date.now() + 604800000,
            status: true
        }
    }).catch( (e) => {
        return res.status(500).json( errorJson(e, "A server error accured while updating the token.") )
    });
    
    return res.status(200).json( {token: accessToken, refreshToken: refreshToken, msg:"Successful"} );
    
};