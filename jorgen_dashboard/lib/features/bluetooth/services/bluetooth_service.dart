import 'dart:async';

import 'package:bluetooth_serial_next/bluetooth_serial_next.dart';
import 'package:jorgen_dashboard/core/logging/logging.dart';

class BluetoothService {
  final BluetoothSerial bt = BluetoothSerial.instance;
  bool isInitialized = false;
  bool isScanning = false;

  Stream<BluetoothSerialDevice>? scanStream;

  Future<bool> requestPermissions() async {
    return bt.requestPermissions(scan: true);
  }

  Future<bool> requestEnable() async {
    return bt.requestEnable();
  }

  Future<bool> init() async {
    dInfo("Initializing BluetoothService");
    if (!BluetoothSerial.isSupported) {
      dWarn("BluetoothSerial is not supported on this device!");
      return false;
    }
    if (!(await requestPermissions())) {
      dWarn(
        "Can not start BluetoothService. We do not have bluetooth permissions.",
      );
      return false;
    }
    if (!(await requestEnable())) {
      dWarn("Can not start BluetoothService. Bluetooth is not enabled.");
      return false;
    }
    isInitialized = true;
    return true;
  }

  Future<Stream<BluetoothSerialDevice>?> scanDevices() async {
    if (scanStream != null) {
      dPrint("Already scanning!");
      return scanStream;
    }
    if (!isInitialized) {
      if (await init() == false) {
        dWarn("Could not scan devices, BluetoothService not initialized.");
        return null;
      }
    }

    dInfo("Starting scan for bluetooth devices");
    scanStream = bt.discover();

    return scanStream;
  }

  void stopScan() {
    scanStream = null;
    isScanning = false;
  }
}
