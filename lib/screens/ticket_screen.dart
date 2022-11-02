import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/utils/app_layout.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:ls_app/widgets/ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SafeArea(
        child: Scrollbar(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: [
                  const Gap(10),
                  Text('Tickets', style: Styles.headLineStyle1
                      .copyWith(fontSize: AppLayout.getHeight(28))),
                  const Gap(20),
                  const AppTicketTabs(firstTab: 'Upcoming', secondTab: 'Previous')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
