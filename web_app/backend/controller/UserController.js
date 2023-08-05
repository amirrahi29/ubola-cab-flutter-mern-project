const UserModel = require('../model/UserModel');

const register = async (req, res) => {
    try {

        const user_mobile = req.body.mobile;

        const user = new UserModel({
            mobile: user_mobile,
            dateCreate: Date().toString()
        });

        const checkUser = await UserModel.findOne({ "mobile": user_mobile });

        if (!checkUser) {
            const userData = await user.save();
            if (userData) {
                res.status(200).send({ success: true, msg: 'User added successfully.', data: userData });
            } else {
                res.status(200).send({ success: false, msg: 'User addition failed.', data: userData });
            }
        } else {
            res.status(200).send({ success: false, msg: 'User already added!' });
        }
    } catch (error) {
        res.status(400).send({ success: false, msg: error.message });
    }
}

const login = async (req, res) => {
    try {
        const user_mobile = req.body.mobile;

        const checkUser = await UserModel.findOne({ "mobile": user_mobile });

        if (checkUser) {
            res.status(200).send({ success: true, msg: 'User logged in successfully' });
        } else {
            res.status(200).send({ success: false, msg: 'Invalid user' });
        }
    } catch (error) {
        res.status(400).send({ success: false, msg: error.message });
    }
}

module.exports = {
    register,
    login
}