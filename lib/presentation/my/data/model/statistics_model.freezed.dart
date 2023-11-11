// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) {
  return _StatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticsModel {
  String get category => throw _privateConstructorUsedError;
  int get categoryCnt => throw _privateConstructorUsedError;
  double get categoryPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res, StatisticsModel>;
  @useResult
  $Res call({String category, int categoryCnt, double categoryPercent});
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res, $Val extends StatisticsModel>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? categoryCnt = null,
    Object? categoryPercent = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      categoryCnt: null == categoryCnt
          ? _value.categoryCnt
          : categoryCnt // ignore: cast_nullable_to_non_nullable
              as int,
      categoryPercent: null == categoryPercent
          ? _value.categoryPercent
          : categoryPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsModelImplCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$$StatisticsModelImplCopyWith(_$StatisticsModelImpl value,
          $Res Function(_$StatisticsModelImpl) then) =
      __$$StatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, int categoryCnt, double categoryPercent});
}

/// @nodoc
class __$$StatisticsModelImplCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res, _$StatisticsModelImpl>
    implements _$$StatisticsModelImplCopyWith<$Res> {
  __$$StatisticsModelImplCopyWithImpl(
      _$StatisticsModelImpl _value, $Res Function(_$StatisticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? categoryCnt = null,
    Object? categoryPercent = null,
  }) {
    return _then(_$StatisticsModelImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      categoryCnt: null == categoryCnt
          ? _value.categoryCnt
          : categoryCnt // ignore: cast_nullable_to_non_nullable
              as int,
      categoryPercent: null == categoryPercent
          ? _value.categoryPercent
          : categoryPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsModelImpl implements _StatisticsModel {
  const _$StatisticsModelImpl(
      {required this.category,
      required this.categoryCnt,
      required this.categoryPercent});

  factory _$StatisticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsModelImplFromJson(json);

  @override
  final String category;
  @override
  final int categoryCnt;
  @override
  final double categoryPercent;

  @override
  String toString() {
    return 'StatisticsModel(category: $category, categoryCnt: $categoryCnt, categoryPercent: $categoryPercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.categoryCnt, categoryCnt) ||
                other.categoryCnt == categoryCnt) &&
            (identical(other.categoryPercent, categoryPercent) ||
                other.categoryPercent == categoryPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, categoryCnt, categoryPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      __$$StatisticsModelImplCopyWithImpl<_$StatisticsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsModelImplToJson(
      this,
    );
  }
}

abstract class _StatisticsModel implements StatisticsModel {
  const factory _StatisticsModel(
      {required final String category,
      required final int categoryCnt,
      required final double categoryPercent}) = _$StatisticsModelImpl;

  factory _StatisticsModel.fromJson(Map<String, dynamic> json) =
      _$StatisticsModelImpl.fromJson;

  @override
  String get category;
  @override
  int get categoryCnt;
  @override
  double get categoryPercent;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
