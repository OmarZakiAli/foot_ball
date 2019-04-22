import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

 Future<List> getStanding({String league="PL"}) async {

 http.Response response=  await http.get("https://api.football-data.org/v2/competitions/$league/standings",
headers: {"X-Auth-Token":"c0698c9b98804b26af3639e11088b038"});
 
 List table= json.decode(response.body)["standings"][0]["table"];
 return table;

}




   Future<List>  getScorers({String league="PL"}) async {

 http.Response response=  await http.get("https://api.football-data.org/v2/competitions/$league/scorers",
headers: {"X-Auth-Token":"c0698c9b98804b26af3639e11088b038"});
 
 List plrs= json.decode(response.body)["scorers"];

return plrs;
}


Future<List>  getMatches({String league="PL"}) async {
 var now = new DateTime.now();
 var next= now.add(Duration(days: 1));
 var formatter = new DateFormat('yyyy-MM-dd');
 String formattedNow = formatter.format(now);
 String formattedNext = formatter.format(next);

 http.Response response=  await http
     .get("https://api.football-data.org/v2/matches?competitions=$league&status=SCHEDULED&dateFrom=$formattedNow&dateTo=$formattedNext",
     headers: {"X-Auth-Token":"c0698c9b98804b26af3639e11088b038"});

 List matches= json.decode(response.body)["matches"];

 return matches;
}


