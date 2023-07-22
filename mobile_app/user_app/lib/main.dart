import 'package:flutter/material.dart';
import 'package:user_app/Config/AllTitles.dart';
import 'package:user_app/Config/routes/OnGenerateRoute.dart';
import 'package:user_app/view/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AllTitles.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context){
          return SplashScreen();
        }
      },
      onGenerateRoute: OnGenerateRoute.routes,
    );
  }
}