class ResultEvent{}

class FetchResultEvent extends ResultEvent{
  final String leagueId;
  FetchResultEvent({this.leagueId="PL"});
}