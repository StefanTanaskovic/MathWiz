import 'package:http/http.dart' as http;

class APIService {
  static const API_KEY = 'e125d1ff06msh377fb01ba0d15bbp160bfejsn9ce5a8911615';
  static const API_HOST = 'doppelme-avatars.p.rapidapi.com';

  // --- Create an Avatar --- //
  Future<String> createAvatar() async {
    // Headers
    final Map<String, String> headers = {
      'x-rapidapi-key': API_KEY,
      'x-rapidapi-host': API_HOST
    };

    // URI
    var uri = Uri.https(API_HOST, 'avatar/1101');
    var response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return responseString;
    } else {
      return null;
    }
  }

  // --- Update Avatar --- //
  Future<String> updateAvatar(String avatarKey, String itemID) async {
    // Headers
    final Map<String, String> headers = {
      'x-rapidapi-key': API_KEY,
      'x-rapidapi-host': API_HOST
    };

    // URI
    var uri = Uri.https(API_HOST, 'avatar/' + avatarKey + '/' + itemID);
    var response = await http.put(uri, headers: headers);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return responseString;
    } else {
      return null;
    }
  }
}
