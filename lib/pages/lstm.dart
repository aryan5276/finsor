import 'package:finsor/components/postCard.dart';
import 'package:finsor/components/titleWithCustomUnderline.dart';
import 'package:finsor/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finsor/data/post_json.dart';
import 'package:finsor/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LSTMPage extends StatefulWidget {
  int cardIndex = 0;
  bool shareExperiencePage = true;

  @override
  State<LSTMPage> createState() => _LSTMPageState();
}

class _LSTMPageState extends State<LSTMPage> {
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
                "LSTM for GOOGL",
                style: TextStyle(fontSize: 38),
              ),
              SizedBox(height: 30),
              Stack(
                children: [
                  Container(
                    height: 20,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.green,
                            Colors.red,
                          ],
                        )),
                  ),
                  Positioned(
                      height: 30,
                      left: 10,
                      child: Container(
                        height: 30,
                        width: 12,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "0",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "100",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "What is headline analysis? ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Sentiment Analysis is a method to study emotions portrayed by a sentence. For our application, we have adapted it to study recent headlines related to the company."),
              SizedBox(
                height: 20,
              ),
              Text(
                "What does the value indicate? ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "The Sentiment Analysis score has a range of 0 to 1, where 1 is the highest positive score and 0 and the lowest positive(highest negative) score.")
            ],
          ),
        ));
  }
}
