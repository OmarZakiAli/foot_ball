import 'dart:math';

import 'package:football_app/back_end/models/matches_model.dart';
import 'package:football_app/back_end/models/results_model.dart';
import 'package:football_app/back_end/models/standing_model.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';

Widget resultItemBuilder(Result result,BuildContext context) {
  return Card(
      child: Container(
        height: 45,
        child: ListTile(
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

