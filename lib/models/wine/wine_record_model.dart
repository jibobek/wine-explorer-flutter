import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/vintage/image/wine_image_model.dart';
import 'package:wine_explorer/models/vintage/vintage_model.dart';
import 'package:wine_explorer/models/wine/wine_price_model.dart';
part 'wine_record_model.g.dart';

@JsonSerializable()
class WineRecordModel {
  @JsonKey(name: "vintage")
  final VintageModel vintageModel;
  @JsonKey(name: "price")
  final WinePriceModel winePriceModel;

  @JsonKey(defaultValue: false)
  bool isFavorite = false;

  WineRecordModel({required this.vintageModel, required this.winePriceModel});

  factory WineRecordModel.fromJson(Map<String, dynamic> json) =>
      _$WineRecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$WineRecordModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
