import 'package:flutter/material.dart';
import 'package:ls_app/utils/app_layout.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({Key? key, required this.firstTab, required this.secondTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: size.width * 0.48,
            padding: const EdgeInsets.all(17),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
            ),
            child: Center(child: Text(firstTab)),
          ),

          // Second Row item
          Expanded(
            child: Center(child: Text(secondTab)),
          ),
        ],
      ),
    );
  }
}
