import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './home.dart';
import 'package:football_app/ui/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:football_app/blocs/scorer_bloc/scorers_bloc.dart';
import 'package:football_app/blocs/standing_bloc/events.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:football_app/blocs/scorer_bloc/events.dart';
import 'package:football_app/blocs/scorer_bloc/states.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final StandingBloc standingBloc = StandingBloc();

  final ScorerBloc scorerBloc = ScorerBloc();

  @override
  void initState() {
    standingBloc.dispatch(FetchStandingEvent(leagueId: "PL"));
    scorerBloc.dispatch(FetchScorerEvent(leagueId: "PL"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHome(standingBloc: standingBloc, scorerBloc: scorerBloc),
    );
  } //build

  @override
  void dispose() {
    scorerBloc.dispose();
    standingBloc.dispose();
    super.dispose();
  }
}
