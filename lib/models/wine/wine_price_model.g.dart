// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wine_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinePriceModel _$WinePriceModelFromJson(Map<String, dynamic> json) =>
    WinePriceModel(
      amount: (json['amount'] as num).toDouble(),
      url: json['url'] as String,
      currencyModel:
          CurrencyModel.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WinePriceModelToJson(WinePriceModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'url': instance.url,
      'currency': instance.currencyModel,
    };
