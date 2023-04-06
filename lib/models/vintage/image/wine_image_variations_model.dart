import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'wine_image_variations_model.g.dart';

@JsonSerializable()
class WineImageVariationsModel {
  @JsonKey(name: "bottle_large")
  final String? bottleLarge;
  @JsonKey(name: "label")
  final String? label;
  @JsonKey(name: "medium")
  final String? medium;
  @JsonKey(name: "small_square")
  final String? smallSquare;

  WineImageVariationsModel(
      this.bottleLarge, this.label, this.medium, this.smallSquare);

  factory WineImageVariationsModel.fromJson(Map<String, dynamic> json) =>
      _$WineImageVariationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$WineImageVariationsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, String?> toMap() {
    return {
      "bottleLarge": bottleLarge,
      "label": label,
      "medium": medium,
      "smallSquare": smallSquare,
    };
  }
}
