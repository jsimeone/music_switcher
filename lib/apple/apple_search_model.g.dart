// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleSongAttributes _$AppleSongAttributesFromJson(Map<String, dynamic> json) =>
    AppleSongAttributes(
      json['url'] as String,
    );

Map<String, dynamic> _$AppleSongAttributesToJson(
        AppleSongAttributes instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

AppleSong _$AppleSongFromJson(Map<String, dynamic> json) => AppleSong(
      AppleSongAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppleSongToJson(AppleSong instance) => <String, dynamic>{
      'attributes': instance.attributes,
    };

AppleSongs _$AppleSongsFromJson(Map<String, dynamic> json) => AppleSongs(
      (json['data'] as List<dynamic>)
          .map((e) => AppleSong.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppleSongsToJson(AppleSongs instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AppleSearchResult _$AppleSearchResultFromJson(Map<String, dynamic> json) =>
    AppleSearchResult(
      AppleSongs.fromJson(json['songs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppleSearchResultToJson(AppleSearchResult instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

AppleSearch _$AppleSearchFromJson(Map<String, dynamic> json) => AppleSearch(
      AppleSearchResult.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppleSearchToJson(AppleSearch instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
