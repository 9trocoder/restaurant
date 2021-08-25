import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/screens/home/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
          padding: EdgeInsets.all(defaultPadding * 0.75),
          shape: StadiumBorder(),
          backgroundColor: primaryColor,
        )),
      ),
      home: HomeScreen(),
    );
  }
}
