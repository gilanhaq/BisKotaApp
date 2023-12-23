import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 17.0;

Color primary = const Color(0xff5C40CC);
Color dark = const Color.fromARGB(255, 5, 1, 43);
Color grey = const Color(0xff9698A9);
Color success = const Color(0xff0EC3AE);
Color error = const Color(0xffEB70A5);
Color backgroud = const Color(0xffFAFAFA);
Color lightGrey = const Color(0xffEBECF1);
Color transparent = Colors.transparent;

TextStyle blackText = GoogleFonts.poppins(
  color: dark,
);
TextStyle whiteText = GoogleFonts.poppins(
  color: Colors.white,
);
TextStyle greyText = GoogleFonts.poppins(
  color: grey,
);
TextStyle primaryText = GoogleFonts.poppins(
  color: primary,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
