import 'package:flutter/material.dart';
import 'package:wasteless/screens/about.dart';
import 'package:wasteless/screens/account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wasteless',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: AboutMeScreen());
  }
}
