

import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpRequests {
  
  final String _url  = 'https://ap.thecatapi.com/v1/images/search';
  final String limit = '12';
  var client = http.Client();
 
  Future  getCatsinfo () async { 

  var url = Uri.parse(_url );

try {
  var response = await client.get(url);
   if (response.statusCode == 200) {
  
   return   jsonDecode(response.body); 
  }
  else { 
   print (jsonDecode(response.body));
   }
} catch (e) {
   print('error$e');
  
}
  
  }

}