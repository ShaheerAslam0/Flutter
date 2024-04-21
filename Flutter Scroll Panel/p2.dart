import 'dart:ui';
import 'package:flutter/material.dart';

class DynamicContainer extends StatefulWidget {
  const DynamicContainer({Key? key}) : super(key: key);

  @override
  _DynamicContainerState createState() => _DynamicContainerState();
}

class _DynamicContainerState extends State<DynamicContainer> {
  double _containerHeightPercentage = 0.5;
  bool _isExpanded = false;

  void _toggleContainerSize({required bool expand}) {
    setState(() {
      _isExpanded = expand;
      _containerHeightPercentage = _isExpanded ? 0.87 : 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade700),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Static"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy < 0) {
                  _toggleContainerSize(expand: true);
                } else if (details.delta.dy > 0) {
                  _toggleContainerSize(expand: false);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                height: MediaQuery.of(context).size.height *
                    _containerHeightPercentage,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(_isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up),
                      onPressed: () =>
                          _toggleContainerSize(expand: !_isExpanded),
                    ),
                    Expanded(
                      child: ListView(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dynamic",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
