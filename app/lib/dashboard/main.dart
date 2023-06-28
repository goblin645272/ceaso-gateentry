import 'package:app/dashboard/constants.dart';
import 'package:app/dashboard/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppDashboard extends StatelessWidget {
  const MyAppDashboard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          canvasColor: secondaryColor,
        ),
        home: const MainScreen());
  }
}
