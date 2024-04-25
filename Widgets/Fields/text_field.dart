import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;

  const CustomTextField({super.key, required this.hintText});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff0062DC),
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Inter-VariableFont_slnt_wght',
          fontSize: 15,
          decoration: TextDecoration.none,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.5),
          borderSide: BorderSide(
            color: _isFocused ? const Color(0xff0062DC) : Colors.white,
            width: 2.0,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.5),
          borderSide: const BorderSide(color: Color(0xff0062DC), width: 2.0),
        ),
      ),
      style: const TextStyle(
        fontSize: 18.0,
        fontFamily: 'Inter-VariableFont_slnt_wght',
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
    );
  }
}
