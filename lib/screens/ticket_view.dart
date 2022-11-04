import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ls_app/utils/app_layout.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:ls_app/widgets/layout_builder_widget.dart';
import 'package:ls_app/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;

  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.82,
      // height: AppLayout.getHeight(169),
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
        color: isColor == null ?const Color(0xFF526799) : Colors.white,
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
      color: isColor == null ? Styles.orangeColor : Colors.white,
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

          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: AppLayoutBuilderWidget(isColor: null, sections: 6)
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
        color: isColor == null ? Styles.orangeColor : Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isColor== null ? 15: 0), 
          bottomRight: Radius.circular(isColor== null ? 15: 0),
        ),
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
                    style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,
                  ),
                  Text('date',
                    style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${ticket['departure_time']}',
                      style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3.copyWith(color: Colors.black),
                    ),
                    Text(
                      'Departure time',
                      style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${ticket['number']}',
                    style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,
                  ),
                  Text(
                    'Number',
                    style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
                  ),
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
        Text(
          '${ticket['from']['code']}',
          style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,
        ),
        const Spacer(),
        const ThickContainer(),
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Transform.rotate(
                  angle: 1.6,
                  child: Icon(Icons.local_airport_rounded,
                      color: isColor == null ? Colors.white : Colors.grey.shade500),
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
                          (index) => Text('-', style: TextStyle(color: isColor == null ? Colors.white : Colors.grey.shade500)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const ThickContainer(),
        const Spacer(),
        Text(
          '${ticket['to']['code']}',
          style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3
        )
      ],
    );
  }

  // widget second ticket item
  Widget secondTicketItem() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '${ticket['from']['name']}',
            style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
          ),
        ),
        Expanded(
          child: Text(
            '${ticket['flying_time']}',
            textAlign: TextAlign.center,
            style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 100,
          child: Text('${ticket['to']['name']}',
            textAlign: TextAlign.right,
            style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
          ),
        ),
      ],
    );
  }
}
