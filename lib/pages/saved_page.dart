import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:finsor/components/questionCard.dart';
import 'package:finsor/pages/search_results_page.dart';
import 'package:finsor/theme/colors.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      body: SingleChildScrollView(child: getBody()),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: Offset(0, 1))
                  ]),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Feather.search,
                      color: black,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      onSubmitted: (text) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultsPage()));
                      },
                      cursorColor: black,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "History",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionCard(
                    showPostDetails: true,
                    index: index,
                    colorful: true,
                  );
                },
              ),
            ),
            // Wrap(
            //     spacing: 20,
            //     runSpacing: 20,
            //     children: List.generate(6, (index) {
            //       return Container(
            //         width: (size.width / 2) - 40,
            //         height: (size.width / 2) - 40,
            //         decoration: BoxDecoration(
            //           boxShadow: [
            //             BoxShadow(
            //                 color: grey.withOpacity(0.4),
            //                 spreadRadius: 2,
            //                 blurRadius: 15,
            //                 offset: Offset(0, 1))
            //           ],
            //           borderRadius: BorderRadius.circular(20),
            //           color:
            //               Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            //                   .withOpacity(1.0),

            //           // image: DecorationImage(
            //           //     image: NetworkImage(postsList[index]["postImg"]),
            //           //     fit: BoxFit.cover)
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Text(
            //                 "Finally defeating cancer after 10 whole years...",
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Text(
            //                 "In 2011, I started having acid reflux...",
            //                 style: TextStyle(
            //                   color: Colors.white.withOpacity(0.5),
            //                   fontSize: 12,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Text(
            //                 "View Discussion >",
            //                 style: TextStyle(
            //                     color: Colors.white.withOpacity(0.8),
            //                     fontSize: 14),
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     }))
          ],
        ),
      ),
    );
  }
}
