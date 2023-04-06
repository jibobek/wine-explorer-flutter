// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wine_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineStatisticsModel _$WineStatisticsModelFromJson(Map<String, dynamic> json) =>
    WineStatisticsModel(
      json['status'] as String,
      json['ratings_count'] as int,
      (json['ratings_average'] as num).toDouble(),
      json['labels_count'] as int,
      json['vintages_count'] as int,
    );

Map<String, dynamic> _$WineStatisticsModelToJson(
        WineStatisticsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'ratings_count': instance.ratingsCount,
      'ratings_average': instance.ratingsAverage,
      'labels_count': instance.labelsCount,
      'vintages_count': instance.vintagesCount,
    };
