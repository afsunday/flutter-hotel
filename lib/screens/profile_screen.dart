import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:gap/gap.dart';

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
                    decoration: BoxDecoration(
                      color: Styles.primaryColor,
                      borderRadius: BorderRadius.circular(15)
                    )
                  )
                ],
              )
            ],
          )
        ),
      ),  
    );
  }
}
