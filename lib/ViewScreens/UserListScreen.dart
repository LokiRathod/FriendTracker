import 'package:altorumleren_friendtracke/Utils/Constants.dart';
import 'package:altorumleren_friendtracke/Utils/MyNavigator.dart';
import 'package:altorumleren_friendtracke/ViewScreens/MapScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

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
      appBar: AppBar(
        title: Text(Constants.members),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            tooltip: 'Logout',
            icon: Icon(
              Icons.add_to_home_screen,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                MyNavigator.goToLogInScreen(context);
              }).catchError((e) {
                print(e);
              });
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("members").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading... !!!");
          } else {
            return new ListView(
              children: snapshot.data.documents.map((document) {
                return ListTile(
                  leading: Icon(
                    Icons.account_circle, size: 45.0, color: Colors.green,),
                  title: Text(document["name"]),
                  subtitle: Text(document["email"]),
                  trailing: Icon(Icons.chevron_right,),

                  onTap: () {
                    String lat = document["latitude"].toString();
                    String lng = document["longitude"].toString();
                    String name = document["name"].toString();
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => MapScreen(lat,lng,name)),);
                  },
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
