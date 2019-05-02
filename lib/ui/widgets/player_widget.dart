import 'package:football_app/back_end/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';


Widget playerItemBuilder(Player player) {
  return Card(
    elevation: 5,
    child: ListTile(
      leading: Text(
        "${player.name}",
        style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
      ),
      trailing: CircleAvatar(
        child: Text("${player.numGoals}",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow.shade800,
      ),
    ),
  );
}
