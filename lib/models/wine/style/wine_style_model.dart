import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'wine_style_model.g.dart';

@JsonSerializable()
class WineStyleModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "body_description")
  final String bodyDescription;

  WineStyleModel(this.name, this.bodyDescription);

  factory WineStyleModel.fromJson(Map<String, dynamic> json) =>
      _$WineStyleModelFromJson(json);
  Map<String, dynamic> toJson() => _$WineStyleModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
