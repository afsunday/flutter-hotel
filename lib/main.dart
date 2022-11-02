import 'package:flutter/material.dart';
import 'package:ls_app/screens/bottom_bar.dart';
import 'package:ls_app/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logicapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const SafeArea(
        child: BottomBar()
      ),
    );
  }
}

