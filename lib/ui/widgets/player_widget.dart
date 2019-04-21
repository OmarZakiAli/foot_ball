import 'package:football_app/back_end/models/player_model.dart';
import 'package:flutter/material.dart';

Widget playerItemByilder(Player player) {
  return ListTile(
    leading: Text("${player.name}"),
  );
}