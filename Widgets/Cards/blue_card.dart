import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff007bff).withOpacity(0.9),
            const Color(0xff0062DC),
            const Color(0xff004aad).withOpacity(0.9),
          ],
          stops: const [0.1, 0.5, 0.9],
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Loan Received',
            style: TextStyle(
             fontFamily: 'PlusJakartaSans-VariableFont_wght',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),


          SizedBox(height: 10,),


          Text(
            'Rs. 20000',
            style: TextStyle(
              fontFamily: 'BebasNeue-Regular',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),


          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Icon(
                FontAwesomeIcons.arrowRight,
                color: Colors.white,
                size: 18,
              ),

            ],
          ),

        ],
      ),
    );
  }
}




class MainCard2 extends StatelessWidget {
  const MainCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Colors.yellow.shade700
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            FontAwesomeIcons.arrowDown,
            color: Colors.white,
            size: 18,
          ),

          Spacer(),

          Text(
            'Outstanding Loan',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans-VariableFont_wght',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 10,),

          Text(
            'Rs. 20000',
            style: TextStyle(
              fontFamily: 'BebasNeue-Regular',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),

        ],
      ),
    );
  }
}


class MainCard3 extends StatelessWidget {
  const MainCard3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow.shade700
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Loan Terms and Conditions',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans-VariableFont_wght',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),


        ],
      ),
    );
  }
}

