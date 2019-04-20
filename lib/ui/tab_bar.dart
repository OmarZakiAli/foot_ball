import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../back_end/models/player_model.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:football_app/blocs/scorer_bloc/scorers_bloc.dart';
import 'package:football_app/blocs/standing_bloc/events.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:football_app/blocs/scorer_bloc/events.dart';
import 'package:football_app/blocs/scorer_bloc/states.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTabBarView extends StatefulWidget {
  @override
  MyTabBarViewState createState() => MyTabBarViewState();
}

class MyTabBarViewState extends State<MyTabBarView> {
  @override
  Widget build(BuildContext context) {
    return TabsBuilder();
  }
}

class TabsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StandingBloc _sbloc = BlocProvider.of<StandingBloc>(context);
    final ScorerBloc _s2bloc = BlocProvider.of<ScorerBloc>(context);

    return TabBarView(
      children: <Widget>[
        BlocBuilder(
          bloc: _sbloc,
          builder: (BuildContext con, StandingState st) {
            if (_sbloc.currentState is UnloadedSYet) {
              return Center(child: CircularProgressIndicator());
            } else if (_sbloc.currentState is ErrorState) {
              return Text("error loading");
            } else if (_sbloc.currentState is StandingLoaded) {
              return ListView.builder(
                  itemCount: StandingLoaded.standing.table.length,
                  itemBuilder: (BuildContext context, int position) {
                    Team team = StandingLoaded.standing.table[position];
                    return teamItemByilder(team);
                  });
            }
          },
        ),
        BlocBuilder(
          bloc: _s2bloc,
          builder: (BuildContext con, ScorerState st) {
            if (_s2bloc.currentState is UnloadedPYet) {
              return Center(child: CircularProgressIndicator());
            } else if (_s2bloc.currentState is ErrorpState) {
              return Text("error loading");
            } else if (_s2bloc.currentState is ScorersLoaded) {
              return ListView.builder(
                  itemCount: ScorersLoaded.scorers.scorers.length,
                  itemBuilder: (BuildContext context, int position) {
                    Player player = ScorersLoaded.scorers.scorers[position];
                    return playerItemByilder(player);
                  });
            }
          },
        )
      ],
    );
  }
}

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

Widget playerItemByilder(Player player) {
  return ListTile(
    leading: Text("${player.name}"),
  );
}


getSvgPicture(String url){
  try{
    return SvgPicture.network(url,width: 39,height: 39,);

  }catch(e){
    return Container(
      width: 39,
      height: 39,
    );
  }
}
