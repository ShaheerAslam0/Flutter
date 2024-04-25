import 'package:flutter/material.dart';

class BarChartLine extends StatelessWidget {
  final double value;
  final Color color;

  const BarChartLine({
    Key? key,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barWidth = value.clamp(0, 10) / 10 * (screenWidth - 60);
    final double minimumBarWidth = (value == 10) ? 0 : 20.0;

    if (value == 10) {
      barWidth = screenWidth;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: screenWidth - 20,
          height: 3.0,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(
            children: [
              if (value < 10)
                Positioned(
                  left: barWidth.clamp(0, screenWidth - 60 - minimumBarWidth),
                  child: Container(
                    width: minimumBarWidth,
                    height: 5.0,
                    color: Colors.white,
                  ),
                ),
              Container(
                width: barWidth.clamp(minimumBarWidth, screenWidth - 40),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
