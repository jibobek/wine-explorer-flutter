import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/currency/currency_model.dart';
part 'wine_price_model.g.dart';

@JsonSerializable()
class WinePriceModel {
  @JsonKey(name: "amount")
  double amount;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "currency")
  CurrencyModel currencyModel;

  WinePriceModel(
      {required this.amount, required this.url, required this.currencyModel});

  factory WinePriceModel.fromJson(Map<String, dynamic> json) =>
      _$WinePriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$WinePriceModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
