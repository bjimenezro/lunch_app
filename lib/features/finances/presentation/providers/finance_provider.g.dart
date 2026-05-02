// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentRepositoryHash() => r'00c825f4a3af9c788bde7893c4c9054144bfad6a';

/// See also [paymentRepository].
@ProviderFor(paymentRepository)
final paymentRepositoryProvider =
    AutoDisposeProvider<PaymentRepository>.internal(
  paymentRepository,
  name: r'paymentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentRepositoryRef = AutoDisposeProviderRef<PaymentRepository>;
String _$financeNotifierHash() => r'3b74a8e316c8e8609c238391fa8f699e4ee82c94';

/// See also [FinanceNotifier].
@ProviderFor(FinanceNotifier)
final financeNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FinanceNotifier, List<Client>>.internal(
  FinanceNotifier.new,
  name: r'financeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$financeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FinanceNotifier = AutoDisposeAsyncNotifier<List<Client>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
