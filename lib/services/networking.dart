import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
      print("Something Went Wrong");
      return "Somethinfg went wrong";
    }
  }
}
