import 'package:altorumleren_friendtracke/Utils/UserCredentials.dart';
import 'package:altorumleren_friendtracke/Utils/MyNavigator.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogIn = false;

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
    print("isLogIn: ${isLogIn}");
    Timer(
        Duration(seconds: 3),
        () => isLogIn
            ? MyNavigator.goToUserListScreen(context)
            : MyNavigator.goToLogInScreen(context));
  }


  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogIn = prefs.getBool("isLogIn") ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.add_location,
                          color: Colors.green,
                          size: 60.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
