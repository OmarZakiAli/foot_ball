class StandingEvent{}

class FetchStandingEvent extends StandingEvent{
  final String leagueId;
  FetchStandingEvent({this.leagueId="PL"});
}