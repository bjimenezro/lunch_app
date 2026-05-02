// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientRepositoryHash() => r'1df43ba9994bb78a2be0fa0d111cb4ca870cfb94';

/// See also [clientRepository].
@ProviderFor(clientRepository)
final clientRepositoryProvider = AutoDisposeProvider<ClientRepository>.internal(
  clientRepository,
  name: r'clientRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clientRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRepositoryRef = AutoDisposeProviderRef<ClientRepository>;
String _$clientsNotifierHash() => r'12f04048d5fecc5e90f3d1f2db08b284d8b08dd6';

/// See also [ClientsNotifier].
@ProviderFor(ClientsNotifier)
final clientsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ClientsNotifier, List<Client>>.internal(
  ClientsNotifier.new,
  name: r'clientsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clientsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClientsNotifier = AutoDisposeAsyncNotifier<List<Client>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
