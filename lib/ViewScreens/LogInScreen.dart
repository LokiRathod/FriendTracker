import 'package:altorumleren_friendtracke/Utils/Constants.dart';
import 'package:altorumleren_friendtracke/Utils/MyNavigator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String _emailID, _password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
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
              RaisedButton(onPressed: formValidator,
                color: Colors.green,
                child: Text(
                  Constants.login, style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 20.0,),
              FlatButton(onPressed: (){ MyNavigator.goToLogInScreen(context);}, child: Text(Constants.createAccout))
            ],
          ),
        ),
      ),
    );
  }

  void formValidator() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailID, password: _password)
          .then((FirebaseUser user) {
            MyNavigator.goToUserListScreen(context);
      })
          .catchError((e) {
            print(e);
      });
    }
  }

}
