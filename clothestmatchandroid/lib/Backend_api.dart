import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendApi
{
  Future<String?> GetProducts() async
  {
    var client = http.Client();
    var uri = Uri.parse('http://api.clothestmatch.caillin.net/product/20');
    var response = await client.get(uri);
    if (response.statusCode == 200)
    {
      return Utf8Decoder().convert(response.bodyBytes);
    }
    return null;
  }
}