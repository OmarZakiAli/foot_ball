import './events.dart';
import 'package:bloc/bloc.dart';
import './states.dart';
import 'package:football_app/back_end/providers/api_provider.dart';
import 'package:football_app/back_end/models/scorers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScorerBloc extends Bloc<ScorerEvent, ScorerState> {
  @override
  ScorerState get initialState => UnloadedPYet();

  @override
  Stream<ScorerState> mapEventToState(
    ScorerEvent event,
  ) async* {
      
     if(event is FetchScorerEvent){
       try{
           if(currentState is UnloadedPYet){

             final Scorers scr = Scorers.fromList(await getScorers(league: event.leagueId));
             ScorersLoaded.scorers=scr;
             yield ScorersLoaded();

           } else  if(currentState is ScorersLoaded){

             final Scorers scr = Scorers.fromList(await getScorers(league: event.leagueId));
             ScorersLoaded.scorers=scr;
             yield ScorersLoaded();}
           else  if(currentState is ErrorpState){

             final Scorers scr = Scorers.fromList(await getScorers(league: event.leagueId));
             ScorersLoaded.scorers=scr;
             yield ScorersLoaded();}

       }catch(_){

yield ErrorpState();

       }
      

     }
      

     }

     
     

  }
