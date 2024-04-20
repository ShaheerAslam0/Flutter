import 'package:flutter/material.dart';


class ScrollableScaffold extends StatelessWidget {
  const ScrollableScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:  FloatingActionButton(onPressed: () {}, child: const Text('Enter')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Container(
            margin: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Uncontrollable Content 1',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Uncontrollable Content 2',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: ListView(
                  children: [





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

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}