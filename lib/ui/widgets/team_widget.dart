import 'package:flutter/material.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
Widget teamItemByilder(Team team) {
  return Card(
    color: Colors.orange.shade400,
    elevation: 10.0,
    child: ListTile(
      title: Text("${team.name}"),
      leading: Container(
        width: 40,
        height: 40,
        child: getSvgPicture(team.photoUrl)
      ),
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



getSvgPicture(String url){
  var widget;
  try{
    widget= SvgPicture.network(url,width: 39,height: 39,);

  }catch(e){
    widget= Container(
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
