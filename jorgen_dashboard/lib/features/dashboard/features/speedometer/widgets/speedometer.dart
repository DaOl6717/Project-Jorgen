import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:jorgen_dashboard/features/dashboard/features/speedometer/providers/velocity_provider.dart';

class Speedometer extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final velocity = ref.watch(currentVelocityProvider);
    return SizedBox(
      width: 280,
      height: 200,
      child: AnimatedRadialGauge(
        duration: const Duration(milliseconds: 800),
        value: velocity.toDouble(),
        axis: const GaugeAxis(min: 0, max: 100),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: velocity.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
                  text: " km/h",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
