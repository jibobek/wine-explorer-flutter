import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/wine/statistics/wine_statistics_model.dart';
import 'package:wine_explorer/models/wine/style/wine_style_model.dart';
part 'wine_model.g.dart';

@JsonSerializable()
class WineModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "has_valid_ratings")
  final bool hasValidRatings;
  @JsonKey(name: "statistics")
  final WineStatisticsModel wineStatisticsModel;
  @JsonKey(name: "style")
  final WineStyleModel? wineStyleModel;

  WineModel(this.id, this.name, this.hasValidRatings, this.wineStatisticsModel,
      this.wineStyleModel);

  factory WineModel.fromJson(Map<String, dynamic> json) =>
      _$WineModelFromJson(json);
  Map<String, dynamic> toJson() => _$WineModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
