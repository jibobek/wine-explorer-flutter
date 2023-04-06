// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vintage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VintageModel _$VintageModelFromJson(Map<String, dynamic> json) => VintageModel(
      WineModel.fromJson(json['wine'] as Map<String, dynamic>),
      WineImageModel.fromJson(json['image'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      year: ModelUtils.yearToInt(json['year']),
    );

Map<String, dynamic> _$VintageModelToJson(VintageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'wine': instance.wineModel,
      'image': instance.wineImageModel,
    };
