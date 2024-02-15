import 'dart:async';
import 'package:driver_app/Config/AllDimensions.dart';
import 'package:driver_app/Config/AllImages.dart';
import 'package:driver_app/Config/AllTitles.dart';
import 'package:driver_app/Config/Allcolors.dart';
import 'package:driver_app/model/LoginModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Config/routes/PageConstants.dart';

class OTPPage extends StatefulWidget {
  final LoginModel loginModel;
  const OTPPage({Key? key,required this.loginModel}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _otpTextEditingController = TextEditingController();
  StreamController<ErrorAnimationType> _errorController = StreamController<ErrorAnimationType>();

  _verifyOTP()async{
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.loginModel.verificationId.toString(),
          smsCode: _otpTextEditingController.text
      );
      await _auth.signInWithCredential(credential);
      // Navigator.pushNamedAndRemoveUntil(context, PageConstants.homeScreen, (route) => false);
      print("navigating to home screen");
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

                            Text("Enter OTP",style: TextStyle(fontSize: AllDimensions.twentyFour,fontWeight: FontWeight.bold),),
                            Text(AllTitles.otpSentDesc),

                            SizedBox(height: AllDimensions.eigth),

                            PinCodeTextField(
                              keyboardType: TextInputType.number,
                              cursorColor: Allcolors.blackColor,
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.slide,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.circle,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              // enableActiveFill: true,
                              errorAnimationController: _errorController,
                              controller: _otpTextEditingController,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  print("changing text: ${value.toString()}");
                                });
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              }, appContext: context,
                            ),

                            InkWell(
                              onTap: (){
                                _verifyOTP();
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: AllDimensions.sixteen,right: AllDimensions.sixteen,
                                    top: AllDimensions.twelve,bottom: AllDimensions.twelve),
                                decoration: BoxDecoration(
                                    color: Allcolors.blackColor,
                                    borderRadius: BorderRadius.circular(AllDimensions.eigth)
                                ),
                                child: Text("Submit",style: TextStyle(
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
}
