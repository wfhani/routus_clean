import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/features/tracking/presentation/widgets/bus_status_sheet.dart';
import 'package:routus_clean/styles.dart';

class DelayMessage extends StatelessWidget {
  const DelayMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 1.4,
          decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/delay.png',
                    width: 24,
                  ),
                  const SizedBox(width: 20),
                  const Flexible(
                    child: Text(
                      'Your bus is delayed by 15 minutes ',
                      style:
                          TextStyle(color: Styles.primaryColor, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                // onTap: () => showModalBottomSheet(
                //   showDragHandle: true,
                //   context: context,
                //   backgroundColor: Colors.white,
                //   shape: const RoundedRectangleBorder(
                //       borderRadius:
                //           BorderRadius.vertical(top: Radius.circular(30))),
                //   builder: (context) => const BusStatusSheet(),
                // ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFDC70A),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Bus Status',
                    style: TextStyle(
                        color: Styles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/icons/arrow_down.svg',
          width: 30,
        ),
      ],
    );
  }
}
