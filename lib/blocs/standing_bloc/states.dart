
import 'package:football_app/back_end/models/standing_model.dart';
import 'package:football_app/back_end/models/team_model.dart';



class StandingState {}

class UnloadedSYet extends StandingState{}

class StandingLoaded extends StandingState{

static Standing standing  ;

static getPhotoById(int id){
  Team team;
  for(Team t in standing.table){
    if(t.id==id){
      team=t;
    }
  }
  return team.photoUrl;
}

}


class ErrorState extends StandingState{}



