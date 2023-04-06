// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      name: json['name'] as String,
      code: json['code'] as String,
    )
      ..prefix = json['prefix'] as String?
      ..suffix = json['suffix'] as String?;

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
    };
