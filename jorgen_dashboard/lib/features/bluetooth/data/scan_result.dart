import 'package:bluetooth_serial_next/bluetooth_serial_next.dart';

class BtScanResult {
  BluetoothSerialDevice device;

  BtScanResult(this.device);

  String getAddress() {
    return device.address;
  }
}
