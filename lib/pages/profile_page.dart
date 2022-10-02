import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:finsor/data/me_post_json.dart';
import 'package:finsor/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPhoto = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: black)),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Kylie Masata",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
              "@kyliemasa",
              style: TextStyle(fontSize: 15),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: size.height / 3,
              child: ListView(
                children: [
                  profileOption(
                    title: "Profile",
                    onPressed: () {},
                  ),
                  profileOption(
                    title: "Stock Preferences",
                    onPressed: () {},
                  ),
                  profileOption(
                    title: "Log out",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class profileOption extends StatelessWidget {
  String? title;
  VoidCallback? onPressed;
  profileOption({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 20,
        color: Color(0xffDFF6FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          title: Text(
            title!,
            style: TextStyle(color: Colors.black),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
