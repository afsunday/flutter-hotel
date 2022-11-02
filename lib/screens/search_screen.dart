import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:ls_app/utils/app_layout.dart';
import 'package:ls_app/widgets/double_text_widget.dart';
import 'package:ls_app/widgets/icon_text_widget.dart';
import 'package:ls_app/widgets/ticket_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(16),
              vertical: AppLayout.getHeight(16),
            ),
            children: [
              Gap(AppLayout.getHeight(10)),
              Text('What are\nyou looking for?',
                  style: Styles.headLineStyle1
                      .copyWith(fontSize: AppLayout.getHeight(28))),
              Gap(AppLayout.getHeight(20)),
        
              // Switchable tab
              const AppTicketTabs(firstTab: 'Airline Tickets', secondTab: 'Hotels'),
        
              // Following item after tab
              const Gap(17),
              const AppIconText(icon: Icons.flight_takeoff_rounded, text: 'Departure'),
              const Gap(12),
              const AppIconText(icon: Icons.flight_land_rounded, text: 'Arrival'),
              const Gap(20),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.blue[900]),
                child: Center(child: Text('Find Tickets', style: Styles.textStyle.copyWith(color: Colors.white)))
              ),
        
        
              // upcoming flight section
              const Gap(25),
              const AppDoubleTextWidget(bigText:'Upcoming Flights', smallText: 'View all'),
        
              // flight social Text
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppLayout.getHeight(400),
                    width: size.width * 0.44,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 2,
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppLayout.getHeight(198),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/student-bench.png')
                            ),
                          ),
                        ),
        
                        // Container inner text
                        const Gap(25),
                        Text(
                          "20% discount on the early booking of this flight, Don't miss out this chance.", 
                          style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w400),
                        )
                      ]
                    )
                  ),
        
                  // right side of upcoming flight column
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: size.width * 0.44,
                            // height: AppLayout.getHeight(180),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3AB8B8),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight:FontWeight.w500 )),
                                Gap(AppLayout.getHeight(10)),
                                Text("Take the survey about our service and get discount.", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight:FontWeight.w500, fontSize: 17)),
                              ]
                            ),
                          ),
        
                          // circle item for first column
                          Positioned(
                            right: -35,
                            top: -30,
                            child: Container(
                              padding: const EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 10, color: Color(0xFF189999)),
                                color: Colors.transparent
                              ),
                            ),
                          ),
                        ]
                      ),
        
                      // second item for right column
                      const Gap(25),
                      Container(
                        width: size.width * 0.44,
                        height: AppLayout.getHeight(200),
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        decoration: BoxDecoration(
                          color: const Color(0XFFEC6545),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Text('Take Love', style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            Gap(AppLayout.getHeight(15)),
                            RichText(text: const TextSpan(
                              children: [
                                TextSpan(text: '😍', style: TextStyle(fontSize: 28)),
                                TextSpan(text: '🥰', style: TextStyle(fontSize: 40)),
                                TextSpan(text: '😍', style: TextStyle(fontSize: 28))
                              ]
                            ))
                          ]
                        ),
                      ),
                    ],
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
