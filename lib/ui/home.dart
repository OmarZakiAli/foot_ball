import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_app/blocs/result_bloc/events.dart';
import 'package:football_app/ui/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/blocs/result_bloc/results_bloc.dart';
import 'package:football_app/back_end/models/team_model.dart';
import 'package:football_app/blocs/scorer_bloc/scorers_bloc.dart';
import 'package:football_app/blocs/standing_bloc/events.dart';
import 'package:football_app/blocs/standing_bloc/states.dart';
import 'package:football_app/blocs/standing_bloc/standing_bloc.dart';
import 'package:football_app/blocs/scorer_bloc/events.dart';
import 'package:football_app/blocs/scorer_bloc/states.dart';
import 'package:football_app/blocs/match_bloc/matches_bloc.dart';
import 'package:football_app/blocs/match_bloc/events.dart';

class MyHome extends StatelessWidget {
  final StandingBloc standingBloc;
  final ScorerBloc scorerBloc;
  final MatchBloc matchBloc;
  final ResultBloc resultBloc;
  final Key key;

  const MyHome({this.standingBloc, this.scorerBloc, this.matchBloc, this.key,this.resultBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<StandingBloc>(bloc: standingBloc),
        BlocProvider<ScorerBloc>(bloc: scorerBloc),
        BlocProvider<MatchBloc>(bloc: matchBloc),
        BlocProvider<ResultBloc>(bloc: resultBloc),

      ],
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: getDrawer(context),
          appBar: AppBar(
            centerTitle: true,
            title: Text("football app",
                style: Theme.of(context).primaryTextTheme.title),
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "standing",
                ),
                Tab(
                  text: "scorers",
                ),
                Tab(
                  text: "matches",
                ),
                Tab(
                  text: "results",
                )
              ],
            ),
          ),
          body: MyTabBarView(),
        ),
      ),
    );
  }

  getDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 16),
        color: Theme.of(context).primaryColorLight,
        child: ListView(padding: EdgeInsets.zero,
            children: <Widget>[
          listTileBuilder(context, "English League", "PL"),
          listTileBuilder(context, "spanish League", "PD"),
          listTileBuilder(context, "itallian League", "SA"),
          listTileBuilder(context, "france League", "FL1"),
          listTileBuilder(context, "Bundes League", "BL1"),
        ]),
      ),
    );
  }

  ListTile listTileBuilder(
      BuildContext context, String league, String leagueId) {
    return ListTile(
      title: Text(league,style: Theme.of(context).accentTextTheme.title,),
      onTap: () {
        standingBloc.dispatch(FetchStandingEvent(leagueId: leagueId));
        scorerBloc.dispatch(FetchScorerEvent(leagueId: leagueId));
        matchBloc.dispatch(FetchMatchEvent(leagueId: leagueId));
        resultBloc.dispatch(FetchResultEvent(leagueId: leagueId));
        Navigator.pop(context);
      },
    );
  }
}
