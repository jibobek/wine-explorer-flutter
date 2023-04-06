// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wines_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinesListModel _$WinesListModelFromJson(Map<String, dynamic> json) =>
    WinesListModel(
      e: json['e'] as String,
      winesMarketModel: WinesMarketModel.fromJson(
          json['explore_vintage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WinesListModelToJson(WinesListModel instance) =>
    <String, dynamic>{
      'e': instance.e,
      'explore_vintage': instance.winesMarketModel,
    };
