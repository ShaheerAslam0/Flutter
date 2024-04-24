import 'package:flutter/material.dart';

class LoanInfoCard1 extends StatelessWidget {

  const LoanInfoCard1({
    super.key,

  });

  @override
  Widget build(BuildContext context) {




    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '742897384',
              style: TextStyle(
                fontFamily: 'Inter-VariableFont_slntwght',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
                  '20000',
              style: TextStyle(
                fontFamily: 'BebasNeue-Regular',
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 2),
            const Row(
              children: [
                Text(
                  'Total Loan',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                // Icon(
                //   payoutWeekData.changePercentage > 0
                //       ? FontAwesomeIcons.arrowTrendUp
                //       : FontAwesomeIcons.arrowTrendDown,
                //   color: Colors.black,
                //   size: 15,
                // ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Loan',
              style: TextStyle(
                fontFamily: 'Inter-VariableFont_slntwght',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '22/04/2024',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Loan Type',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  'Personal',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            Divider(
              color: Colors.grey.shade600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  'Approved',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),


            const SizedBox(
              height: 30,
            ),
            const Text(
              'Repayment',
              style: TextStyle(
                fontFamily: 'Inter-VariableFont_slntwght',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '23000',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            Divider(
              color: Colors.grey.shade600,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Period (Months)',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '10',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due Date',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '23/04/2024',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Next Due Date',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '24/04/2024',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),




            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Late Fees',
            //       style: TextStyle(
            //         fontFamily: 'Inter-VariableFont_slntwght',
            //         fontSize: 13,
            //         color: Colors.grey.shade600,
            //       ),
            //     ),
            //     const Text(
            //       '25000',
            //       style: TextStyle(
            //         fontFamily: 'Inter-VariableFont_slntwght',
            //         fontSize: 13,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            // Divider(
            //   color: Colors.grey.shade600,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Net Hotspot Park Time',
            //       style: TextStyle(
            //         fontFamily: 'Inter-VariableFont_slntwght',
            //         fontSize: 13,
            //         color: Colors.grey.shade600,
            //       ),
            //     ),
            //     const Text(
            //       '',
            //       style: TextStyle(
            //         fontFamily: 'Inter-VariableFont_slntwght',
            //         fontSize: 13,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(
              height: 30,
            ),



            const Text(
              'Fees',
              style: TextStyle(
                fontFamily: 'Inter-VariableFont_slntwght',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Processing',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '00',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Interest',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '00',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Insurance',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Text(
                  '00',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}




Widget Fees(
    BuildContext context, {
      required String text1,
      required String text2,
      required String text3,
    }) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.all(5),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontFamily: 'BebasNeue-Regular',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  text3,
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
