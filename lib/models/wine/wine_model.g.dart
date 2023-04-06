// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineModel _$WineModelFromJson(Map<String, dynamic> json) => WineModel(
      json['id'] as int,
      json['name'] as String,
      json['has_valid_ratings'] as bool,
      WineStatisticsModel.fromJson(json['statistics'] as Map<String, dynamic>),
      json['style'] == null
          ? null
          : WineStyleModel.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WineModelToJson(WineModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'has_valid_ratings': instance.hasValidRatings,
      'statistics': instance.wineStatisticsModel,
      'style': instance.wineStyleModel,
    };
