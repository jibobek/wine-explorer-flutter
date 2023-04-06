// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) => ReviewsModel(
      (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
    };
