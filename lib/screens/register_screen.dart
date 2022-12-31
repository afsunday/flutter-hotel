import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
