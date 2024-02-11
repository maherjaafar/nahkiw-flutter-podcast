// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationStatusHash() =>
    r'92c0943d4d3bd02c46b4bbe3f4519d3d01c3d6f2';

/// See also [authenticationStatus].
@ProviderFor(authenticationStatus)
final authenticationStatusProvider =
    AutoDisposeProvider<AuthenticationStatus>.internal(
  authenticationStatus,
  name: r'authenticationStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationStatusRef = AutoDisposeProviderRef<AuthenticationStatus>;
String _$authenticationHash() => r'8217dd0bcb571d3386bd2faf38f906523acaf09f';

/// See also [Authentication].
@ProviderFor(Authentication)
final authenticationProvider = AutoDisposeAsyncNotifierProvider<Authentication,
    AuthenticationState>.internal(
  Authentication.new,
  name: r'authenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Authentication = AutoDisposeAsyncNotifier<AuthenticationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
