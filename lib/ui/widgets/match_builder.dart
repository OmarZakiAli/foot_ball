import 'dart:math';

import 'package:football_app/back_end/models/matches_model.dart';
import 'package:football_app/back_end/models/standing_model.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';

Widget matchItemBuilder(Matchx mat) {
  return Card(
      child: Container(
    height: 45,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:4.0),
          child: Text("${formatString(mat.home)}"),
        ),
        Center(child: Text(mat.time)),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text("${formatString(mat.away)}"),
        )
      ],
    ),
  ));

}

formatString(String team){
  if(team.length<=12){
    return team;
  }else{
    return team.substring(0,12);
  }

}

