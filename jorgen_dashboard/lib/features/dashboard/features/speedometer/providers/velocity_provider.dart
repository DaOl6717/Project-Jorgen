import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'velocity_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentVelocity extends _$CurrentVelocity {
  int i = 0;
  @override
  int build() {
    Timer.periodic(Duration(seconds: 1), (_) {
      i += 5;
      state = i;
    });
    return 0;
  }
}
