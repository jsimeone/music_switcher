import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:music_switcher/apple/apple_authentication.dart';
import 'package:music_switcher/apple/apple_search_model.dart';

class AppleApi {
  Future<void> appleTest() async {
    String token = AppleAuthentication.token;
    Uri requestUrl = Uri.parse("https://api.music.apple.com/v1/test");
    var headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(requestUrl, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
      throw Exception("Error while fetching Apple Music");
    }
  }

  Future<AppleSearch> searchApple(String searchQuery) async {
    String token = AppleAuthentication.token;
    String formattedQuery = searchQuery.replaceAll(' ', '+');
    Uri requestUrl = Uri.parse(
        "https://api.music.apple.com/v1/catalog/us/search?types=songs&limit=1&term=$formattedQuery");
    var headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(requestUrl, headers: headers);

    if (response.statusCode == 200) {
      return AppleSearch.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Error while searching Apple Music");
    }
  }
}