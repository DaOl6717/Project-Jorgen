import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorgen_dashboard/features/bluetooth/services/bluetooth_service.dart';

final btServiceProvider = Provider((ref) {
  final btService = BluetoothService();
  btService.init();
  return btService;
});
