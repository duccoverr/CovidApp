import 'package:flutter/material.dart';
import '../models/country_summary.dart';
import '../utils/constants.dart';


class CountryStatictis extends StatelessWidget {
  final List<CountrySummaryModel> summaryList;

  const CountryStatictis({Key? key, required this.summaryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

Widget buildCard(String leftTitle, int leftValue, Color leftColor,
    String rightTitle, int rightValue, Color rightColor) {

  return Card(
    elevation: 1,
    child: Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            leftTitle,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          Expanded(
            child: Container(),
          ),
          Text('Total',style: TextStyle(color: leftColor,fontWeight: FontWeight.bold,fontSize: 15),),


        ],
      ),

    ]),
  ));
}