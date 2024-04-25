import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;

  const CustomPasswordField({super.key, required this.hintText});

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  bool _isObscured = true;  // State to track whether password is visible

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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          cursorColor: const Color(0xff0062DC),
          focusNode: _focusNode,
          obscureText: _isObscured,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Inter-VariableFont_slnt_wght',
              fontSize: 15,
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
            suffixIcon: IconButton(
              icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility, size: 20),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
          ),
          style: const TextStyle(
            fontSize: 18.0,
            fontFamily: 'Inter-VariableFont_slnt_wght',
            color: Colors.black,
          ),
        ),

      ],
    );
  }


}


void showToast(BuildContext context, String message) {
  showToastWidget(
    GestureDetector(
      onTap: () {
        ToastManager().dismissAll(showAnim: true);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(

          width: MediaQuery.of(context).size.width,

          decoration: const BoxDecoration(
            color: Color(0xff0062DC),
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Icon(
                  FontAwesomeIcons.solidCircleXmark,
                  color: Colors.white,
                ),


                const SizedBox(width: 10,),



                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    message,

                    style: const TextStyle(
                      fontFamily: 'Inter-VariableFont_slnt_wght',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    ),
    context: context,
    animation: StyledToastAnimation.slideFromTop,
    reverseAnimation: StyledToastAnimation.slideToTop,
    position: StyledToastPosition.top,
    animDuration: const Duration(milliseconds: 300),
    duration: const Duration(seconds: 3),
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );
}
