import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const DotIndicator({
    required this.currentPage,
    required this.totalPages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPages,
              (index) => buildDot(index),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    // Active dot: 29x10 with border radius 17
    // Inactive dot: 10x10 with border radius 5
    double width = currentPage == index ? 29.0 : 10.0;
    double height = 10.0; // Height is always 10
    double borderRadius = currentPage == index ? 17.0 : 5.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400), // Smooth transition
      margin: const EdgeInsets.symmetric(horizontal: 3), // 6px space between dots
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: currentPage == index ? const Color(0xffFDC70A) : Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}