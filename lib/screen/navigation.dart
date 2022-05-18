import 'package:flutter/material.dart';
import '../utils/constants.dart';

class navigation extends StatelessWidget {

  const navigation({Key? key, required this.title, required this.selected, required this.onselected}) : super(key: key);

  final String title;
  final bool selected;
  final Function() onselected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (

      ){
        onselected();
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected ? kPrimaryColor: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold

            ),
          ),
          selected? Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.rectangle,

                ),
              )
            ],
          ) : Container()
        ],
      ),
    );
  }
}

