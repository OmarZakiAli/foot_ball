import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import './home.dart';
import 'package:football_app/blocs/result_bloc/results_bloc.dart';
import 'package:football_app/ui/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:football_app/blocs/scorer_bloc/scorers_bloc.dart';
import 'package:football_app/blocs/standing_bloc/events.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:football_app/blocs/scorer_bloc/events.dart';
import 'package:football_app/blocs/scorer_bloc/states.dart';
import 'package:football_app/blocs/match_bloc/matches_bloc.dart';
import 'package:football_app/blocs/match_bloc/events.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final StandingBloc standingBloc = StandingBloc();

  final ScorerBloc scorerBloc = ScorerBloc();
  final MatchBloc matchBloc=MatchBloc();
  final ResultBloc resultBloc=ResultBloc();


  @override
  void initState() {
  //  standingBloc.dispatch(FetchStandingEvent(leagueId: "PL"));
    //scorerBloc.dispatch(FetchScorerEvent(leagueId: "PL"));
    //matchBloc.dispatch(FetchMatchEvent(leagueId: "PL"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Color(0xFF5D4037),
        accentColor: Color(0xFF607D8B),
        primaryColorLight: Color(0xFFD7CCC8),
       primaryColor: Color(0xff795548),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white,fontSize: 24)),
          accentTextTheme: TextTheme(title: TextStyle(color: Color(0xff757575),fontSize: 24))
      ),
      home: new MyHome(standingBloc: standingBloc, scorerBloc: scorerBloc,matchBloc: matchBloc,resultBloc: resultBloc,),
    );
  } //build

  @override
  void dispose() {
    scorerBloc.dispose();
    standingBloc.dispose();
    matchBloc.dispose();
    resultBloc.dispose();
    super.dispose();
  }
}
