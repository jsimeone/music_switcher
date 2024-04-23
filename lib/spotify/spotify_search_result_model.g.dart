// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyUrl _$SpotifyUrlFromJson(Map<String, dynamic> json) => SpotifyUrl(
      json['spotify'] as String,
    );

Map<String, dynamic> _$SpotifyUrlToJson(SpotifyUrl instance) =>
    <String, dynamic>{
      'spotify': instance.url,
    };

SpotifyTrackObject _$SpotifyTrackObjectFromJson(Map<String, dynamic> json) =>
    SpotifyTrackObject(
      SpotifyUrl.fromJson(json['external_urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpotifyTrackObjectToJson(SpotifyTrackObject instance) =>
    <String, dynamic>{
      'external_urls': instance.externalUrls,
    };

SpotifySearchResult _$SpotifySearchResultFromJson(Map<String, dynamic> json) =>
    SpotifySearchResult(
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyTrackObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifySearchResultToJson(
        SpotifySearchResult instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

SpotifySearch _$SpotifySearchFromJson(Map<String, dynamic> json) =>
    SpotifySearch(
      SpotifySearchResult.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpotifySearchToJson(SpotifySearch instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
    };
