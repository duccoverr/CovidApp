import 'package:flutter/material.dart';
import 'package:appcuoikhoa/utils/constants.dart';
import '../screen/navigation.dart';
import '../screen/global.dart';
import '../screen/country.dart';

enum Navigationstatus { GLOBAL, COUNTRY }

class tracker extends StatefulWidget {
  const tracker({Key? key}) : super(key: key);

  @override
  State<tracker> createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  Navigationstatus navigationstatus = Navigationstatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
       elevation: 0,
        title: Text(
          'Covid Hôm Nay',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(23),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: AnimatedSwitcher(
              duration: Duration(microseconds: 230),
              child: navigationstatus == Navigationstatus.GLOBAL
                  ? Global()
                  : Country(),
            ),
          )),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navigation(
                    title: "Thế Giới",
                    selected: navigationstatus == Navigationstatus.GLOBAL,
                    onselected: () {
                      setState(() {
                        navigationstatus = Navigationstatus.GLOBAL;
                      });
                    }),
                navigation(
                    title: "Trong Nước",
                    selected: navigationstatus == Navigationstatus.COUNTRY,
                    onselected: () {
                      setState(() {
                        navigationstatus = Navigationstatus.COUNTRY;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
