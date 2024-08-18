import 'dart:convert';
import 'dart:io';
import 'package:clothestmatchandroid/Card.dart';
import 'package:http/http.dart' as http;

class BackendApi
{
  static String sessionId = "";

  void swipeRight(Card card) async {
    var client = http.Client();

    Map<String, String> headers = new Map();
    if (sessionId == "") {
      print("No session stored");
    } else {
      headers["Cookie"] = sessionId;
      print("Session: " + sessionId);
    }
    headers["Content-Type"] = "application/json";
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/product/swiperight');
    var response = await client.put(uri, headers: headers, body: json.encode(card.getId()));
    print(response.statusCode);
    return;

  }
  void swipeLeft(Card card) async {
    var client = http.Client();

    Map<String, String> headers = new Map();
    if (sessionId == "") {
      print("No session stored");
    } else {
      headers["Cookie"] = sessionId;
      print("Session: " + sessionId);
    }
    headers["Content-Type"] = "application/json";
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/product/swipeleft');
    var response = await client.put(uri, headers: headers, body: json.encode(card.getId()));
    print(response.statusCode);
    return;

  }

  Future<List<Card>> GetProducts() async
  {
    Map<String, String> headers = new Map();
    if (sessionId == "") {
      print("No session stored");
    } else {
      headers["Cookie"] = sessionId;
      print("Session: " + sessionId);
    }
    var client = http.Client();
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/product/5');
    var response = await client.get(uri, headers: headers);
    List<Card> cards = [];

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
      for (var item in parsedJson) {
        Card card = new Card();
        card.setId(item["id"]);
        card.setUrl(item["image"]["filepath"]);
        cards.add(card);
      }
      print(cards);
    }
    return cards;
  }

  Future<List<Card>> GetProductsForGallery() async
  {
    Map<String, String> headers = new Map();
    if (sessionId == "") {
      print("No session stored");
    } else {
      headers["Cookie"] = sessionId;
      print("Session: " + sessionId);
    }
    var client = http.Client();
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/gallery');
    var response = await client.get(uri, headers: headers);
    List<Card> cards = [];

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
      for (var item in parsedJson) {
        Card card = new Card();
        card.setId(item["id"]);
        card.setUrl(item["image"]["filepath"]);
        cards.add(card);
      }
      print(cards);
    }
    return cards;
  }
}