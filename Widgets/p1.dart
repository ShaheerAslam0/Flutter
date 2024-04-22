import 'package:flutter/material.dart';


class InfoContainer1 extends StatelessWidget {

  final String id;
  final String loanAmount;
  final String repaymentAmount;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;


  const InfoContainer1({
    super.key,
    required this.id,
    required this.loanAmount,
    required this.repaymentAmount,
    required this.icon,
    required this.iconColor, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff0062DC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        id, // Use the ID variable
                        style: const TextStyle(
                          fontFamily: 'BebasNeue-Regular',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Loan Amount',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Inter-VariableFont_slnt_wght',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          loanAmount,
                          style: const TextStyle(
                            fontFamily: 'BebasNeue-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Repayment',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Inter-VariableFont_slnt_wght',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          repaymentAmount,
                          style: const TextStyle(
                            fontFamily: 'BebasNeue-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
