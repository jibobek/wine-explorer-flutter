// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wine_image_variations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineImageVariationsModel _$WineImageVariationsModelFromJson(
        Map<String, dynamic> json) =>
    WineImageVariationsModel(
      json['bottle_large'] as String?,
      json['label'] as String?,
      json['medium'] as String?,
      json['small_square'] as String?,
    );

Map<String, dynamic> _$WineImageVariationsModelToJson(
        WineImageVariationsModel instance) =>
    <String, dynamic>{
      'bottle_large': instance.bottleLarge,
      'label': instance.label,
      'medium': instance.medium,
      'small_square': instance.smallSquare,
    };
