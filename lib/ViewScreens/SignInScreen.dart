import 'package:altorumleren_friendtracke/Utils/Constants.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  String _emailID, _password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: ListView(
              reverse: true,
              children: <Widget>[
                Text(Constants.appName, style: TextStyle(fontSize: 25.0),),
                Container(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 15.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: Constants.emailID,
                            labelText: Constants.emailID,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),),
                          validator: (mailID) =>
                          !mailID.contains("@") ? Constants.emailIDError : null,
                          onSaved: (mailID) => _emailID = mailID,
                        ),

                        SizedBox(height: 15.0),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: Constants.password,
                            labelText: Constants.password,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          validator: (password) =>
                          password.length <= 7
                              ? Constants.passwordError
                              : null,
                          onSaved: (password) => _password = password,
                        ),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25.0,),
                RaisedButton(onPressed: () {},
                  color: Colors.green,
                  child: Text(
                    Constants.login, style: TextStyle(color: Colors.white),),
                )
              ].reversed.toList(),
            ),
          ),
        ),
      ),
    );
  }
}