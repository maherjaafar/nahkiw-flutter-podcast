// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_action_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthActionItem {
  String get text => throw _privateConstructorUsedError;
  VoidCallback get onPressed => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get secondaryText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthActionItemCopyWith<AuthActionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthActionItemCopyWith<$Res> {
  factory $AuthActionItemCopyWith(
          AuthActionItem value, $Res Function(AuthActionItem) then) =
      _$AuthActionItemCopyWithImpl<$Res, AuthActionItem>;
  @useResult
  $Res call(
      {String text,
      VoidCallback onPressed,
      bool isLoading,
      String? secondaryText});
}

/// @nodoc
class _$AuthActionItemCopyWithImpl<$Res, $Val extends AuthActionItem>
    implements $AuthActionItemCopyWith<$Res> {
  _$AuthActionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? onPressed = null,
    Object? isLoading = null,
    Object? secondaryText = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthActionItemImplCopyWith<$Res>
    implements $AuthActionItemCopyWith<$Res> {
  factory _$$AuthActionItemImplCopyWith(_$AuthActionItemImpl value,
          $Res Function(_$AuthActionItemImpl) then) =
      __$$AuthActionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      VoidCallback onPressed,
      bool isLoading,
      String? secondaryText});
}

/// @nodoc
class __$$AuthActionItemImplCopyWithImpl<$Res>
    extends _$AuthActionItemCopyWithImpl<$Res, _$AuthActionItemImpl>
    implements _$$AuthActionItemImplCopyWith<$Res> {
  __$$AuthActionItemImplCopyWithImpl(
      _$AuthActionItemImpl _value, $Res Function(_$AuthActionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? onPressed = null,
    Object? isLoading = null,
    Object? secondaryText = freezed,
  }) {
    return _then(_$AuthActionItemImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthActionItemImpl implements _AuthActionItem {
  _$AuthActionItemImpl(
      {required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.secondaryText});

  @override
  final String text;
  @override
  final VoidCallback onPressed;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? secondaryText;

  @override
  String toString() {
    return 'AuthActionItem(text: $text, onPressed: $onPressed, isLoading: $isLoading, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthActionItemImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, text, onPressed, isLoading, secondaryText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthActionItemImplCopyWith<_$AuthActionItemImpl> get copyWith =>
      __$$AuthActionItemImplCopyWithImpl<_$AuthActionItemImpl>(
          this, _$identity);
}

abstract class _AuthActionItem implements AuthActionItem {
  factory _AuthActionItem(
      {required final String text,
      required final VoidCallback onPressed,
      final bool isLoading,
      final String? secondaryText}) = _$AuthActionItemImpl;

  @override
  String get text;
  @override
  VoidCallback get onPressed;
  @override
  bool get isLoading;
  @override
  String? get secondaryText;
  @override
  @JsonKey(ignore: true)
  _$$AuthActionItemImplCopyWith<_$AuthActionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
