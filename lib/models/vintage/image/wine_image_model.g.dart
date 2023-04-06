// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wine_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineImageModel _$WineImageModelFromJson(Map<String, dynamic> json) =>
    WineImageModel(
      json['location'] as String,
      WineImageVariationsModel.fromJson(
          json['variations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WineImageModelToJson(WineImageModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'variations': instance.variationsModel,
    };
