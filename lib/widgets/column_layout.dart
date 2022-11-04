import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/utils/app_styles.dart';

class AppColumnLayout extends StatelessWidget {
  final String heading;
  final String subtext;
  final CrossAxisAlignment alignment;

  const AppColumnLayout(
      {Key? key, required this.heading, required this.subtext, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          heading,
          style: Styles.headLineStyle3.copyWith(color: Colors.black)
        ),
        const Gap(2),
        Text(
          subtext,
          style: Styles.headLineStyle4,
        ),
      ],
    );
  }
}
