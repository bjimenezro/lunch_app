// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$menuRepositoryHash() => r'49091a931813c05536ab294d78c7c854ea60a413';

/// See also [menuRepository].
@ProviderFor(menuRepository)
final menuRepositoryProvider = AutoDisposeProvider<MenuRepository>.internal(
  menuRepository,
  name: r'menuRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$menuRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MenuRepositoryRef = AutoDisposeProviderRef<MenuRepository>;
String _$menuNotifierHash() => r'0a2e2553ac968aaf7569715ec05514ffe8194d09';

/// See also [MenuNotifier].
@ProviderFor(MenuNotifier)
final menuNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MenuNotifier, List<Menu>>.internal(
  MenuNotifier.new,
  name: r'menuNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$menuNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MenuNotifier = AutoDisposeAsyncNotifier<List<Menu>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
