import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/utils/app_layout.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:ls_app/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;

  const TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(185),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [firstContainer(), secondContainer(), thirdContainer()],
        ),
      ),
    );
  }

  // widget first container
  Widget firstContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF526799),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppLayout.getHeight(15)), 
          topRight: Radius.circular(AppLayout.getHeight(15)),
        ),
      ),
      padding: EdgeInsets.all(AppLayout.getHeight(16)),
      child: Column(
        children: [firstTicketItem(), const Gap(5), secondTicketItem()],
      ),
    );
  }

  // widget second container
  Widget secondContainer() {
    return Container(
      color: Styles.orangeColor,
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                        (constraints.constrainWidth() / 15).floor(), (index) {
                      return const Text('-',
                          style: TextStyle(color: Colors.white));
                    }),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // widget third container item
  Widget thirdContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Styles.orangeColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${ticket['date']}',
                      style:
                          Styles.headLineStyle3.copyWith(color: Colors.white)),
                  Text('date',
                      style:
                          Styles.headLineStyle4.copyWith(color: Colors.white)),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('${ticket['departure_time']}',
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.white)),
                    Text('Departure time',
                        style: Styles.headLineStyle4
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${ticket['number']}',
                      style:
                          Styles.headLineStyle3.copyWith(color: Colors.white)),
                  Text('Number',
                      style:
                          Styles.headLineStyle4.copyWith(color: Colors.white)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  /// widget ticket item one
  Widget firstTicketItem() {
    return Row(
      children: [
        Text('${ticket['from']['code']}', style: Styles.headLineStyle3.copyWith(color: Colors.white)),
        const Spacer(),
        const ThickContainer(),
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Transform.rotate(
                  angle: 1.6,
                  child: const Icon(Icons.local_airport_rounded,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(24),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          (constraints.constrainWidth() / 8).floor(),
                          (index) => const Text('-',
                              style: TextStyle(color: Colors.white))),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const ThickContainer(),
        const Spacer(),
        Text('${ticket['to']['code']}', style: Styles.headLineStyle3.copyWith(color: Colors.white))
      ],
    );
  }

  // widget second ticket item
  Widget secondTicketItem() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text('${ticket['from']['name']}',
              style: Styles.headLineStyle4.copyWith(color: Colors.white)),
        ),
        Expanded(
            child: Text('${ticket['flying_time']}',
                textAlign: TextAlign.center,
                style: Styles.headLineStyle4.copyWith(color: Colors.white))),
        SizedBox(
          width: 100,
          child: Text('${ticket['to']['name']}',
              textAlign: TextAlign.right,
              style: Styles.headLineStyle4.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
