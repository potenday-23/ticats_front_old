import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required Token? token,
    required Member? member,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}

@freezed
class Token with _$Token {
  const factory Token({
    required String? accessToken,
    required String? refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}

@freezed
class Member with _$Member {
  const factory Member({
    required int? id,
    required String? nickname,
    required String? profileUrl,
    required String? marketingAgree,
    required String? pushAgree,
    required DateTime? createdDate,
    required DateTime? updatedDate,
    required List<String>? categorys,
  }) = _Member;

  factory Member.fromJson(Map<String, Object?> json) => _$MemberFromJson(json);
}
