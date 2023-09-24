import 'package:flutter/material.dart';
import 'package:user_app/Config/routes/PageConstants.dart';
import 'package:user_app/view/AuthScreens/AuthPage.dart';
import 'package:user_app/view/AuthScreens/OTPPage.dart';
import 'package:user_app/view/ErrorScreen.dart';
import 'package:user_app/view/HomeScreen.dart';
import 'package:user_app/view/SplashScreen.dart';

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
          return materialPageRoute(widget: OTPPage());
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