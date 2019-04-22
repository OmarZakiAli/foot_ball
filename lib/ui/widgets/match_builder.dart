import 'package:football_app/back_end/models/matches_model.dart';
import 'package:flutter/material.dart';
Widget matchItemByilder(Matchx mat) {
return ListTile(
  leading: Text("${mat.home}"),
  trailing:Text("${mat.away}") ,
  title:Text("${mat.time}") ,
);
}




