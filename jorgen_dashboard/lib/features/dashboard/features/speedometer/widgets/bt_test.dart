import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorgen_dashboard/features/bluetooth/providers/device_scanning_provider.dart';

class BtTestWidget extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<BtTestWidget> createState() => _BtTestWidgetState();
}

class _BtTestWidgetState extends ConsumerState<BtTestWidget> {
  @override
  Widget build(BuildContext context) {
    final devicesAsync = ref.watch(btScanProvider);
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(btScanProvider.notifier).scan();
            },
            child: const Text('Scan devices'),
          ),

          Expanded(
            child: devicesAsync.when(
              loading: () => const CircularProgressIndicator(),

              error: (error, stack) => Text('Error: $error'),

              data: (devices) {
                return ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final d = devices[index];

                    return ListTile(
                      title: Text(d.device.name ?? 'Unknown device'),
                      subtitle: Text(d.device.address),
                      trailing: Text('${d.device.rssi} dBm'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
