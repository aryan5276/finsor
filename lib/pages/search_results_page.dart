import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:finsor/components/postCard.dart';
import 'package:finsor/components/questionCard.dart';
import 'package:finsor/data/post_json.dart';
import 'package:finsor/pages/post_page.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [Colors.red, Colors.blue];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TopBar(),
                    WelcomeWidget(),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.25,
                      // width: MediaQuery.of(context).size.width - 40,
                      // height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width - 20,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              child: PostCard(colorList: [
                                Colors.red,
                                Colors.blueGrey,
                                Colors.orange,
                                Colors.pink
                              ], index: "1"),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(5, (index) {
                        return QuestionCard(
                            showPostDetails: false,
                            index: index,
                            colorful: false);
                      }),
                    ),

                    // Container(
                    //   height: 300,
                    //   width: 300,
                    //   padding: EdgeInsets.only(left: 10),
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 6,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return PostCard(colorList: colorList, index: 1);
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchBar()),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.menu,
          size: 30,
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(
          fontSize: 18,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: "Search",
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                    size: 15,
                  )),
              Text("Results",
                  style: TextStyle(
                    fontSize: 23,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Most relevant",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
