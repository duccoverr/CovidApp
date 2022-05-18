import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/global_summary.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;

  const GlobalStatistics({Key? key, required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buidCard('Số Ca Xác Nhận', summary.totalConfirmed, summary.newConfirmed,
        kConfirmedColor),
        buidCard('Số Ca Tích Cực', summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
            summary.newConfirmed - summary.newRecovered - summary.newDeaths,
            kActiveColor),
        buidCard('Số Ca Phục Hồi', summary.totalRecovered, summary.newRecovered,
            kRecoveredColor),
        buidCard('Số Ca Tử Vong', summary.totalDeaths, summary.newDeaths,
            kDeathColor),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10,),
    child: Text(
    ' Static Updated ' + timeago.format(summary.date),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    )),
      ],
    );
  }

  Widget buidCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
        height: 75,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tổng Cộng',
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hôm Nay',
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Text(
                      todayCount.toString(),
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
