import 'package:altorumleren_friendtracke/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MembersListScreen extends StatefulWidget {
  @override
  _MembersListScreenState createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {

  Future getMemberList() async {
    var fireStore = Firestore.instance;
    QuerySnapshot querySnapshot = await fireStore.collection(Constants.memberList).getDocuments();
    return querySnapshot.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading...!!"),
          );
        } else {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {

          });
        }
      },),
    );
  }
}
