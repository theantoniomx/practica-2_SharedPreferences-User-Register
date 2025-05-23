import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color grey2 = Color(0xFFFDFDFD);
const Color grey3 = Color(0xFFF6F6F6);
const Color grey4 = Color(0xFF787676);
const Color grey5 = Color(0xFFDFDEDE);
const Color grey6 = Color(0xFFCAC9C9);
const Color grey9 = Color(0xFF171516);
const Color grey10 = Color(0xFF121111);
const Color grey11 = Color(0xFF433F40);
const Color grey13 = Color(0xFF292526);

const Color white1 = Color(0xffffffff);
const Color blue1 = Color(0xFF347EFB);
const Color yellow1 = Color(0xffffd33c);

const double borderRadius = 12.0;

const double paddingHorizontal = 24.0;

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: const BorderSide(
    color: grey3,
  ),
);

final encodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700,
);

final encodeSansSemibold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w600,
);

final encodeSansMedium = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w500,
);

final encodeSansRegular = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w400,
);
