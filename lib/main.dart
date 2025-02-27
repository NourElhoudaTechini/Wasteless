import 'package:flutter/material.dart';
import 'package:wasteless/screens/scan.dart';
import 'package:wasteless/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteless',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade100),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ScanObjectScreen(),
    );
  }
}
