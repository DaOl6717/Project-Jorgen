import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DashboardPage());
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Labadabadoo')),
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(8),
          children: [
            ElevatedButton(
          child: Text('Hejsan'),
          onPressed: () => print('Hej')),
          ElevatedButton(
          child: Text('Hejsan'),
          onPressed: () => print('Hej2')),
          ElevatedButton(
          child: Text('Hejsan'),
          onPressed: () => print('3He!!'),)
          ],),
        )
      );
  }
}
