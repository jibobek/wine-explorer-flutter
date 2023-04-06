import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'wine_statistics_model.g.dart';

@JsonSerializable()
class WineStatisticsModel {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "ratings_count")
  final int ratingsCount;
  @JsonKey(name: "ratings_average")
  final double ratingsAverage;
  @JsonKey(name: "labels_count")
  final int labelsCount;
  @JsonKey(name: "vintages_count")
  final int vintagesCount;

  WineStatisticsModel(this.status, this.ratingsCount, this.ratingsAverage,
      this.labelsCount, this.vintagesCount);

  factory WineStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$WineStatisticsModelFromJson(json);
  Map<String, dynamic> toJson() => _$WineStatisticsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
