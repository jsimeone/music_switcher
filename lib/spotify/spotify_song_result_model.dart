import 'package:json_annotation/json_annotation.dart';
part 'spotify_song_result_model.g.dart';

@JsonSerializable()
class SpotifySongResult {
  SpotifySongResult(this.name);

  String name;

  factory SpotifySongResult.fromJson(Map<String, dynamic> json) =>
      _$SpotifySongResultFromJson(json);
}
