import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_oauth_model.freezed.dart';
part 'user_oauth_model.g.dart';

@freezed
class UserOAuthModel with _$UserOAuthModel {
  const factory UserOAuthModel({
    required String socialId,
    required String socialType,
  }) = _UserOAuthModel;

  factory UserOAuthModel.fromJson(Map<String, Object?> json) => _$UserOAuthModelFromJson(json);
}
