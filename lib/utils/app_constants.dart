import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// styles
final robotoSlab = GoogleFonts.robotoSlab();
final montserrat =
    GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400);
final raleway = GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w500);

/// default textstyle for app texts
final bolo = GoogleFonts.baloo2(fontSize: 15, fontWeight: FontWeight.w400);

///use for titles of tiles(list or grid)
final abeezee = GoogleFonts.aBeeZee(fontSize: 13, fontWeight: FontWeight.w400);

/// use for subtitles of tiles(list or grid)
final poppins = GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400);

/// use for appbar textstyles
final bigBolo = bolo.copyWith(fontSize: 20, fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis);

// button styles
ButtonStyle floatButton = textButtonStyl.copyWith(
  shape: const MaterialStatePropertyAll(CircleBorder()),
);
ButtonStyle textButtonStyl = ButtonStyle(
    // elevation: const MaterialStatePropertyAll(0),
    backgroundColor: MaterialStatePropertyAll(whiteK),
    foregroundColor: MaterialStatePropertyAll(blackK),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    )),
    side: MaterialStatePropertyAll(BorderSide(
      width: 2,
      color: Get.theme.primaryColor,
    )));

// Colors
Color greyblueK = Colors.blueGrey;
Color greyK = Colors.grey.shade500;
Color whiteK = Colors.white;
Color greenK = Colors.white;
Color redK = Colors.white;
Color blackK = Colors.black;
Color creamK = const Color(0xfffdfbee);
Color deepSeaBlueK = const Color(0xff09203F);
Color lightSeaBlueK = const Color(0xff537895);
// Color randomColor = Color(Random().nextInt(0xffffffff));
///
///
///Border Radius constant
BorderRadius curved = BorderRadius.circular(20);
