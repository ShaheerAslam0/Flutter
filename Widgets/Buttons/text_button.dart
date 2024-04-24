import 'package:flutter/material.dart';


Widget textButton1({
  required Function onTap,
  required String text,

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Center(
      child: GestureDetector(
        onTap: onTap(),
        child:Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter-VariableFont_slntwght',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}


