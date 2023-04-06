import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/review/review_model.dart';
part 'reviews_model.g.dart';

@JsonSerializable()
class ReviewsModel {
  @JsonKey(name: "reviews")
  final List<ReviewModel> reviews;

  ReviewsModel(this.reviews);

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
