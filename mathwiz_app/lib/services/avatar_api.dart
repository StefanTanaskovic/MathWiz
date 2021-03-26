import 'package:http/http.dart' as http;

class APIService {
  Future<String> fetchAssets() async {
    // Headers
    final Map<String, String> headers = {
      'x-rapidapi-key': 'e125d1ff06msh377fb01ba0d15bbp160bfejsn9ce5a8911615',
      'x-rapidapi-host': 'doppelme-avatars.p.rapidapi.com'
    };

    // URI
    var uri = Uri.https('doppelme-avatars.p.rapidapi.com', 'assets/1101/top');
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return responseString;
    } else {
      print(response);
      return null;
    }
  }
}
