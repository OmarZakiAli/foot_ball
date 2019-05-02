import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/back_end/models/matches_model.dart';
import 'package:football_app/back_end/models/results_model.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:football_app/blocs/match_bloc/events.dart';
import 'package:football_app/blocs/match_bloc/matches_bloc.dart';
import 'package:football_app/blocs/match_bloc/states.dart';
import 'package:football_app/blocs/result_bloc/events.dart';
import 'package:football_app/blocs/result_bloc/results_bloc.dart';
import 'package:football_app/blocs/result_bloc/states.dart';
import 'package:football_app/blocs/scorer_bloc/events.dart';
import 'package:football_app/blocs/scorer_bloc/scorers_bloc.dart';
import 'package:football_app/blocs/scorer_bloc/states.dart';
import 'package:football_app/blocs/standing_bloc/events.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';
import 'package:football_app/ui/widgets/match_builder.dart';
import 'package:football_app/ui/widgets/result_builder.dart';

import './widgets/player_widget.dart';
import './widgets/team_widget.dart';
import '../back_end/models/player_model.dart';
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
    final MatchBloc _mbloc = BlocProvider.of<MatchBloc>(context);
    final ResultBloc _rbloc = BlocProvider.of<ResultBloc>(context);
    return TabBarView(
      children: <Widget>[
        BlocBuilder(
          bloc: _sbloc,
          builder: (BuildContext con, StandingState st) {
            if (_sbloc.currentState is UnloadedSYet) {
              _sbloc.dispatch(FetchStandingEvent());
              return Center(child: CircularProgressIndicator());
            } else if (_sbloc.currentState is ErrorState) {
              return Text("error loading");
            } else if (_sbloc.currentState is StandingLoaded) {
              return ListView.builder(
                  itemCount: StandingLoaded.standing.table.length,
                  itemBuilder: (BuildContext context, int position) {
                    Team team = StandingLoaded.standing.table[position];
                    return teamItemBuilder(team, context);
                  });
            }
          },
        ),
        BlocBuilder(
          bloc: _s2bloc,
          builder: (BuildContext con, ScorerState st) {
            if (_s2bloc.currentState is UnloadedPYet) {
              _s2bloc.dispatch(FetchScorerEvent());
              return Center(child: CircularProgressIndicator());
            } else if (_s2bloc.currentState is ErrorpState) {
              return Text("error loading");
            } else if (_s2bloc.currentState is ScorersLoaded) {
              return ListView.builder(
                  itemCount: ScorersLoaded.scorers.scorers.length,
                  itemBuilder: (BuildContext context, int position) {
                    Player player = ScorersLoaded.scorers.scorers[position];
                    return playerItemBuilder(player);
                  });
            }
          },
        ), BlocBuilder(
          bloc: _mbloc,
          builder: (BuildContext con, MatchState st) {
            if (_mbloc.currentState is UnloadedMYet) {
              _mbloc.dispatch(FetchMatchEvent());
              return Center(child: CircularProgressIndicator());
            } else if (_mbloc.currentState is ErrormState) {
              return Text("error loading");
            } else if (_mbloc.currentState is MatchesLoaded) {
              return ListView.builder(
                  itemCount: MatchesLoaded.matches.matches.length,
                  itemBuilder: (BuildContext context, int position) {
                    Matchx mat = MatchesLoaded.matches.matches[position];
                    return matchItemBuilder(mat);
                  });
            }
          },



        ),

        BlocBuilder(
          bloc: _rbloc,
          builder: (BuildContext con, ResultState st) {
            if (_rbloc.currentState is UnloadedRYet) {
              _rbloc.dispatch(FetchResultEvent());
              return Center(child: CircularProgressIndicator());
            } else if (_rbloc.currentState is ErrorRState) {
              return Text("error loading");
            } else if (_rbloc.currentState is ResultsLoaded) {
              return ListView.builder(
                  itemCount: ResultsLoaded.results.results.length,
                  itemBuilder: (BuildContext context, int position) {
                    Result result = ResultsLoaded.results.results[position];
                    return resultItemBuilder(result,context);
                  });
            }
          },
        )
      ],
    );
  }
}