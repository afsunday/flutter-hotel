import 'package:flutter/material.dart';
import 'package:ls_app/screens/ticket_view.dart';
import 'package:ls_app/screens/hotel_screen.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/widgets/double_text_widget.dart';

import '../utils/app_info_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Good Morning', style: Styles.headLineStyle4),
                            const Gap(5),
                            Text('Book Ticket', style: Styles.headLineStyle2)
                          ]),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/student.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD)
                    ),
                    child: Row(
                      children: [
                        const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205)),
                        Text('search', style: Styles.headLineStyle4)
                      ]
                    ),
                  ), 
                  const Gap(30),
                  const AppDoubleTextWidget(bigText:'Upcoming Flights', smallText: 'View all')
                ],
                ),
              ),
              // Ticket View Second section
              const Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: ticketList.map((iTicket) => TicketView(ticket: iTicket)).toList()
                ),
              ),
              const Gap(25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hotels', style: Styles.headLineStyle2),
                    InkWell(
                      child: Text('View all', style: Styles.textStyle.copyWith(color: Styles.primaryColor)), 
                      onTap: () => { }
                    )
                  ]
                ),
              ),
              const Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList()
                ),
              ),
            ],
          ),
        ),
      ),  
    );
  }
}
