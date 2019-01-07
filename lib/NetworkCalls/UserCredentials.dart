import 'package:altorumleren_friendtracke/Utils/Constants.dart';
import 'package:altorumleren_friendtracke/Utils/MyNavigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserCredentials {

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createNewUser(user, context) async {
    if(isLoggedIn()) {
      Firestore.instance.collection('/members').add({
        'email' : user.email,
      //  'name' : user.name,
        'userId' : user.uid,
      //  'latitude' : user.latitude,
      //  'longitude' : user.longitude,
      //  'updatedAt' : user.updatedAt,
      }).then((value) { MyNavigator.goToUserListScreen(context);
      }).catchError((e) {});
    } else {
      print('You need to be logged in');
    }

  }
}
