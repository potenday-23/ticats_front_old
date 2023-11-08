// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_oauth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserOAuthModel _$UserOAuthModelFromJson(Map<String, dynamic> json) {
  return _UserOAuthModel.fromJson(json);
}

/// @nodoc
mixin _$UserOAuthModel {
  String get socialId => throw _privateConstructorUsedError;
  String get socialType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOAuthModelCopyWith<UserOAuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOAuthModelCopyWith<$Res> {
  factory $UserOAuthModelCopyWith(
          UserOAuthModel value, $Res Function(UserOAuthModel) then) =
      _$UserOAuthModelCopyWithImpl<$Res, UserOAuthModel>;
  @useResult
  $Res call({String socialId, String socialType});
}

/// @nodoc
class _$UserOAuthModelCopyWithImpl<$Res, $Val extends UserOAuthModel>
    implements $UserOAuthModelCopyWith<$Res> {
  _$UserOAuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialId = null,
    Object? socialType = null,
  }) {
    return _then(_value.copyWith(
      socialId: null == socialId
          ? _value.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as String,
      socialType: null == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOAuthModelImplCopyWith<$Res>
    implements $UserOAuthModelCopyWith<$Res> {
  factory _$$UserOAuthModelImplCopyWith(_$UserOAuthModelImpl value,
          $Res Function(_$UserOAuthModelImpl) then) =
      __$$UserOAuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String socialId, String socialType});
}

/// @nodoc
class __$$UserOAuthModelImplCopyWithImpl<$Res>
    extends _$UserOAuthModelCopyWithImpl<$Res, _$UserOAuthModelImpl>
    implements _$$UserOAuthModelImplCopyWith<$Res> {
  __$$UserOAuthModelImplCopyWithImpl(
      _$UserOAuthModelImpl _value, $Res Function(_$UserOAuthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialId = null,
    Object? socialType = null,
  }) {
    return _then(_$UserOAuthModelImpl(
      socialId: null == socialId
          ? _value.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as String,
      socialType: null == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserOAuthModelImpl implements _UserOAuthModel {
  const _$UserOAuthModelImpl(
      {required this.socialId, required this.socialType});

  factory _$UserOAuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOAuthModelImplFromJson(json);

  @override
  final String socialId;
  @override
  final String socialType;

  @override
  String toString() {
    return 'UserOAuthModel(socialId: $socialId, socialType: $socialType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOAuthModelImpl &&
            (identical(other.socialId, socialId) ||
                other.socialId == socialId) &&
            (identical(other.socialType, socialType) ||
                other.socialType == socialType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, socialId, socialType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOAuthModelImplCopyWith<_$UserOAuthModelImpl> get copyWith =>
      __$$UserOAuthModelImplCopyWithImpl<_$UserOAuthModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOAuthModelImplToJson(
      this,
    );
  }
}

abstract class _UserOAuthModel implements UserOAuthModel {
  const factory _UserOAuthModel(
      {required final String socialId,
      required final String socialType}) = _$UserOAuthModelImpl;

  factory _UserOAuthModel.fromJson(Map<String, dynamic> json) =
      _$UserOAuthModelImpl.fromJson;

  @override
  String get socialId;
  @override
  String get socialType;
  @override
  @JsonKey(ignore: true)
  _$$UserOAuthModelImplCopyWith<_$UserOAuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
