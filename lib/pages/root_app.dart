import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:finsor/pages/home_page.dart';
import 'package:finsor/pages/profile_page.dart';
import 'package:finsor/pages/saved_page.dart';

import 'package:finsor/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [HomePage(), SavedPage(), ProfilePage()],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: grey.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, 1)),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
              child: Icon(
                Feather.home,
                size: 25,
                color: activeTab == 0 ? primary : black,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: Icon(
                Feather.search,
                size: 25,
                color: activeTab == 1 ? primary : black,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 2;
                });
              },
              child: Icon(
                MaterialIcons.account_circle,
                size: 28,
                color: activeTab == 2 ? primary : black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
