import 'package:altorumleren_friendtracke/Utils/Constants.dart';
import 'package:altorumleren_friendtracke/Utils/MyNavigator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _userName, _emailID, _password, _confirmPassword, _userId;
  final formKey = GlobalKey<FormState>();


  var currentLocation;

  @override
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currLoc){
      setState(() {
        currentLocation = currLoc;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text(
                Constants.createAccout,
                style: TextStyle(fontSize: 25.0),
              ),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: Constants.userName,
                          labelText: Constants.userName,
                        ),
                        validator: (name) =>
                            name.length <= 3 ? Constants.userNameError : null,
                        onSaved: (name) => _userName = name,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: Constants.emailID,
                          labelText: Constants.emailID,
                        ),
                        validator: (mailID) => !mailID.contains("@")
                            ? Constants.emailIDError
                            : null,
                        onSaved: (mailID) => _emailID = mailID,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: Constants.password,
                          labelText: Constants.password,
                        ),
                        validator: (password) => password.length <= 7
                            ? Constants.passwordError
                            : null,
                        onSaved: (password) => _password = password,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: Constants.confirmPassword,
                          labelText: Constants.confirmPassword,
                        ),
                        validator: (confirmPassword) =>
                            confirmPassword.length <= 7
                                ? Constants.confirmPasswordError
                                : null,
                        onSaved: (confirmPassword) =>
                            _confirmPassword = confirmPassword,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                onPressed: formValidator,
                color: Colors.green,
                child: Text(
                  Constants.register,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0,),
              FlatButton(onPressed: (){ MyNavigator.goToLogInScreen(context);}, child: Text(Constants.alreadyAccout))
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
      FirebaseAuth.instance.currentUser().then((user){
        _userId = user.uid;
      });
      //FirebaseAuth
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _emailID, password: _password)
          .then((signedUser) {

        Firestore.instance.collection("members").document().setData({
          'email': _emailID,
          'name': _userName,
          'userId': _userId,
          'latitude': currentLocation.latitude,
          'longitude': currentLocation.longitude,
          'updatedAt':"",

        }).then((data){
          MyNavigator.goToUserListScreen(context);
        });

      }).catchError((e) {
        print(e);
      });
    }
  }
}
