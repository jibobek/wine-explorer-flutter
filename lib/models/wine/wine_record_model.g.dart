// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wine_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineRecordModel _$WineRecordModelFromJson(Map<String, dynamic> json) =>
    WineRecordModel(
      vintageModel:
          VintageModel.fromJson(json['vintage'] as Map<String, dynamic>),
      winePriceModel:
          WinePriceModel.fromJson(json['price'] as Map<String, dynamic>),
    )..isFavorite = json['isFavorite'] as bool? ?? false;

Map<String, dynamic> _$WineRecordModelToJson(WineRecordModel instance) =>
    <String, dynamic>{
      'vintage': instance.vintageModel,
      'price': instance.winePriceModel,
      'isFavorite': instance.isFavorite,
    };
