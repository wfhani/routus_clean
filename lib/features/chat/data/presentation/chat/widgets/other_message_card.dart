import 'package:flutter/material.dart';

class OtherMessageCard extends StatelessWidget {
  const OtherMessageCard(
      {super.key, required this.message, required this.time});

  final String message, time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: MediaQuery.of(context).size.width * 0.1,
        bottom: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(16),
                    topStart: Radius.circular(0),
                    bottomStart: Radius.circular(16),
                    bottomEnd: Radius.circular(16),
                  ),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                      color: Color(0xFF052A43),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
