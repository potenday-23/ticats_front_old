// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsModelImpl _$$StatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsModelImpl(
      category: json['category'] as String,
      categoryCnt: json['categoryCnt'] as int,
      categoryPercent: (json['categoryPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatisticsModelImplToJson(
        _$StatisticsModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'categoryCnt': instance.categoryCnt,
      'categoryPercent': instance.categoryPercent,
    };
