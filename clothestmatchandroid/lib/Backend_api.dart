import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BackendApi
{
  static String sessionId = "";

  Future<String?> GetProducts() async
  {
    if (sessionId == "") {
      print("No session stored");
    } else {
      print("Session: " + sessionId);
    }
    var client = http.Client();
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/product/20');
    var response = await client.get(uri);
    if (response.statusCode == 200)
    {
      String headerString = response.headers.toString();
      headerString = headerString.substring(headerString.indexOf("SESSION"));
      headerString = headerString.substring(0, headerString.indexOf(';'));
      sessionId = headerString;
      return response.body;
    }
    return null;
  }
}