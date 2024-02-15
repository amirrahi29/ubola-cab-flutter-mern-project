import 'package:driver_app/Config/AllDimensions.dart';
import 'package:driver_app/Config/AllImages.dart';
import 'package:driver_app/Config/Allcolors.dart';
import 'package:driver_app/Config/routes/PageConstants.dart';
import 'package:driver_app/model/LoginModel.dart';
import 'package:driver_app/view_model/AuthViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final _authViewModel = Get.put(AuthViewModel());
  final _phoneNumberController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationID = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      if(_authViewModel.originalList.isNotEmpty){
        phoneNumberAutoPickerPopUp(context);
      }
    });
  }

  _sendOTP()async{
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${_phoneNumberController.text}",
        verificationCompleted: (PhoneAuthCredential credential)async {
          await _auth.signInWithCredential(credential);

          // LoginModel loginModel = new LoginModel();
          // loginModel.phoneNumber = _phoneNumberController.text;
          // loginModel.verificationId = verificationID;
          // //navigate
          // Navigator.pushNamed(context, PageConstants.otpScreen,
          // arguments: loginModel);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;

          LoginModel loginModel = new LoginModel();
          loginModel.phoneNumber = _phoneNumberController.text;
          loginModel.verificationId = verificationID;
          //navigate
          Navigator.pushNamed(context, PageConstants.otpScreen,
              arguments: loginModel);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationID = verificationId;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Allcolors.amberYellowColor,
          body: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[

              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(AllDimensions.thirtyTwo),
                    height: AllDimensions.twoHundred,
                      width: AllDimensions.twoHundred,
                      child: Image.asset(AllImages.logoImage)
                  ),
              ),

              Positioned(
                bottom: 0,
                  left: 0,
                  right: 0,
                  child: Card(
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text("Login",style: TextStyle(fontSize: AllDimensions.twentyFour,fontWeight: FontWeight.bold),),
                            Text("Please enter phone to proceed"),

                            SizedBox(height: AllDimensions.eigth),

                            Container(
                              padding: EdgeInsets.all(AllDimensions.eigth),
                              height: AllDimensions.fifty,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Allcolors.greyColor
                                ),
                                borderRadius: BorderRadius.circular(AllDimensions.eigth)
                              ),
                              child: Row(
                                children: <Widget>[

                                  Text("+91",style: TextStyle(fontWeight: FontWeight.bold,fontSize: AllDimensions.sixteen),),

                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: AllDimensions.eigth,right: AllDimensions.eigth,),
                                      child: TextField(
                                        controller: _phoneNumberController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(fontSize: AllDimensions.sixteen,fontWeight: FontWeight.bold),
                                        cursorColor: Allcolors.blackColor,
                                        decoration: InputDecoration(
                                          hintText: 'Enter phone number',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(bottom: AllDimensions.twelve)
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),

                            SizedBox(height: AllDimensions.eigth),

                            InkWell(
                              onTap: (){
                                _sendOTP();
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: AllDimensions.sixteen,right: AllDimensions.sixteen,
                                top: AllDimensions.twelve,bottom: AllDimensions.twelve),
                                decoration: BoxDecoration(
                                  color: Allcolors.blackColor,
                                  borderRadius: BorderRadius.circular(AllDimensions.eigth)
                                ),
                                child: Text("Send OTP",style: TextStyle(
                                    color: Allcolors.whiteColor),),
                              ),
                            )

                          ],
                        )
                    ),
                  )
              )

            ],
          ),
        )
    );
  }
  void phoneNumberAutoPickerPopUp(BuildContext context){

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return Scaffold(
            backgroundColor: Allcolors.transparentColor,
            body: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: AllDimensions.sixteen,right: AllDimensions.sixteen),
                    padding: EdgeInsets.only(left: AllDimensions.eigth,right: AllDimensions.eigth),
                    decoration: BoxDecoration(
                      color: Allcolors.whiteColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Container(
                          margin: EdgeInsets.all(AllDimensions.eigth),
                          padding: EdgeInsets.only(left: AllDimensions.twelve,right: AllDimensions.twelve),
                          child: Text("SignIn with",
                            style: TextStyle(fontSize: AllDimensions.twenty,fontWeight: FontWeight.bold,
                                color: Allcolors.greyColor),),
                        ),

                        SizedBox(height: AllDimensions.eigth,),

                        for(int i = 0; i<_authViewModel.originalList.length; i++)
                          InkWell(
                            onTap: (){
                              _phoneNumberController.text = _authViewModel.originalList[i];
                              Navigator.pop(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                                Container(
                                  margin: EdgeInsets.all(AllDimensions.eigth),
                                  padding: EdgeInsets.all(AllDimensions.twelve),
                                  child: Text(_authViewModel.originalList[i],
                                    style: TextStyle(fontSize: AllDimensions.sixteen),),
                                ),
                                i == _authViewModel.originalList.length - 1?SizedBox.shrink():Divider()

                              ],
                            ),
                          ),

                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(AllDimensions.eigth),
                            padding: EdgeInsets.only(left: AllDimensions.twelve,right: AllDimensions.twelve),
                            child: Text("None of the above",
                            style: TextStyle(fontSize: AllDimensions.twenty,fontWeight: FontWeight.bold,
                            color: Allcolors.blueColor),),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );

  }
}
