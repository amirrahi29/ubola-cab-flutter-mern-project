const express = require('express');
const app = express();

//dotenv
require('dotenv').config();

//mongoose
const mongoose = require('mongoose');
mongoose.connect('mongodb+srv://ubola:ps123456@ubolacluster.tfw22hc.mongodb.net/ubola');

mongoose.connection.once('open',()=>{
    console.log('mongoose connected');
});

mongoose.connection.on('error',()=>{
    console.log('Mongoose connection failed '+error);
});

//user route
const userRoute = require('./route/UserRoute');
app.use('/api',userRoute);

//notification route
const notifyRoute = require('./route/NotificationRoute');
app.use('/api',notifyRoute);

//server
app.listen(process.env.PORT,()=>{
    console.log(`Server is running on ${process.env.PORT}`);
});