import 'package:flutter/material.dart';
import 'package:flutter_sqflite/view/home_screen/home_screen.dart';

import 'controller/home_screen_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreenController.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sqfilte Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
