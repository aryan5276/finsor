import 'dart:math';
import 'package:flutter/material.dart';
import 'package:finsor/components/postCard.dart';
import 'package:finsor/components/questionCard.dart';
import 'package:finsor/data/post_json.dart';
import 'package:finsor/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "finsor",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Feather.code,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    List<Color> randColorList = [];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Feed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Column(children: [
              PostCard(colorList: postColorList, index: "GOOGL"),
              PostCard(colorList: postColorList, index: "AAPL"),
              PostCard(colorList: postColorList, index: "TSLA"),
              PostCard(colorList: postColorList, index: "JPM"),
            ])
          ],
        ),
      ),
    );
  }
}
