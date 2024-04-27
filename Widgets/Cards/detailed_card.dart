// import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:brand/Models/payout_campaign_data.dart';
import 'package:brand/Models/driver_payout.dart';
import 'package:brand/Models/escrow_data.dart';

class PayoutOverviewCardDetailedDriver extends StatelessWidget {
  final PayoutPayment payoutPayment;
  final PayoutCampaignData payoutCampaignData;

  const PayoutOverviewCardDetailedDriver({
    super.key,
    required this.payoutPayment,
    required this.payoutCampaignData,
  });

  @override
  Widget build(BuildContext context) {
    final PayoutSummary payoutSummary = payoutPayment.payoutSummary!;
    late final DriverPayout driverPayout;

    if (payoutSummary is DriverPayoutSummary) {
      driverPayout = payoutSummary.driverPayout;
    }

    final double driverSum = (driverPayout.netMileage +
        driverPayout.netHotspotMileage +
        driverPayout.netParkTime +
        driverPayout.netParkHotspotTime +
        driverPayout.crowdPayout);

    final double total = driverSum;

    int startToCurrentDifference =
        DateTime.now().difference(payoutCampaignData.startDate).inDays;
    int startToEndDifference = payoutCampaignData.endDate
        .difference(payoutCampaignData.startDate)
        .inDays;

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
              'Total Payout',
              style: TextStyle(
                fontFamily: 'Inter-VariableFont_slntwght',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                  .format(total),
              style: const TextStyle(
                fontFamily: 'BebasNeue-Regular',
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 2),
            // Row(
            //   children: [
            //     Text(
            //       '${payoutSummary.changePercentage}%',
            //       style: const TextStyle(
            //         fontFamily: 'Inter-VariableFont_slntwght',
            //         fontSize: 10,
            //         color: Colors.black,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Icon(
            //       payoutSummary.changePercentage > 0
            //           ? FontAwesomeIcons.arrowTrendUp
            //           : FontAwesomeIcons.arrowTrendDown,
            //       color: Colors.black,
            //       size: 15,
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Stats',
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
                  'Number of Drivers',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  '${payoutSummary.driversEnrolled}',
                  style: const TextStyle(
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
                  'Campaign Duration',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  '$startToCurrentDifference/$startToEndDifference days',
                  style: const TextStyle(
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
              'Payouts',
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
                  'Net Mileage',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                      .format(driverPayout.netMileage),
                  style: const TextStyle(
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
                  'Net Hotspot Mileage',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                      .format(driverPayout.netHotspotMileage),
                  style: const TextStyle(
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
                  'Net Park Time',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                      .format(driverPayout.netParkTime),
                  style: const TextStyle(
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
                  'Net Hotspot Park Time',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                      .format(driverPayout.netParkHotspotTime),
                  style: const TextStyle(
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
              'Bonus',
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
                  'Crowds',
                  style: TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                      .format(driverPayout.crowdPayout),
                  style: const TextStyle(
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
