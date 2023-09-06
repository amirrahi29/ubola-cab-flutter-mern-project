const fcm_key = require('../config/fcm_key.json');
const FCM = require('fcm-node');

const notify = async (req, res) => {
   var fcm = new FCM(fcm_key);

   var message = {
    to:'eS591fIbSRODli1ARikbhp:APA91bFZm97poNtlAv7ecnnpp5cnoLc9Xpp_OuuYxoXN7LtwKKdHuhXFY5rQvSlBoKS5WUpOg3kb11CaBQDZc0NWwvij-vSE44QlA9YEseOz54tVlQFtDLFnOroX3KkSn88ymraZ0tBU',
    notification:{
        title:"title 2 demo",
        body:"body 2 demo"
    }
   };

   fcm.send(message,function (err,response){
    if(err){
        console.log('Error sending fcm message'+err);
    }else{
        console.log("Sent with message id: "+JSON.stringify(response));
    }
   })

}


module.exports = {
    notify,
}