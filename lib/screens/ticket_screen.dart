import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/screens/ticket_view.dart';
import 'package:ls_app/utils/app_info_list.dart';
import 'package:ls_app/utils/app_layout.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:ls_app/widgets/column_layout.dart';
import 'package:ls_app/widgets/layout_builder_widget.dart';
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
                  const AppTicketTabs(firstTab: 'Upcoming', secondTab: 'Previous'),
                  const Gap(20),
                  
                  const SizedBox(height: 1),
                  
                  // top tcket item
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: TicketView(ticket: ticketList[0], isColor: true)
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            AppColumnLayout(
                              heading: 'Flutter DB', 
                              subtext: 'Passenger', 
                              alignment: CrossAxisAlignment.start
                            ),
                            AppColumnLayout(
                              heading: '5221345678', 
                              subtext: 'passport',
                              alignment: CrossAxisAlignment.end
                            )
                          ]
                        ),

                        const Gap(15),
                        const AppLayoutBuilderWidget(isColor: false, sections: 5, width: 3),
                        const Gap(15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            AppColumnLayout(
                              heading: '584286 854789', 
                              subtext: 'Number of E-ticket', 
                              alignment: CrossAxisAlignment.start
                            ),
                            AppColumnLayout(
                              heading: 'B2SG28', 
                              subtext: 'Booking code',
                              alignment: CrossAxisAlignment.end
                            )
                          ]
                        ),

                        const Gap(15),
                        const AppLayoutBuilderWidget(isColor: false, sections: 5, width: 3),
                        const Gap(15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            AppColumnLayout(
                              heading: 'VISA ***246', 
                              subtext: 'Payment Method', 
                              alignment: CrossAxisAlignment.start
                            ),
                            AppColumnLayout(
                              heading: '\$249.99', 
                              subtext: 'Price',
                              alignment: CrossAxisAlignment.end
                            ),
                            
                          ]
                        ),

                        const Gap(15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BarcodeWidget(
                            data: 'https://github.com/inlogicstudio', 
                            barcode: Barcode.code128(),
                            drawText: false,
                            color: Styles.textColor,
                            width: double.infinity,
                            height: 70,
                          ),
                        ),
                      ]
                    )
                  ),


                  // Bottom tcket item
                  const Gap(15),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: TicketView(ticket: ticketList[0])
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
