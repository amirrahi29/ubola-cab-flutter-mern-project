const express = require('express');
const user_route = express();

//bodyParser
const bodyParser = require('body-parser');
user_route.use(bodyParser.json());
user_route.use(bodyParser.urlencoded({extended:true}));

//controller
const userController = require('../controller/UserController');

//routes
user_route.post('/register',userController.register);
user_route.post('/login',userController.login);

module.exports = user_route;