import 'package:football_app/back_end/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';


Widget playerItemBuilder(Player player) {
  return Card(
    elevation: 5,
    child: ListTile(
      leading: Text(
        "${player.name}",
        style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
      ),
      title:  Container(
          child: getSvgPicture(player.teamId)?? CircularProgressIndicator(),
          height: 40,
          width: 40,),
      trailing: CircleAvatar(
        child: Text("${player.numGoals}",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow.shade800,
      ),
    ),
  );
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
  if(widget!=null){
  return widget;}
  else return  Container(
    width: 39,
    height: 39,
    child: Center(
      child: CircleAvatar(
        backgroundColor: Colors.black,
      ),
    ),
  );
}