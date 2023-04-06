// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wines_market_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinesMarketModel _$WinesMarketModelFromJson(Map<String, dynamic> json) =>
    WinesMarketModel(
      recordsMatched: json['records_matched'] as int,
      records: (json['records'] as List<dynamic>)
          .map((e) => WineRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WinesMarketModelToJson(WinesMarketModel instance) =>
    <String, dynamic>{
      'records_matched': instance.recordsMatched,
      'records': instance.records,
    };
