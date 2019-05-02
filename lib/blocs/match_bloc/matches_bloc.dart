import './events.dart';
import 'package:bloc/bloc.dart';
import './states.dart';
import 'package:football_app/back_end/providers/api_provider.dart';
import 'package:football_app/back_end/models/matches_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  @override
  MatchState get initialState => UnloadedMYet();

  @override
  Stream<MatchState> mapEventToState(
    MatchEvent event,
  ) async* {
      
     if(event is FetchMatchEvent){
       try{
           if(currentState is UnloadedMYet){

             final Matches mtc = Matches.fromList(await getMatches(league: event.leagueId));
             MatchesLoaded.matches=mtc;
             yield MatchesLoaded();

           } else  if(currentState is MatchesLoaded){

             final Matches mtc = Matches.fromList(await getMatches(league: event.leagueId));
             MatchesLoaded.matches=mtc;
             yield MatchesLoaded();}
           else  if(currentState is ErrormState){

             final Matches mtc = Matches.fromList(await getMatches(league: event.leagueId));
             MatchesLoaded.matches=mtc;
             yield MatchesLoaded();}


       }catch(_){

yield ErrormState();

       }
      

     }
      

     }

     
     

  }
