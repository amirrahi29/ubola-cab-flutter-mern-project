const express = require('express');
const user_route = express();

//bodyParser
const bodyParser = require('body-parser');
user_route.use(bodyParser.json());
user_route.use(bodyParser.urlencoded({extended:true}));

//controller
const notificationController = require('../controller/NotificationController');

//routes
user_route.get('/notify',notificationController.notify);

module.exports = user_route;