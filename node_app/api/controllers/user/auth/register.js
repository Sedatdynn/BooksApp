const bcrypt = require("bcryptjs");
const { User, userValidate } = require("../../../models/user");
const generateRandomCode = require("../../../../utils/generate-random-code");
const errorJson = require("../../../../utils/error");
let errorObject = {}

module.exports = async (req,res) => {
    const {error} = userValidate.register(req.body);
    if(error){
        if (error.details[0].message.includes("email"))
            errorObject = {
            msg:"Please provide a valid email!"
            }
        else if (error.details[0].message.includes("password"))
      errorObject = {
        msg: "Please provide a password that longer than 6 letters and shorter than 20 letters.",
      };
    else if (error.details[0].message.includes("username"))
      errorObject = {
        msg: "Please provide a name that longer than 3 letters and shorter than 30 letters.",

      };
    else
        errorObject = {
        msg:"Please provide all the required fields!"
        }

    return res.status(400).json(errorJson("Validation error!", errorObject.msg))
    }

    const hash = await bcrypt.hash(req.body.password, 10);

    let username, unique, tempName;

    req.body.username.includes(" ") ? tempName = req.body.username.trim().split(" ").slice(0, 1).join("").toLowerCase().trim() :
        tempName = req.body.username.toLowerCase().trim();

    do {
        username = tempName + generateRandomCode();
        unique = await User.countDocuments({username:username}).catch((err) => {
            return res.status(500).json(errorJson(
                err, "An internal server error occurred, please try again."
            ))
        });
    } while (unique);

    let user = new User({
        email:req.body.email.trim(),
        password:hash,
        username:username,
        lastLogin: Date.now(),
    });

    user = await user.save().catch(( err) => {
        return res.status(500).json(errorJson(
            err,"An interval server error occurred while registering you, please try again."
        ));
    });

    return res.status(200).json({
        id: user._id,
        email:user.email,
    });

};