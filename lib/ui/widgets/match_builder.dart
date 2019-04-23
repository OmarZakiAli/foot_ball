import 'dart:math';

import 'package:football_app/back_end/models/matches_model.dart';
import 'package:football_app/back_end/models/standing_model.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';

Widget matchItemBuilder(Matchx mat) {
  return Card(
      child: Container(
    height: 45,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: getSvgPicture(mat.homeId)?? CircularProgressIndicator(),
              height: 40,
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left:4.0),
              child: Text("${formatString(mat.home)}"),
            )
          ],
        ),
        Center(child: Text(mat.time)),
        Row(
          children: <Widget>[
            Container(
              child: getSvgPicture(mat.awayId)?? CircularProgressIndicator(),
              height: 40,
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text("${formatString(mat.away)}"),
            )
          ],
        )
      ],
    ),
  ));

}

getSvgPicture(int id) {
  var widget;
  String url = StandingLoaded.getPhotoById(id);
  try {
    widget = SvgPicture.network(
      url,
      width: 39,
      height: 39,
    );
  } catch (e) {
    widget = Container(
      width: 39,
      height: 39,
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
  return widget;
}


formatString(String team){
  if(team.length<=12){
    return team;
  }else{
    return team.substring(0,12);
  }
  
}

