import 'package:flutter/material.dart';
import 'package:football_app/back_end/models/team_model.dart';

import './team_details_widget.dart';

Widget teamItemBuilder(Team team, BuildContext context) {
  return Card(
    color: Colors.orange.shade400,
    elevation: 10.0,
    child: ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TeamDetailsWidget(team: team);
        }));
      },
      leading: Text("${team.name}"),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              "${team.points}",
              style: TextStyle(color: Colors.white),
            )),
      ),
    ),
  );
}
