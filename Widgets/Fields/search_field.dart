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
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  double _targetWidth = 58.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _iconFadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _iconFadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    _targetWidth = screenWidth * 0.7;
    _widthAnimation = Tween<double>(begin: 58.0, end: _targetWidth).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _folded = !_folded;
      if (_folded) {
        _focusNode.unfocus();
        _controller.reverse();
      } else {
        _controller.forward();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusNode.requestFocus();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              color: _folded ? Colors.white : Colors.black,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextField(
                  textCapitalization: TextCapitalization.sentences,
                    focusNode: _focusNode,
                    controller: _textEditingController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none
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
                        child: const Icon(Icons.search, color: Colors.black),
                      ),
                      FadeTransition(
                        opacity: _iconFadeInAnimation,
                        child: const Icon(Icons.close, color: Colors.black),
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
