class MatchEvent{}

class FetchMatchEvent extends MatchEvent{
  final String leagueId;
  FetchMatchEvent({this.leagueId="PL"});
}