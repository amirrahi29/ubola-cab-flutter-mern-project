import 'package:driver_app/Config/AllDimensions.dart';
import 'package:driver_app/Config/AllTitles.dart';
import 'package:driver_app/Config/Allcolors.dart';
import 'package:driver_app/view_model/SplashViewModel.dart';
import 'package:flutter/material.dart';
import '../Config/AllImages.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashViewModel = Get.put(SplashViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashViewModel.checkPermission(context);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Allcolors.yellowColor,
            height: AllDimensions.infinity,
            width: AllDimensions.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[

                Positioned(
                  left: 50,
                    right: 50,
                    top:0,
                    bottom: 0,
                    child: Image.asset(AllImages.logoImage)
                ),

                Positioned(
                  left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(AllTitles.poweredTitle),
                    )
                )

              ],
            ),
          ),
        )
    );
  }
}
