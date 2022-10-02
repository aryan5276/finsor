import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:finsor/data/post_json.dart';
import 'package:finsor/theme/colors.dart';

class QuestionCard extends StatelessWidget {
  final int index;
  bool showPostDetails = true;
  bool colorful = true;
  QuestionCard(
      {required this.showPostDetails,
      required this.index,
      required this.colorful});
  final random = new Random();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: showPostDetails ? 130 : 90,
        decoration: BoxDecoration(
          color: colorful
              ? savedColorList[random.nextInt(savedColorList.length)]
              : Colors.white,
          // color: colorful
          //     ? Colors
          //         .primaries[Random().nextInt(Colors.primaries.length)].shade400
          //     : Colors.white,
// Good Colors - Colors.primaries[Random().nextInt(Colors.primaries.length)].shade400
          //color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox()
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       children: [
        //         CircleAvatar(
        //           radius: showPostDetails ? 20 : 12,
        //           backgroundImage: NetworkImage(postsList[index]['img']),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text(
        //           postsList[index]['name'],
        //           // "${newsDescriptionLength >= 200 ? (newsDescriptionLength / 200).floor() : (newsDescriptionLength / 200 * 60).floor()} ${newsDescriptionLength >= 200 ? "mins" : "secs"} read",
        //           style: TextStyle(
        //               fontSize: showPostDetails ? 13 : 11,
        //               fontWeight: FontWeight.bold,
        //               color: colorful ? Colors.grey[200] : Colors.grey[600]),
        //         ),
        //         Spacer(),
        //         Icon(
        //           Icons.arrow_forward_ios_rounded,
        //           size: 21,
        //         ),
        //         SizedBox(
        //           width: showPostDetails ? 20 : 10,
        //         )
        //       ],
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //       child: Text(
        //         "I am diagnosed with dengue. My mom says no for Pizza. Can I eat pizza once a week?",
        //         style: TextStyle(
        //             fontSize: 14,
        //             color: colorful ? Colors.white : Colors.black,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Spacer(),
        //     showPostDetails
        //         ? Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               SizedBox(
        //                 width: 30,
        //               ),
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(
        //                     MaterialCommunityIcons.heart,
        //                     color: Colors.redAccent,
        //                     size: 22,
        //                   ),
        //                   SizedBox(width: 4),
        //                   Text(
        //                     "1.2K",
        //                     style:
        //                         TextStyle(color: Colors.grey[50], fontSize: 15),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 width: 50,
        //               ),
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(
        //                     Icons.chat_bubble_outline_rounded,
        //                     color: Colors.grey[300],
        //                     size: 22,
        //                   ),
        //                   SizedBox(width: 4),
        //                   Text(
        //                     "232",
        //                     style:
        //                         TextStyle(color: Colors.grey[50], fontSize: 15),
        //                   ),
        //                 ],
        //               )
        //             ],
        //           )
        //         : SizedBox(
        //             height: 0,
        //           )
        //   ],
        // ),
        );
  }
}
