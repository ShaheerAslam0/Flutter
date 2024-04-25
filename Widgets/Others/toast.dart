import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
