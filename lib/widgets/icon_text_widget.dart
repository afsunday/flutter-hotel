import 'package:flutter/material.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:gap/gap.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const AppIconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFBFC2DF)),
          const Gap(10),
          Text(text, style: Styles.textStyle)
        ],
      ),
    );
  }
}
