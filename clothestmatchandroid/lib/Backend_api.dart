import 'dart:convert';
import 'dart:io';
import 'package:clothestmatchandroid/Card.dart';
import 'package:http/http.dart' as http;

class BackendApi
{
  static String sessionId = "";

  Future<List<Card>?> GetProducts() async
  {
    Map<String, String> headers = new Map();
    if (sessionId == "") {
      print("No session stored");
    } else {
      headers["Cookie"] = sessionId;
      print("Session: " + sessionId);
    }
    var client = http.Client();
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/product/20');
    var response = await client.get(uri, headers: headers);

    if (response.statusCode == 200)
    {
      String headerString;
      if (response.headers.toString().isNotEmpty && response.headers.toString().contains("set-cookie")) {
        headerString = response.headers.toString();
        headerString = headerString.substring(headerString.indexOf("SESSION"));
        headerString = headerString.substring(0, headerString.indexOf(';'));
        sessionId = headerString;
      }
      final parsedJson = jsonDecode(response.body);
      //print(parsedJson);
      List<Card> cards = [];
      for (var item in parsedJson) {
        Card card = new Card();
        card.setId(item["id"]);
        card.setUrl(item["image"]["filepath"]);
        cards.add(card);
      }
      print(cards);

      return cards;
    }
    return null;
  }
}