import 'package:json_annotation/json_annotation.dart';
part 'spotify_search_result_model.g.dart';

@JsonSerializable()
class SpotifyUrl {
  SpotifyUrl(this.url);

  @JsonKey(name: 'spotify')
  String url;

  factory SpotifyUrl.fromJson(Map<String, dynamic> json) =>
      _$SpotifyUrlFromJson(json);
}

@JsonSerializable()
class SpotifyTrackObject {
  SpotifyTrackObject(this.externalUrls);

  @JsonKey(name: 'external_urls')
  SpotifyUrl externalUrls;

  factory SpotifyTrackObject.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackObjectFromJson(json);
}

@JsonSerializable()
class SpotifySearchResult {
  SpotifySearchResult(this.items);

  List<SpotifyTrackObject> items;

  factory SpotifySearchResult.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchResultFromJson(json);
}

@JsonSerializable()
class SpotifySearch {
  SpotifySearch(this.tracks);

  SpotifySearchResult tracks;

  factory SpotifySearch.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchFromJson(json);
}
