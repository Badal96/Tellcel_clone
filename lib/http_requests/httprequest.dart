

import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequests {
  final String _apikey = '/5rSh0krFZqcSvbodOCZww==ak9Eb0fZDkdLzHWl';
  final String _url  = 'https://api.api-ninjas.com/v1/cats?name={}';
  final String offset = '12';
  var client = http.Client();
String checklength (String text) => text.length>200? text.substring(0,197)+'...':text;
 
  Future <List<dynamic>> getCatinfo () async { 
  var url = Uri.parse(_url +'/offset'+offset);

  var response = await client.get(url, headers: {'X-Api-Key':_apikey});
  if (response.statusCode == 200) {
   return   jsonDecode(response.body); 
  }
  else {
    return [{'name':'smth'}];
  }
}

}