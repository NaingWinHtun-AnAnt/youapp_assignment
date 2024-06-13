import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/pages/login_page.dart';
import 'package:youapp_assignment/persistence/hive_constants.dart';

void main() async {
  await Hive.initFlutter();

  /// register Adapter to custom object
  Hive.registerAdapter(ProfileVOAdapter());

  /// open box
  await Hive.openBox<ProfileVO>(boxNameProfileVO);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
