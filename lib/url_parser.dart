import 'package:music_switcher/apple/apple_api.dart';
import 'package:music_switcher/spotify/spotify_api.dart';

class UrlParser {
  static Future<String> parseUrl(String url) async {
    // Need to check whether the URL is Spotify or Apple. Then call private functions to handle each of those.
    if (url.contains("spotify.com")) {
      String spotifyId = _parseSpotify(url);
      return _convertSpotify(
          spotifyId); // Get the name of the song, search it on the other service.
    } else if (url.contains("music.apple.com")) {
      String appleId = _parseApple(url);
      return _convertApple(
          appleId); // Get the name of the song. Search it on the other service.
    } else {
      throw Exception("Bad URL. Try again");
    }
  }

  //Private method to parse a URL from Spotify. Returns a String representation of the referenced song's ID.
  static String _parseSpotify(String url) {
    // https://open.spotify.com/track/056bKm6W5j9QodOftRznUV?si=TvNtr6-jSzuOM0z3b8RjSw
    // The song ID is the first alphanumeric code after "track/" and before "?si="
    var first = url.split("https://open.spotify.com/track/").last;
    return first.split("?si=").first;
  }

  // Private method to parse a URL from Apple Music. Returns a String representation of the referenced song's ID.
  static String _parseApple(String url) {
    // https://music.apple.com/us/album/jolene-single-version/282883573?i=282883578
    // The song ID is the last set of numbers after "i=". Grab this and return it.
    return url.split("i=").last;
  }

  static Future<String> _convertSpotify(String id) async {
    String songName = await SpotifyApi().fetchSongById(id);
    return AppleApi().search(songName);
  }

  static Future<String> _convertApple(String id) async {
    String songName = await AppleApi().fetchSongById(id);
    return SpotifyApi().search(songName);
  }
}
