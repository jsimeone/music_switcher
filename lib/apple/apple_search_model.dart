import 'package:json_annotation/json_annotation.dart';
part 'apple_search_model.g.dart';

@JsonSerializable()
class AppleSongAttributes {
  AppleSongAttributes(this.url);

  String url;

  factory AppleSongAttributes.fromJson(Map<String, dynamic> json) =>
      _$AppleSongAttributesFromJson(json);
}

@JsonSerializable()
class AppleSong {
  AppleSong(this.attributes);

  AppleSongAttributes attributes;

  factory AppleSong.fromJson(Map<String, dynamic> json) =>
      _$AppleSongFromJson(json);
}

@JsonSerializable()
class AppleSongs {
  AppleSongs(this.data);

  List<AppleSong> data;

  factory AppleSongs.fromJson(Map<String, dynamic> json) =>
      _$AppleSongsFromJson(json);
}

@JsonSerializable()
class AppleSearchResult {
  AppleSearchResult(this.songs);

  AppleSongs songs;

  factory AppleSearchResult.fromJson(Map<String, dynamic> json) =>
      _$AppleSearchResultFromJson(json);
}

@JsonSerializable()
class AppleSearch {
  AppleSearch(this.results);

  AppleSearchResult results;

  factory AppleSearch.fromJson(Map<String, dynamic> json) =>
      _$AppleSearchFromJson(json);
}
