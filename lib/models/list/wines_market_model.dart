import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/wine/wine_record_model.dart';
part 'wines_market_model.g.dart';

@JsonSerializable()
class WinesMarketModel {
  @JsonKey(name: "records_matched")
  int recordsMatched;
  @JsonKey(name: "records")
  List<WineRecordModel> records;

  WinesMarketModel({required this.recordsMatched, required this.records});

  factory WinesMarketModel.fromJson(Map<String, dynamic> json) =>
      _$WinesMarketModelFromJson(json);
  Map<String, dynamic> toJson() => _$WinesMarketModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
