import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/controller/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle:  GoogleFonts.signika(fontSize: 24, color: Colors.black)
        )
      

      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle:   GoogleFonts.signika(fontSize: 24, color: Colors.white)
        )
      )
      ,
      home: Home(),
    );
  }
}
