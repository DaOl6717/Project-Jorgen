import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jorgen_dashboard/core/logging/logging.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.20),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  DockButton(
                    imagePath: 'lib/assets/icons/big_poo_icon.png',
                    label: 'Function 1',
                    onPressed: () => dPrint('Cute cat 1 pressed'),
                  ),
                  DockButton(
                    imagePath: 'lib/assets/icons/big_poo_icon.png',
                    label: 'Function 2',
                    onPressed: () => dPrint('Cute cat 2 pressed'),
                  ),
                  DockButton(
                    imagePath: 'lib/assets/icons/big_poo_icon.png',
                    label: 'Function 3',
                    onPressed: () => dPrint('Cute cat 3 pressed'),
                  ),
                  DockButton(
                    imagePath: 'lib/assets/icons/big_poo_icon.png',
                    label: 'Function 4',
                    onPressed: () => dPrint('Cute cat 4 pressed'),
                  ),
                  DockButton(
                    imagePath: 'lib/assets/icons/big_poo_icon.png',
                    label: 'Function 5',
                    onPressed: () => dPrint('Cute cat 5 pressed'),
                  ),
                  DockButton(
                    imagePath: 'lib/assets/icons/big_poo_icon.png',
                    label: 'Function 6',
                    onPressed: () => dPrint('Cute cat 6 pressed'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DockButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const DockButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                imagePath, 
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
               ),
              )
            ),
          ),
        ),
      );
  }
}
