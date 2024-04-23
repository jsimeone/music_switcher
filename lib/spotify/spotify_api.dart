import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:music_switcher/spotify/spotify_authentication_model.dart';
import 'package:music_switcher/spotify/spotify_search_result_model.dart';

class SpotifyApi {
  // Yes, this is insecure. Stores the authentication token returned from Spotify.
  static String authToken = "";

  // Called on app startup. Logs into the Spotify API and gets an auth token good for one hour.
  Future<void> apiLogin() async {
    Uri requestUrl = Uri.parse("https://accounts.spotify.com/api/token");
    const bodyData =
        "grant_type=client_credentials&client_id=1108c49f8d3e4e40af65f70bda06a141&client_secret=8b413d3d602549c39988a149dacfb89f";
    const headers = {
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
    };

    final response =
        await http.post(requestUrl, body: bodyData, headers: headers);
    if (response.statusCode == 200) {
      authToken = SpotifyAuthentication.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>)
          .accessToken; // There is some extra data coming down here but I wanted to grab it all in case of future development
    } else {
      throw Exception('Error while authenticating Spotify');
    }
  }

  Future<SpotifySearch> spotifySearch(String searchQuery) async {
    String formattedQuery = searchQuery.replaceAll(' ', '+');
    Uri requestUrl = Uri.parse(
        "https://api.spotify.com/v1/search?q=$formattedQuery&type=track&market=US&limit=1");
    print(requestUrl.toString());
    var headers = {HttpHeaders.authorizationHeader: "Bearer $authToken"};
    final response = await http.get(requestUrl, headers: headers);
    if (response.statusCode == 200) {
      return SpotifySearch.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Error while fetching Spotify search result');
    }
  }
}
