import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> with SingleTickerProviderStateMixin {
  bool _folded = true;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _iconFadeInAnimation;
  late Animation<double> _iconFadeOutAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _widthAnimation = Tween<double>(begin: 58.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _iconFadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _iconFadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _folded = !_folded;
      if (_folded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final double targetWidth = screenWidth * 0.7;
    _widthAnimation = Tween<double>(begin: 58.0, end: targetWidth).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    return AnimatedBuilder(
      animation: Listenable.merge([_controller, _widthAnimation]),
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: !_folded
                      ? const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                  )
                      : null,
                ),
              ),
              InkWell(
                onTap: _toggle,
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FadeTransition(
                        opacity: _iconFadeOutAnimation,
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                      FadeTransition(
                        opacity: _iconFadeInAnimation,
                        child: Icon(Icons.close, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
