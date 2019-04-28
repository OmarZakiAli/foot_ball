import 'package:flutter/material.dart';
import 'package:football_app/back_end/models/team_model.dart';

class TeamDetailsWidget extends StatelessWidget {
 final Team team;

  TeamDetailsWidget({this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          title: Text(
            "${team.name}",
            style: TextStyle(color: Colors.black,fontSize: 20),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(5.0),
          color: Colors.lightGreenAccent,
           child:ListView(children: <Widget>[


           ],) ,
        ));
  }
}

