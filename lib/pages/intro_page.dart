import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:finsor/theme/colors.dart';

class IntroPage extends StatelessWidget {
  String title;
  String subtitle;
  String assetPath;
  IntroPage(
      {required this.title, required this.subtitle, required this.assetPath});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.subtitle,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Lottie.asset(this.assetPath,
                height: height / 2.5, width: width - 10),
          ],
        ),
      ),
    );
  }
}
