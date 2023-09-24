import 'package:driver_app/Config/AllDimensions.dart';
import 'package:driver_app/Config/AllImages.dart';
import 'package:driver_app/Config/Allcolors.dart';
import 'package:driver_app/Config/routes/PageConstants.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                                Navigator.pushNamed(context, PageConstants.otpScreen);
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
}
