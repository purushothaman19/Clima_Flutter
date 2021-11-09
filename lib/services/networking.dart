import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkData {

  NetworkData({this.uri});

  final uri;

  Future getData() async {

    http.Response response = await http.get(uri);

    if(response.statusCode == 200){
      String date = response.body;
      var decodedData = jsonDecode(date);

      return decodedData;

      // print(temp);
      // print(condition);
      // print(cityName);

    }
    else {
      print(response.statusCode);
    }

  }

}