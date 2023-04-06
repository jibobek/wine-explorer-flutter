import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "prefix")
  String? prefix;
  @JsonKey(name: "suffix")
  String? suffix;

  CurrencyModel({required this.name, required this.code});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
