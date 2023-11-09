// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) {
  return _TicketModel.fromJson(json);
}

/// @nodoc
mixin _$TicketModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  DateTime get ticketDate => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  String? get seat => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get friend => throw _privateConstructorUsedError;
  String? get ticketType => throw _privateConstructorUsedError;
  String? get layoutType => throw _privateConstructorUsedError;
  bool? get isLike => throw _privateConstructorUsedError;
  String? get isPrivate => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  Member? get member => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketModelCopyWith<TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketModelCopyWith<$Res> {
  factory $TicketModelCopyWith(
          TicketModel value, $Res Function(TicketModel) then) =
      _$TicketModelCopyWithImpl<$Res, TicketModel>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String? imageUrl,
      String? imagePath,
      DateTime ticketDate,
      double rating,
      String? memo,
      String? seat,
      String? location,
      int? price,
      String? friend,
      String? ticketType,
      String? layoutType,
      bool? isLike,
      String? isPrivate,
      CategoryModel category,
      Member? member});

  $CategoryModelCopyWith<$Res> get category;
  $MemberCopyWith<$Res>? get member;
}

/// @nodoc
class _$TicketModelCopyWithImpl<$Res, $Val extends TicketModel>
    implements $TicketModelCopyWith<$Res> {
  _$TicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? imagePath = freezed,
    Object? ticketDate = null,
    Object? rating = null,
    Object? memo = freezed,
    Object? seat = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? friend = freezed,
    Object? ticketType = freezed,
    Object? layoutType = freezed,
    Object? isLike = freezed,
    Object? isPrivate = freezed,
    Object? category = null,
    Object? member = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketDate: null == ticketDate
          ? _value.ticketDate
          : ticketDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      friend: freezed == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String?,
      layoutType: freezed == layoutType
          ? _value.layoutType
          : layoutType // ignore: cast_nullable_to_non_nullable
              as String?,
      isLike: freezed == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketModelImplCopyWith<$Res>
    implements $TicketModelCopyWith<$Res> {
  factory _$$TicketModelImplCopyWith(
          _$TicketModelImpl value, $Res Function(_$TicketModelImpl) then) =
      __$$TicketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String? imageUrl,
      String? imagePath,
      DateTime ticketDate,
      double rating,
      String? memo,
      String? seat,
      String? location,
      int? price,
      String? friend,
      String? ticketType,
      String? layoutType,
      bool? isLike,
      String? isPrivate,
      CategoryModel category,
      Member? member});

  @override
  $CategoryModelCopyWith<$Res> get category;
  @override
  $MemberCopyWith<$Res>? get member;
}

/// @nodoc
class __$$TicketModelImplCopyWithImpl<$Res>
    extends _$TicketModelCopyWithImpl<$Res, _$TicketModelImpl>
    implements _$$TicketModelImplCopyWith<$Res> {
  __$$TicketModelImplCopyWithImpl(
      _$TicketModelImpl _value, $Res Function(_$TicketModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? imagePath = freezed,
    Object? ticketDate = null,
    Object? rating = null,
    Object? memo = freezed,
    Object? seat = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? friend = freezed,
    Object? ticketType = freezed,
    Object? layoutType = freezed,
    Object? isLike = freezed,
    Object? isPrivate = freezed,
    Object? category = null,
    Object? member = freezed,
  }) {
    return _then(_$TicketModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketDate: null == ticketDate
          ? _value.ticketDate
          : ticketDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      friend: freezed == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String?,
      layoutType: freezed == layoutType
          ? _value.layoutType
          : layoutType // ignore: cast_nullable_to_non_nullable
              as String?,
      isLike: freezed == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketModelImpl implements _TicketModel {
  const _$TicketModelImpl(
      {this.id,
      required this.title,
      this.imageUrl,
      this.imagePath,
      required this.ticketDate,
      required this.rating,
      required this.memo,
      required this.seat,
      required this.location,
      required this.price,
      required this.friend,
      required this.ticketType,
      required this.layoutType,
      this.isLike,
      this.isPrivate,
      required this.category,
      this.member});

  factory _$TicketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? imageUrl;
  @override
  final String? imagePath;
  @override
  final DateTime ticketDate;
  @override
  final double rating;
  @override
  final String? memo;
  @override
  final String? seat;
  @override
  final String? location;
  @override
  final int? price;
  @override
  final String? friend;
  @override
  final String? ticketType;
  @override
  final String? layoutType;
  @override
  final bool? isLike;
  @override
  final String? isPrivate;
  @override
  final CategoryModel category;
  @override
  final Member? member;

  @override
  String toString() {
    return 'TicketModel(id: $id, title: $title, imageUrl: $imageUrl, imagePath: $imagePath, ticketDate: $ticketDate, rating: $rating, memo: $memo, seat: $seat, location: $location, price: $price, friend: $friend, ticketType: $ticketType, layoutType: $layoutType, isLike: $isLike, isPrivate: $isPrivate, category: $category, member: $member)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.ticketDate, ticketDate) ||
                other.ticketDate == ticketDate) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.friend, friend) || other.friend == friend) &&
            (identical(other.ticketType, ticketType) ||
                other.ticketType == ticketType) &&
            (identical(other.layoutType, layoutType) ||
                other.layoutType == layoutType) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.member, member) || other.member == member));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      imageUrl,
      imagePath,
      ticketDate,
      rating,
      memo,
      seat,
      location,
      price,
      friend,
      ticketType,
      layoutType,
      isLike,
      isPrivate,
      category,
      member);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketModelImplCopyWith<_$TicketModelImpl> get copyWith =>
      __$$TicketModelImplCopyWithImpl<_$TicketModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketModelImplToJson(
      this,
    );
  }
}

abstract class _TicketModel implements TicketModel {
  const factory _TicketModel(
      {final int? id,
      required final String title,
      final String? imageUrl,
      final String? imagePath,
      required final DateTime ticketDate,
      required final double rating,
      required final String? memo,
      required final String? seat,
      required final String? location,
      required final int? price,
      required final String? friend,
      required final String? ticketType,
      required final String? layoutType,
      final bool? isLike,
      final String? isPrivate,
      required final CategoryModel category,
      final Member? member}) = _$TicketModelImpl;

  factory _TicketModel.fromJson(Map<String, dynamic> json) =
      _$TicketModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get imageUrl;
  @override
  String? get imagePath;
  @override
  DateTime get ticketDate;
  @override
  double get rating;
  @override
  String? get memo;
  @override
  String? get seat;
  @override
  String? get location;
  @override
  int? get price;
  @override
  String? get friend;
  @override
  String? get ticketType;
  @override
  String? get layoutType;
  @override
  bool? get isLike;
  @override
  String? get isPrivate;
  @override
  CategoryModel get category;
  @override
  Member? get member;
  @override
  @JsonKey(ignore: true)
  _$$TicketModelImplCopyWith<_$TicketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
