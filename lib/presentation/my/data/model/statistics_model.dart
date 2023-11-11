import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

@freezed
class StatisticsModel with _$StatisticsModel {
  const factory StatisticsModel({
    required String category,
    required int categoryCnt,
    required double categoryPercent,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, Object?> json) => _$StatisticsModelFromJson(json);
}
