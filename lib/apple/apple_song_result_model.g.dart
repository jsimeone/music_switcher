// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_song_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleFetchedSongAttribues _$AppleFetchedSongAttribuesFromJson(
        Map<String, dynamic> json) =>
    AppleFetchedSongAttribues(
      json['name'] as String,
    );

Map<String, dynamic> _$AppleFetchedSongAttribuesToJson(
        AppleFetchedSongAttribues instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

AppleSongData _$AppleSongDataFromJson(Map<String, dynamic> json) =>
    AppleSongData(
      AppleFetchedSongAttribues.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppleSongDataToJson(AppleSongData instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
    };

AppleSongResult _$AppleSongResultFromJson(Map<String, dynamic> json) =>
    AppleSongResult(
      (json['data'] as List<dynamic>)
          .map((e) => AppleSongData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppleSongResultToJson(AppleSongResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
