import 'package:finsor/components/postCard.dart';
import 'package:finsor/components/titleWithCustomUnderline.dart';
import 'package:finsor/pages/headline_analysis.dart';
import 'package:finsor/pages/lstm.dart';
import 'package:finsor/pages/rsi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finsor/data/post_json.dart';
import 'package:finsor/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompanyPage extends StatefulWidget {
  int cardIndex = 0;
  bool shareExperiencePage = true;

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GOOGL",
                style: TextStyle(fontSize: 45),
              ),
              individualCard(
                  context: context, onPressed: () {}, child: lineChart()),
              TitleWithCustomUnderline(text: "Previous 7 Days"),
              SizedBox(
                height: 10,
              ),
              individualCard(
                  context: context,
                  onPressed: () async {
                    final response =
                        await http.get(Uri.parse("http://127.0.0.1:5000/"));
                    print(response.body);
                    final decoded = jsonDecode(response.body);
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/original.png',
                        fit: BoxFit.fill,
                      ))),
              TitleWithCustomUnderline(text: "Top 100 Headlines Analysis"),
              individualCard(
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HeadlineAnalysis();
                      }),
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/original.png',
                        fit: BoxFit.fill,
                      ))),
              TitleWithCustomUnderline(text: "RSI Analysis"),
              individualCard(
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RSIPage();
                      }),
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/original.png',
                        fit: BoxFit.fill,
                      ))),
              TitleWithCustomUnderline(text: "AI powered price prediction"),
              individualCard(
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LSTMPage();
                      }),
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/original.png',
                        fit: BoxFit.fill,
                      )))
            ],
          ),
        ));
  }
}

class individualCard extends StatelessWidget {
  Widget? child;
  individualCard(
      {required this.context, required this.child, required this.onPressed});

  final BuildContext context;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height / 2.75,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(20)),
          child: Card(color: backgroundColor, elevation: 10, child: child)),
    );
  }
}
