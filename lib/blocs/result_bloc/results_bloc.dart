import './events.dart';
import 'package:bloc/bloc.dart';
import './states.dart';
import 'package:football_app/back_end/providers/api_provider.dart';
import 'package:football_app/back_end/models/results_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  @override
  ResultState get initialState => UnloadedRYet();

  @override
  Stream<ResultState> mapEventToState(
    ResultEvent event,
  ) async* {
      
     if(event is FetchResultEvent){
       try{
           if(currentState is UnloadedRYet){

             final Results res = Results.fromList(await getResults(league: event.leagueId));
             ResultsLoaded.results=res;
             yield ResultsLoaded();

           } else  if(currentState is ResultsLoaded){

            final Results res = Results.fromList(await getResults(league: event.leagueId));
             ResultsLoaded.results=res;
             yield ResultsLoaded();}
           else  if(currentState is ErrorRState){

             final Results res = Results.fromList(await getResults(league: event.leagueId));
             ResultsLoaded.results=res;
             yield ResultsLoaded();}


       }catch(_){

yield ErrorRState();

       }
      

     }
      

     }

     
     

  }
