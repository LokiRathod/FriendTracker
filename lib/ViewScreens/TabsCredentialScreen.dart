import 'package:altorumleren_friendtracke/ViewScreens/LogInScreen.dart';
import 'package:altorumleren_friendtracke/ViewScreens/RegisterScreen.dart';
import 'package:altorumleren_friendtracke/ViewScreens/SignInScreen.dart';
import 'package:flutter/material.dart';

class TabsCredentialScreen extends StatefulWidget {
  @override
  _TabsCredentialScreenState createState() => _TabsCredentialScreenState();
}

class _TabsCredentialScreenState extends State<TabsCredentialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: new PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                color: Colors.green,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: new Container(
                        height: 80.0,
                      )),
                      new TabBar(
                        tabs: [
                          new Text("SIGN IN"),
                          new Text("SIGN UP")],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(children: [
              new LogInScreen(),
              new RegisterScreen(),
            ]),
          ),
    );
  }
}
