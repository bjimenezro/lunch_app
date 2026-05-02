// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deliveryRepositoryHash() =>
    r'ff623810524aff0a407b2be8c9c193998daf69eb';

/// See also [deliveryRepository].
@ProviderFor(deliveryRepository)
final deliveryRepositoryProvider =
    AutoDisposeProvider<DeliveryRepository>.internal(
  deliveryRepository,
  name: r'deliveryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeliveryRepositoryRef = AutoDisposeProviderRef<DeliveryRepository>;
String _$dailyDeliveriesNotifierHash() =>
    r'839f4027fe0f25dc870fb56baa4b056577cfee40';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DailyDeliveriesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Delivery>> {
  late final DateTime date;

  FutureOr<List<Delivery>> build(
    DateTime date,
  );
}

/// See also [DailyDeliveriesNotifier].
@ProviderFor(DailyDeliveriesNotifier)
const dailyDeliveriesNotifierProvider = DailyDeliveriesNotifierFamily();

/// See also [DailyDeliveriesNotifier].
class DailyDeliveriesNotifierFamily extends Family<AsyncValue<List<Delivery>>> {
  /// See also [DailyDeliveriesNotifier].
  const DailyDeliveriesNotifierFamily();

  /// See also [DailyDeliveriesNotifier].
  DailyDeliveriesNotifierProvider call(
    DateTime date,
  ) {
    return DailyDeliveriesNotifierProvider(
      date,
    );
  }

  @override
  DailyDeliveriesNotifierProvider getProviderOverride(
    covariant DailyDeliveriesNotifierProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailyDeliveriesNotifierProvider';
}

/// See also [DailyDeliveriesNotifier].
class DailyDeliveriesNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DailyDeliveriesNotifier,
        List<Delivery>> {
  /// See also [DailyDeliveriesNotifier].
  DailyDeliveriesNotifierProvider(
    DateTime date,
  ) : this._internal(
          () => DailyDeliveriesNotifier()..date = date,
          from: dailyDeliveriesNotifierProvider,
          name: r'dailyDeliveriesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailyDeliveriesNotifierHash,
          dependencies: DailyDeliveriesNotifierFamily._dependencies,
          allTransitiveDependencies:
              DailyDeliveriesNotifierFamily._allTransitiveDependencies,
          date: date,
        );

  DailyDeliveriesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  FutureOr<List<Delivery>> runNotifierBuild(
    covariant DailyDeliveriesNotifier notifier,
  ) {
    return notifier.build(
      date,
    );
  }

  @override
  Override overrideWith(DailyDeliveriesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DailyDeliveriesNotifierProvider._internal(
        () => create()..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DailyDeliveriesNotifier,
      List<Delivery>> createElement() {
    return _DailyDeliveriesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyDeliveriesNotifierProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DailyDeliveriesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Delivery>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DailyDeliveriesNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DailyDeliveriesNotifier,
        List<Delivery>> with DailyDeliveriesNotifierRef {
  _DailyDeliveriesNotifierProviderElement(super.provider);

  @override
  DateTime get date => (origin as DailyDeliveriesNotifierProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
