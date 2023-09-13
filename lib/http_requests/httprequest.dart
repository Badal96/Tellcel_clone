

import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequests {
 
  final String _url  ='https://catfact.ninja/fact';
  var client = http.Client();
String checklength (String text) => text.length>200? text.substring(0,197)+'...':text;
 
  Future <String> getpictures () async { 
  var url = Uri.parse(_url);
  client.get(url);

  var response = await client.get(url);
  if (response.statusCode == 200) {
   return   checklength(jsonDecode(response.body)['fact']) ; 
  }
  else {
    return 'smth went wrong';
  }
}

}