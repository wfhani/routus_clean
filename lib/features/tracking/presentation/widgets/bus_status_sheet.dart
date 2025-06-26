import 'package:flutter/material.dart';
import 'package:routus_clean/styles.dart';

class BusStatusSheet extends StatelessWidget {
  const BusStatusSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(
          'Bus status',
          style: TextStyle(color: Styles.primaryColor),
        ),
      ],
    );
  }
}
