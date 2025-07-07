import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper{

  static final PEXELS_BASE_URL = "https://api.pexels.com/v1/";
  static final PEXELS_SEARCH_URL = "${PEXELS_BASE_URL}search";
  static final PEXELS_CURATED_URL = "${PEXELS_BASE_URL}curated";

  Future<dynamic> getAPI({required String url}) async{
    var uri = Uri.parse(url);
    var res = await http.get(uri, headers: {
      "Authorization" : "Rdjrc6fLjbDiRicZoeC2QoFtHOn1vN6SxBapZ3rtKLmIX9DysRHu3jLP"
    });

   if(res.statusCode == 200){
     var mData = jsonDecode(res.body);
     return mData;
   } else{
      return null;
   }
  }
}