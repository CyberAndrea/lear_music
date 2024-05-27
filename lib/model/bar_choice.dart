import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChoice {
  String label;
  IconData icon;
  Widget page;

  Icon get getIcon => Icon(icon);
  BottomNavigationBarItem get getBarItem =>
      BottomNavigationBarItem(icon: getIcon, label: label);
      Text get titleForApp => Text(label, style: GoogleFonts.signika(fontSize: 30),);

  BarChoice({required this.label, required this.icon, required this.page});
}
