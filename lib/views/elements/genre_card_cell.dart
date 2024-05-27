import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/Enum/genre.dart';

class GenreCardCell extends StatelessWidget{

final Genre genre;

const GenreCardCell({required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,

        child: Card(
          color: Color.fromRGBO(0, Random().nextInt(30), Random().nextInt(186), 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Center(child: Text(genre.name, style: GoogleFonts.signika(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white) ,)),
        ),
      ),
    );
  }

  



}