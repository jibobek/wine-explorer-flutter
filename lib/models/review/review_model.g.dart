// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      json['id'] as int,
      json['note'] as String,
      json['language'] as String,
      json['created_at'] as String,
      (json['rating'] as num).toDouble(),
      ReviewUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'language': instance.language,
      'created_at': instance.createdAt,
      'rating': instance.rating,
      'user': instance.reviewUserModel,
    };
