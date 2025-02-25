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
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade100),
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: AboutMeScreen());
  }
}
