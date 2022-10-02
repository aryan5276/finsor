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

class RSIPage extends StatefulWidget {
  int cardIndex = 0;
  bool shareExperiencePage = true;

  @override
  State<RSIPage> createState() => _RSIPageState();
}

class _RSIPageState extends State<RSIPage> {
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
                "RSI for GOOGL",
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
                      left: 40,
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
                "What is RSI? ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "The relative strength index (RSI) is a momentum indicator used in technical analysis. RSI measures the speed and magnitude of a security's recent price changes to evaluate overvalued or undervalued conditions in the price of that security. The RSI is displayed as an oscillator (a line graph) on a scale of zero to 100.  The RSI can do more than point to overbought and oversold securities. It can also signal when to buy and sell. Traditionally, an RSI reading of 70 or above indicates an overbought situation. A reading of 30 or below indicates an oversold condition."),
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
                  "It can also signal when to buy and sell. Traditionally, an RSI reading of 70 or above indicates an overbought situation. A reading of 30 or below indicates an oversold condition.")
            ],
          ),
        ));
  }
}
