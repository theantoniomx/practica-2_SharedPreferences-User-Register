import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color grey2 = Color(0xFFFDFDFD);
const Color grey4 = Color(0xFF787676);
const Color grey5 = Color(0xFFDFDEDE);
const Color grey6 = Color(0xFFCAC9C9);
const Color grey10 = Color(0xFF121111);
const Color grey13 = Color(0xFF292526);

const Color kGrey = Color(0xffa4aaad);
const Color kDarkGrey = Color(0xff878787);
const Color kLightGrey = Color(0xffededed);

const Color white1 = Color(0xffffffff);

const Color kYellow = Color(0xffffd33c);

const double kBorderRadius = 12.0;

const double kPaddingHorizontal = 24.0;

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: const BorderSide(
    color: kLightGrey,
  ),
);

final kEncodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700,
);

final kEncodeSansSemibold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w600,
);

final kEncodeSansMedium = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w500,
);

final kEncodeSansRegular = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w400,
);
