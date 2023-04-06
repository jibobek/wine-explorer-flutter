import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/vintage/image/wine_image_model.dart';
import 'package:wine_explorer/models/wine/wine_model.dart';
import 'package:wine_explorer/utils/model_utils.dart';
part 'vintage_model.g.dart';

@JsonSerializable()
class VintageModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(fromJson: ModelUtils.yearToInt, name: "year")
  final int? year;
  @JsonKey(name: "wine")
  final WineModel wineModel;
  @JsonKey(name: "image")
  final WineImageModel wineImageModel;

  VintageModel(this.wineModel, this.wineImageModel, {required this.id, required this.name, required this.year});

  factory VintageModel.fromJson(Map<String, dynamic> json) =>
      _$VintageModelFromJson(json);
  Map<String, dynamic> toJson() => _$VintageModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
