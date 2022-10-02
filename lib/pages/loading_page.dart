import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:finsor/pages/root_app.dart';
import 'package:finsor/theme/colors.dart';

class LocationSplashPage extends StatefulWidget {
  const LocationSplashPage({Key? key}) : super(key: key);

  @override
  State<LocationSplashPage> createState() => _LocationSplashPageState();
}

class _LocationSplashPageState extends State<LocationSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          animation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.fastLinearToSlowEaseIn);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return RootApp();
                        }));
              },
              child: Lottie.asset('assets/animations/loading.json',
                  height: height / 5, width: width - 10),
            ),
            Text(
              "Looking for the best stock for you :)",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
