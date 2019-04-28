import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/back_end/models/team_model.dart';

import './team_details_widget.dart';

Widget teamItemBuilder(Team team, BuildContext context) {
  return GestureDetector(
    child: Card(
    elevation: 5,
    child: ListTile(
      leading: Text(
        "${team.name}",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      trailing: CircleAvatar(
        child: Text("${team.points}",style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).accentColor,
      ),
    ),
  ),
  );
}
