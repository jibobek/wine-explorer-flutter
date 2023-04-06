import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/review/review_user_image_model.dart';
part 'review_user_model.g.dart';

@JsonSerializable()
class ReviewUserModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "alias")
  final String alias;
  @JsonKey(name: "image")
  final ReviewUserImageModel image;

  ReviewUserModel(this.id, this.alias, this.image);

  factory ReviewUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewUserModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
