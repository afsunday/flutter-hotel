import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/widgets/column_layout.dart';
import 'package:ls_app/widgets/layout_builder_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage('https://img.icons8.com/emoji/512/hot-face.png'),
                      )
                    ),
                  ),

                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Book Tickets', style: Styles.headLineStyle2),
                      Text('New-York', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade500)),
                      const Gap(5),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFFFEF4f3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF526799),
                              ),
                              child: const Icon(FluentSystemIcons.ic_fluent_shield_filled, color: Colors.white, size: 14)
                            ),
                  
                            const Gap(5),
                            const Text('Premium status', style: TextStyle(
                              color: Color(0xFF526799)
                            ))
                          ],
                        )
                      )
                    ]
                  ),

                  const Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: Text('Edit', style: Styles.textStyle.copyWith(color: Styles.primaryColor),)
                  )
                ],
              ),


              // Section 2 below the fold
              const Gap(20),
              Divider(color: Colors.grey.shade400),
              Stack(
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Styles.primaryColor,
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),

                  Positioned(
                    top: -20,
                    right: -35,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 10, color: Color(0xFF264CD2))
                      )
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Icon(FluentSystemIcons.ic_fluent_lightbulb_filament_filled, color: Colors.yellow[800]),
                          maxRadius: 21,
                          backgroundColor: Colors.white
                        ),
                  
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You've got an new Award", 
                              style: Styles.headLineStyle2.copyWith(color: Colors.white)
                            ),
                  
                            const Gap(2),
                            Text(
                              "You have 95 flights in a year", 
                              style: Styles.headLineStyle3.copyWith(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 15)
                            ),
                          ],
                        )
                      ]
                    ),
                  ),
                ],
              ),

              const Gap(25),
              Text('Accumulated miles', style: Styles.headLineStyle2),

              const Gap(20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 5)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Text(
                      '192802', 
                      style: TextStyle(fontSize: 40, color: Styles.textColor, fontWeight: FontWeight.w600),
                    ),

                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Miles Accrued', 
                          style: Styles.headLineStyle4.copyWith(fontSize: 16)
                        ),

                        Text(
                          '23 May 2022', 
                          style: Styles.headLineStyle4.copyWith(fontSize: 16)
                        ),
                      ],
                    ),

                    const Gap(5),
                    Divider(height:1, color: Colors.grey.shade300),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          heading: '23, 842', 
                          subtext: 'Miles', 
                          alignment: CrossAxisAlignment.start
                        ),

                        AppColumnLayout(
                          heading: 'Airline Color', 
                          subtext: 'Received from', 
                          alignment: CrossAxisAlignment.end
                        )
                      ]
                    ),

                    const Gap(15),
                    const AppLayoutBuilderWidget(sections: 12, isColor: true),
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          heading: '24', 
                          subtext: 'Miles', 
                          alignment: CrossAxisAlignment.start
                        ),

                        AppColumnLayout(
                          heading: "McDonald's", 
                          subtext: 'Received from', 
                          alignment: CrossAxisAlignment.end
                        )
                      ]
                    ),

                    const Gap(15),
                    const AppLayoutBuilderWidget(sections: 12, isColor: true),
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          heading: '52 340', 
                          subtext: 'Miles', 
                          alignment: CrossAxisAlignment.start
                        ),

                        AppColumnLayout(
                          heading: "McDonald's", 
                          subtext: 'Received from', 
                          alignment: CrossAxisAlignment.end
                        )
                      ]
                    ),
                  ],
                )
              ),

              const Gap(25),
              Text(
                'How to get more miles', 
                style: Styles.textStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Styles.primaryColor
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(15),
            ],
          )
        ),
      ),  
    );
  }
}
