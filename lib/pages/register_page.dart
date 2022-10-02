import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:finsor/components/textFieldWithOnlyHintText.dart';
import 'package:finsor/pages/loading_page.dart';
import 'package:finsor/pages/root_app.dart';
import 'package:finsor/theme/colors.dart';
import 'package:flutter_tags/flutter_tags.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  PageController _controller = PageController();
  List suggestedTags = [
    Item(title: "AAPL"),
    Item(title: "GOOGL"),
    Item(title: "TSLA"),
    Item(title: "META"),
    Item(title: "TWTR"),
  ];
  List selectedTags = [];
  bool onLastPage = false;
  String name = "";
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
  TextEditingController controller = TextEditingController();
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
      title: Text(
        "Let's get you started!",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget getBody() {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
      child: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 3);
                });
              },
              children: [
                DetailInput(
                  question: "What's your name?",
                  answerWidget: TextFieldWithOnlyHintText(
                    hintText: "name",
                    autofocus: true,
                    hintstyle: TextStyle(fontSize: 20, color: Colors.grey),
                    onSubmitted: (value) {
                      name = value;
                    },
                  ),
                ),
                DetailInput(
                  question: "Choose a username, $name !",
                  answerWidget: TextFieldWithOnlyHintText(
                    hintText: "username",
                    autofocus: true,
                    hintstyle: TextStyle(fontSize: 20, color: Colors.grey),
                    onSubmitted: (value) {},
                  ),
                ),
                DetailInput(
                  question: "What stocks are you primarily interested in? ",
                  answerWidget: Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: 15,
                            bottom: MediaQuery.of(context).size.height * 0.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Tags(
                                itemCount: selectedTags.length,
                                columns: 3,
                                itemBuilder: ((index) {
                                  return ItemTags(
                                    index: index,
                                    title: selectedTags[index].title,
                                    activeColor: Color(0xffDFF6FF),
                                    textActiveColor: Colors.black,
                                    removeButton: ItemTagsRemoveButton(
                                      onRemoved: () {
                                        setState(() {
                                          selectedTags.removeAt(index);
                                        });
                                        return false;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              Divider(
                                thickness: 2.0,
                              ),
                              Spacer(),
                              Tags(
                                itemCount: suggestedTags.length,
                                runAlignment: WrapAlignment.start,
                                columns: 5,
                                itemBuilder: ((index) {
                                  return ItemTags(
                                    index: index,
                                    title: suggestedTags[index].title,
                                    activeColor: Colors.grey[200],
                                    textActiveColor: Colors.black,
                                    onPressed: (value) {
                                      //print(value);
                                      setState(() {
                                        selectedTags.add(value);
                                        suggestedTags.removeAt(value.index);
                                      });
                                    },
                                  );
                                }),
                              ),
                              Spacer(),
                              TextFieldWithOnlyHintText(
                                  hintText: "Add a subject",
                                  autofocus: false,
                                  controller: controller,
                                  onSubmitted: (value) {
                                    setState(() {
                                      selectedTags.add(Item(title: value));
                                    });
                                    controller.clear();
                                  })
                            ],
                          ),
                        )),
                  ),
                ),
                // DetailInput(
                //     question: "Just a few more details",
                //     answerWidget: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         // Container(

                //         //   child: TextFieldWithOnlyHintText(
                //         //       hintText: "School", onSubmitted: (value) {}),
                //         // ),
                //         // TextFieldWithOnlyHintText(
                //         //     hintText: "Degree", onSubmitted: (value) {}),
                //         ContainerWithOnOffSwitch(
                //             label: "Display interested subjects to public? "),
                //         ContainerWithOnOffSwitch(
                //             label: "Display personal information to public? "),
                //       ],
                //     ))
              ]),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // GestureDetector(
                //   child: Text("previous"),
                //   onTap: () {
                //     _controller.previousPage(
                //         duration: Duration(milliseconds: 500),
                //         curve: Curves.easeIn);
                //   },
                // ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: JumpingDotEffect(
                    verticalOffset: 10.0,
                    dotHeight: 10,
                    radius: 0,
                    dotWidth: 5,
                  ),
                ),
                Spacer(),
                onLastPage
                    ? GestureDetector(
                        child: Text("done"),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  transitionsBuilder: (context, animation,
                                      animationTime, child) {
                                    animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.fastLinearToSlowEaseIn);
                                    return ScaleTransition(
                                      alignment: Alignment.center,
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder:
                                      (context, animation, animationTime) {
                                    return LocationSplashPage();
                                  }));

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => LocationSplashPage()));
                        },
                      )
                    : GestureDetector(
                        child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "next",
                              style: TextStyle(color: Colors.white),
                            ))),
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class DetailInput extends StatelessWidget {
  String question;
  Widget answerWidget;
  DetailInput({required this.question, required this.answerWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.question,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 23),
        ),
        answerWidget
      ],
    );
  }
}
