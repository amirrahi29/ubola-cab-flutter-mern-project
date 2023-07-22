import 'package:flutter/material.dart';
import 'package:user_app/Config/routes/PageConstants.dart';
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