import 'package:finsor/theme/colors.dart';
import 'package:flutter/material.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  String text;

  TitleWithCustomUnderline({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              height: 7,
              color: Color(0xffDFF6FF).withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}
