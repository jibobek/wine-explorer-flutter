import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/vintage/image/wine_image_variations_model.dart';
part 'wine_image_model.g.dart';

@JsonSerializable()
class WineImageModel {
  @JsonKey(name: "location")
  final String location;
  @JsonKey(name: "variations")
  final WineImageVariationsModel variationsModel;

  WineImageModel(this.location, this.variationsModel);

  factory WineImageModel.fromJson(Map<String, dynamic> json) =>
      _$WineImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$WineImageModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
