import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:finsor/pages/phone_number_page.dart';
import 'package:finsor/pages/intro_page.dart';
import 'package:finsor/pages/login_page.dart';
import 'package:finsor/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPages extends StatefulWidget {
  const IntroductionPages({Key? key}) : super(key: key);

  @override
  State<IntroductionPages> createState() => _IntroductionPagesState();
}

class _IntroductionPagesState extends State<IntroductionPages> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            if (index == 0) {
              onFirstPage = true;
            } else {
              onFirstPage = false;
            }
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: [
            IntroPage(
              title: "Frustrated with stocks yet?",
              subtitle: "Don't Worry. We got your back ;)",
              assetPath: 'assets/animations/frustrated.json',
            ),
            IntroPage(
              title: "Sitback and relax.",
              subtitle: "We will do your research for you",
              assetPath: 'assets/animations/research.json',
            ),
            IntroPage(
              title: "Gain accurate insights",
              subtitle: "AI powered in-depth analysis at your fingertips",
              assetPath: 'assets/animations/ai.json',
            ),
            IntroPage(
              title: "Let's dive right in!",
              subtitle:
                  "Experience the only financial advisor you'll ever need",
              assetPath: 'assets/animations/analysis.json',
            ),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              !onFirstPage
                  ? GestureDetector(
                      child: Text("previous"),
                      onTap: () {
                        _controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    )
                  : SizedBox(),
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: ExpandingDotsEffect(dotHeight: 12, dotWidth: 12),
              ),
              onLastPage
                  ? GestureDetector(
                      child: Text("done"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneNumberPage()));
                      },
                    )
                  : GestureDetector(
                      child: Text("next"),
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    ),
            ],
          ),
        )
      ]),
    );
  }
}

// class IntroductionPages extends StatefulWidget {
//   @override
//   _IntroductionPagesState createState() => _IntroductionPagesState();
// }

// class _IntroductionPagesState extends State<IntroductionPages> {
//   final introKey = GlobalKey<IntroductionScreenState>();

//   void _onIntroEnd(context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => LoginPage()),
//     );
//   }

//   Widget _buildFullscreenImage() {
//     return Image.asset(
//       'assets/fullscreen.jpg',
//       fit: BoxFit.cover,
//       height: double.infinity,
//       width: double.infinity,
//       alignment: Alignment.center,
//     );
//   }

//   Widget _buildImage(String assetName, [double width = 200]) {
//     return Image.asset('assets/$assetName', width: width);
//   }

//   @override
//   Widget build(BuildContext context) {
//     const bodyStyle = TextStyle(fontSize: 19.0);

//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//       bodyTextStyle: bodyStyle,
//       bodyPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
//       pageColor: white,
//       imagePadding: EdgeInsets.zero,
//     );

//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: white,
//       // globalHeader: Align(
//       //   alignment: Alignment.topRight,
//       //   child: SafeArea(
//       //     child: Padding(
//       //       padding: const EdgeInsets.only(top: 16, right: 16),
//       //       child: _buildImage('flutter.png', 100),
//       //     ),
//       //   ),
//       // ),
//       globalFooter: Container(
//         width: double.infinity,
//         height: 60,
//         color: white,
//       ),
//       pages: [
//         PageViewModel(
//           title: "Welcome to finsor",
//           body: "The Medical Social Media You Never Had",
//           image: _buildImage('logo.png'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Explore Experiences",
//           body: "Each individual is the main character of their life...",
//           //image: _buildImage('img2.jpg'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Ask Questions",
//           body: "Ask your questions and have the community answer them for you",
//           //image: _buildImage('img3.jpg'),
//           decoration: pageDecoration,
//         ),
//         // PageViewModel(
//         //   title: "Title of last page - reversed",
//         //   bodyWidget: Row(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     children: const [
//         //       Text("Click on ", style: bodyStyle),
//         //       Icon(Icons.edit),
//         //       Text(" to edit a post", style: bodyStyle),
//         //     ],
//         //   ),
//         //   decoration: pageDecoration.copyWith(
//         //     bodyFlex: 2,
//         //     imageFlex: 4,
//         //     bodyAlignment: Alignment.bottomCenter,
//         //     imageAlignment: Alignment.topCenter,
//         //   ),
//         //   image: _buildImage('img1.jpg'),
//         //   reverse: true,
//         // ),
//         PageViewModel(
//           title: "Share your experiences",
//           body: "Enlighten the world with your story...",
//           //image: _buildImage('img2.jpg'),

//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Let's dive right in!",
//           //image: _buildImage('img3.jpg'),
//           decoration: PageDecoration(
//             titleTextStyle:
//                 TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//             titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             bodyTextStyle: bodyStyle,
//             bodyPadding: EdgeInsets.only(top: 100, left: 20, right: 20),
//             pageColor: white,
//             imagePadding: EdgeInsets.zero,
//           ),
//           bodyWidget: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Not a member already?", style: bodyStyle),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 80,
//                 margin: EdgeInsets.symmetric(horizontal: 30),
//                 decoration: BoxDecoration(
//                     color: white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.blue,
//                           spreadRadius: 1,
//                           blurRadius: 6,
//                           offset: Offset(4, 4)),
//                       BoxShadow(
//                           color: Colors.white,
//                           spreadRadius: 1,
//                           blurRadius: 8,
//                           offset: Offset(-4, -4)),
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Sign Up",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios_outlined,
//                       size: 15,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text("Been missing us? ", style: bodyStyle),
//               SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => LoginPage()));
//                 },
//                 child: Container(
//                   height: 80,
//                   margin: EdgeInsets.symmetric(horizontal: 30),
//                   decoration: BoxDecoration(
//                       color: white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.blue,
//                             spreadRadius: 1,
//                             blurRadius: 6,
//                             offset: Offset(4, 4)),
//                         BoxShadow(
//                             color: Colors.white,
//                             spreadRadius: 1,
//                             blurRadius: 8,
//                             offset: Offset(-4, -4)),
//                       ]),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Log in",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Icon(Icons.arrow_forward_ios_outlined),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//       onDone: () => () {},
//       showSkipButton: false,
//       skipOrBackFlex: 0,
//       nextFlex: 0,
//       showBackButton: true,
//       //rtl: true, // Display as right-to-left
//       back: const Icon(Icons.arrow_back_ios_new_rounded),
//       next: const Icon(Icons.arrow_forward_ios_rounded),
//       done: const Text('Done', style: TextStyle(fontSize: 0)),
//       curve: Curves.fastLinearToSlowEaseIn,
//       controlsMargin: const EdgeInsets.only(bottom: 0, left: 20, right: 20),
//       controlsPadding: kIsWeb
//           ? const EdgeInsets.all(12.0)
//           : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
//       dotsDecorator: const DotsDecorator(
//         size: Size(10.0, 10.0),
//         color: Color(0xFFBDBDBD),
//         activeSize: Size(22.0, 10.0),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//       dotsContainerDecorator: const ShapeDecoration(
//         color: white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//       ),
//     );
//   }
// }
