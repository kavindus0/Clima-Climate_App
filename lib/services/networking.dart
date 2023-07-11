import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingForAPI {
  NetworkingForAPI(this._url);
  final String _url;

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
