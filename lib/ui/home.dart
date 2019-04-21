import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_app/ui/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:football_app/blocs/scorer_bloc/scorers_bloc.dart';
import 'package:football_app/blocs/standing_bloc/events.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:football_app/blocs/scorer_bloc/events.dart';
import 'package:football_app/blocs/scorer_bloc/states.dart';

class MyHome extends StatelessWidget {
  final StandingBloc standingBloc;
  final ScorerBloc scorerBloc;
  final Key key;

  const MyHome({this.standingBloc,this.scorerBloc,this.key}):super(key:key);

  @override
  Widget build(BuildContext context) {


    return BlocProviderTree(
      blocProviders: [
        BlocProvider<StandingBloc>(bloc: standingBloc),
        BlocProvider<ScorerBloc>(bloc: scorerBloc),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
           drawer: getDrawer(context),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "football app",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            backgroundColor: Colors.red,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "standing",
                ),
                Tab(
                  text: "scorers",
                )
              ],
            ),
          ),
          body: MyTabBarView(),
        ),
      ),
    );
  }
  getDrawer(BuildContext context){
    return  Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
       
        listTileBuilder(context,"English League","PL"),
        listTileBuilder(context,"spanish League","PD"),
        listTileBuilder(context,"itallian League","SA"),
        listTileBuilder(context,"france League","FL1"),
        listTileBuilder(context,"Bundes League","BL1"),
      ]),
    );
  }

  ListTile listTileBuilder(BuildContext context,String league,String leagueId) {
    return ListTile(
        title: Text(league),
        onTap: () {
          standingBloc.dispatch(FetchStandingEvent(leagueId: leagueId));
          scorerBloc.dispatch(FetchScorerEvent(leagueId: leagueId));
          Navigator.pop(context);
        },
      );
  }

}
