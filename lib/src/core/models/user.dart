import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    String? firstName,
    String? lastName,
    String? email,
  }) = _User;

  const User._();

  bool get isNotNull => firstName != null && lastName != null && email != null;
}
