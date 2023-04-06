import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'review_user_image_model.g.dart';

@JsonSerializable()
class ReviewUserImageModel {
  @JsonKey(name: "location")
  final String location;

  ReviewUserImageModel(this.location);

  factory ReviewUserImageModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewUserImageModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
