import 'package:json_annotation/json_annotation.dart';
part 'apple_song_result_model.g.dart';

// NOTE: See apple_search_model.dart for an explanation of these classes.
@JsonSerializable()
class AppleFetchedSongAttribues {
  AppleFetchedSongAttribues(this.name);

  String name;

  factory AppleFetchedSongAttribues.fromJson(Map<String, dynamic> json) =>
      _$AppleFetchedSongAttribuesFromJson(json);
}

@JsonSerializable()
class AppleSongData {
  AppleSongData(this.attributes);

  AppleFetchedSongAttribues attributes;

  factory AppleSongData.fromJson(Map<String, dynamic> json) =>
      _$AppleSongDataFromJson(json);
}

@JsonSerializable()
class AppleSongResult {
  AppleSongResult(this.data);

  List<AppleSongData> data;

  factory AppleSongResult.fromJson(Map<String, dynamic> json) =>
      _$AppleSongResultFromJson(json);
}
