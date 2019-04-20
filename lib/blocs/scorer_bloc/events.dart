class ScorerEvent{}

class FetchScorerEvent extends ScorerEvent{
  final String leagueId;
  FetchScorerEvent({this.leagueId="PL"});
}