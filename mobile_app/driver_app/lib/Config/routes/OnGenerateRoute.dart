import 'package:driver_app/model/LoginModel.dart';
import 'package:driver_app/view/AuthScreens/AuthPage.dart';
import 'package:driver_app/view/AuthScreens/OTPPage.dart';
import 'package:driver_app/view/ErrorScreen.dart';
import 'package:driver_app/view/HomeScreen.dart';
import 'package:driver_app/view/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'PageConstants.dart';

class OnGenerateRoute{

  static Route<dynamic> routes(RouteSettings settings){

    var args = settings.arguments;

    switch(settings.name){
      case PageConstants.splashScreen:
        {
          return materialPageRoute(widget: SplashScreen());
        }
      case PageConstants.homeScreen:
        {
          return materialPageRoute(widget: HomeScreen());
        }
      case PageConstants.authScreen:
        {
          return materialPageRoute(widget: AuthPage());
        }
      case PageConstants.otpScreen:
        {
         if(args is LoginModel){
           return materialPageRoute(widget: OTPPage(loginModel: args,));
         }else{
           return materialPageRoute(widget: ErrorScreen());
         }
        }
      default:
        {
          return materialPageRoute(widget: ErrorScreen());
        }
    }
  }
}

MaterialPageRoute materialPageRoute({required Widget widget}){
  return MaterialPageRoute(builder: (_)=>widget);
}