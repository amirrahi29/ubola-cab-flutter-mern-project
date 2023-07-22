import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("ErrorScreen"),
          ),
        )
    );
  }
}
