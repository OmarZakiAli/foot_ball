import './events.dart';
import 'package:bloc/bloc.dart';
import './states.dart';
import 'package:football_app/back_end/providers/api_provider.dart';
import 'package:football_app/back_end/models/standing_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  @override
  StandingState get initialState => UnloadedSYet();

  @override
  Stream<StandingState> mapEventToState(
    StandingEvent event,
  ) async* {
      
     if(event is FetchStandingEvent){
       try{
           if(currentState is UnloadedSYet){

             final Standing std = Standing.fromList(await getStanding(league: event.leagueId));
             StandingLoaded.standing=std;
             yield StandingLoaded();

           } 

       }catch(_){

yield ErrorState();

       }
      

     }
      

     }

     
     

  }
