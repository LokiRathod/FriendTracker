import 'package:altorumleren_friendtracke/ViewScreens/LogInScreen.dart';
import 'package:altorumleren_friendtracke/ViewScreens/RegisterScreen.dart';
import 'package:altorumleren_friendtracke/ViewScreens/TabsCredentialScreen.dart';
import 'package:altorumleren_friendtracke/ViewScreens/UserListScreen.dart';
import 'package:flutter/material.dart';


class MyNavigator  {

  // Go to Register Screen
  static void goToRegisterScreen(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return RegisterScreen();
      },
    ));
  }

  // Go to LogIn Screen
  static void goToLogInScreen(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return LogInScreen();
      },
    ));
  }

  // Go to LogIn Screen
  static void goToTabCredentialsScreen(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return TabsCredentialScreen();
      },
    ));
  }

  // Go to user list Screen
  static void goToUserListScreen(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return UserListScreen();
      },
    ));
  }


}