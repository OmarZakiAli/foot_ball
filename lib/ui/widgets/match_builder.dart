import 'package:football_app/back_end/models/matches_model.dart';
import 'package:football_app/back_end/models/standing_model.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';

Widget matchItemByilder(Matchx mat) {
  return Card(
      child: Container(
    height: 45,
    child: Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Row(
            children: <Widget>[
              Container(
                child: getSvgPicture(mat.homeId)?? CircularProgressIndicator(),
                height: 40,
                width: 40,
              ),
              Text("${mat.home}")
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Center(child: Text(mat.time)),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Row(
            children: <Widget>[
              Container(
                child: getSvgPicture(mat.awayId)?? CircularProgressIndicator(),
                height: 40,
                width: 40,
              ),
              Text("${mat.away}")
            ],
          ),
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
