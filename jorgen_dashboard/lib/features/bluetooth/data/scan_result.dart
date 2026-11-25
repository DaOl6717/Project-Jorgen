import 'package:bluetooth_serial_next/bluetooth_serial_next.dart';

class BtScanResult {
  final BluetoothSerialDevice device;

  BtScanResult(this.device);

  String getAddress() {
    return device.address;
  }

  String? getName() {
    return device.name;
  }

  int? getRSSI() {
    return device.rssi;
  }

  BluetoothSerialDevice getDevice() {
    return device;
  }
}
