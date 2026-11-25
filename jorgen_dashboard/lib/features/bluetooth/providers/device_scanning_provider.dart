import 'dart:async';

import 'package:bluetooth_serial_next/bluetooth_serial_next.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorgen_dashboard/core/logging/logging.dart';
import 'package:jorgen_dashboard/features/bluetooth/data/scan_result.dart';
import 'package:jorgen_dashboard/features/bluetooth/providers/bluetooth_service_provider.dart';

final btScanProvider =
    AsyncNotifierProvider<DeviceScanningProvider, List<BtScanResult>>(
      DeviceScanningProvider.new,
    );

class DeviceScanningProvider extends AsyncNotifier<List<BtScanResult>> {
  StreamSubscription<BluetoothSerialDevice>? subscription;
  @override
  List<BtScanResult> build() {
    ref.onDispose(() {
      subscription?.cancel();
    });

    ref.read(btServiceProvider);

    return [];
  }

  Future<void> scan() async {
    final btService = ref.read(btServiceProvider);
    if (!btService.isInitialized || btService.isScanning) {
      return;
    }

    await subscription?.cancel();
    state = AsyncData([]);

    final deviceStream = await btService.scanDevices();
    if (deviceStream != null) {
      deviceStream.listen(
        (device) {
          final List<BtScanResult> deviceList = state.hasValue
              ? state.requireValue
              : [];

          final isNew = !deviceList.any((d) {
            return d.getAddress() == device.address;
          });
          if (isNew) {
            deviceList.add(BtScanResult(device));

            final listCopy = List<BtScanResult>.from(deviceList);

            state = AsyncValue.data(listCopy);
          }
        },
        onError: (error, stackTrace) {
          dError(error.toString());
          state = AsyncError(error, stackTrace);
        },
        onDone: () => btService.stopScan(),
      );
    }
  }

  void clearDevices() {
    state = const AsyncData([]);
  }
}
