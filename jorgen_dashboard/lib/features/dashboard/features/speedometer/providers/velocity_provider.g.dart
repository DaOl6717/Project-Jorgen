// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'velocity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentVelocity)
final currentVelocityProvider = CurrentVelocityProvider._();

final class CurrentVelocityProvider
    extends $NotifierProvider<CurrentVelocity, int> {
  CurrentVelocityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentVelocityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentVelocityHash();

  @$internal
  @override
  CurrentVelocity create() => CurrentVelocity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentVelocityHash() => r'b569c34c325f0968a8432a5ae01e332040998761';

abstract class _$CurrentVelocity extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
