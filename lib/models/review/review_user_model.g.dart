// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewUserModel _$ReviewUserModelFromJson(Map<String, dynamic> json) =>
    ReviewUserModel(
      json['id'] as int,
      json['alias'] as String,
      ReviewUserImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewUserModelToJson(ReviewUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'image': instance.image,
    };
