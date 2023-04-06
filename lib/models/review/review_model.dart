import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/review/review_user_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "note")
  final String note;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "user")
  final ReviewUserModel reviewUserModel;

  ReviewModel(this.id, this.note, this.language, this.createdAt, this.rating, this.reviewUserModel);

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
