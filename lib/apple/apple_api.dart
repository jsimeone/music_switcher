import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:music_switcher/apple/apple_authentication.dart';
import 'package:music_switcher/apple/apple_search_model.dart';
import 'package:music_switcher/apple/apple_song_result_model.dart';

class AppleApi {
  // Authentication headers to be passed with each request. Uses the token calculated in the AppleAuthentication class.
  final authorizationHeader = {
    HttpHeaders.authorizationHeader: "Bearer ${AppleAuthentication.token}"
  };

  /// Takes a String of words to search for and returns the Apple Music URL of the first result.
  Future<String> search(String searchQuery) async {
    String formattedQuery = searchQuery.replaceAll(' ',
        '+'); // Replace all spaces in the query with '+' to fit the URL scheme.
    Uri requestUrl = Uri.parse(
        "https://api.music.apple.com/v1/catalog/us/search?types=songs&limit=1&term=$formattedQuery");
    final response = await http.get(requestUrl, headers: authorizationHeader);

    if (response.statusCode == 200) {
      // Check whether Apple reported the request successful
      return AppleSearch.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>)
          .results
          .songs
          .data
          .first
          .attributes
          .url;
    } else {
      throw Exception("Error while searching Apple Music");
    }
  }

  /// Returns a song's name by its ID stripped out of a share link.
  Future<String> fetchSongById(String id) async {
    Uri requestUrl =
        Uri.parse("https://api.music.apple.com/v1/catalog/us/songs/$id");
    final response = await http.get(requestUrl, headers: authorizationHeader);

    if (response.statusCode == 200) {
      // Check whether apple reported the request successful
      return AppleSongResult.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>)
          .data
          .first
          .attributes
          .name;
    } else {
      throw Exception("Failed to fetch song by ID");
    }
  }
}
