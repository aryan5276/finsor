//import 'package:firebase_core/firebase_core.dart';r
import 'package:finsor/pages/headline_analysis.dart';
import 'package:finsor/pages/home_page.dart';
import 'package:finsor/pages/lstm.dart';
import 'package:finsor/pages/post_page.dart';
import 'package:finsor/pages/rsi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finsor/pages/loading_page.dart';
import 'package:finsor/pages/phone_number_page.dart';
import 'package:finsor/pages/register_page.dart';
import 'package:finsor/pages/root_app.dart';
import 'package:finsor/pages/welcome_page.dart';
import 'package:finsor/theme/colors.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const MyApp());
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            //scaffoldBackgroundColor: Colors.grey[50],

            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
                bodyText2: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white)))),
        debugShowCheckedModeBanner: false,
        home: WelcomePage());
  }
}
