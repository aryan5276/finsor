import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:finsor/data/post_json.dart';
import 'package:finsor/pages/post_page.dart';
import 'package:finsor/theme/colors.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class PostCard extends StatelessWidget {
  final List<Color> colorList;
  final String index;
  final random = new Random();
  bool useProxy = false;
  DateTime? date;
  PostCard({Key? key, required this.colorList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> data = [
      98.80999755859375,
      98.08999633789062,
      96.1500015258789,
      98.08999633789062,
      99.16999816894531,
      100.73999786376953
    ];
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    // String ticker = 'GOOG';
    // YahooFinanceDailyReader yahooFinanceDataReader = YahooFinanceDailyReader(
    //     prefix: useProxy
    //         ? 'https://thingproxy.freeboard.io/fetch/https://'
    //         : 'https://');

    // Future<List> future;
    // if (date == null) {
    //   future = yahooFinanceDataReader.getDaily(ticker);
    // } else {
    //   future = yahooFinanceDataReader.getDaily(ticker,
    //       startDate: DateTime.now().subtract(Duration(days: 7)));
    // }
    Color color = colorList[random.nextInt(colorList.length)];
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height / 2.75,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 1))
            ], borderRadius: BorderRadius.circular(20)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CompanyPage()));
            },
            child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height / 2.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: colorList[1 + Random().nextInt(colorList.length - 1)]
                    color: color),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, left: 15, right: 8, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            index,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 28),
                          ),
                          Icon(
                            Entypo.thumbs_up,
                            color: Colors.greenAccent,
                            size: 32,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: lineChart(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   height: 60,
                      //   width: 60,
                      //   child: FutureBuilder(
                      //     future: const YahooFinanceDailyReader()
                      //         .getDailyData('GOOG'),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<List<dynamic>> snapshot) {
                      //       if (snapshot.connectionState ==
                      //           ConnectionState.done) {
                      //         List<dynamic> historicalData = snapshot.data!;
                      //         data.add(historicalData[index]['close']);
                      //         print(data);
                      //         return SizedBox();
                      //       } else if (snapshot.hasError) {
                      //         return Text('Error ${snapshot.error}');
                      //       }

                      //       return const Center(
                      //         child: SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: CircularProgressIndicator(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          smallCard(
                            title: "RSI: ",
                            value: "0.5",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          smallCard(
                            title: "FPP: ",
                            value: "98",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          smallCard(
                            title: "SA: ",
                            value: "0.6",
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class lineChart extends StatelessWidget {
  const lineChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      titlesData: FlTitlesData(
        show: false,
        // bottomTitles: AxisTitles(sideTitles:
        //     SideTitles(getTitlesWidget: (value, x) {
        //   return Text(value.toString());
        // }))
      ),
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        drawVerticalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d).withOpacity(0.3),
            strokeWidth: 1,
          );
        },
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 2.5),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.greenAccent,
          barWidth: 5,
          // dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ],
    ));
  }
}

class smallCard extends StatelessWidget {
  String? title;
  String? value;
  smallCard({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 100,
          child: Card(
            color: Colors.grey.withOpacity(0.6),
            elevation: 10,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 10,
                  color: Color(0xff72FFFF),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                Text(
                  value!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        )
      ],
    );
  }
}
