import 'package:flutter/material.dart';

// screen height 820.5714285714286
// screen width 411.42857142857144

class AppConstants {
  // strings
  static String appName = "Idec Face";

  //app colors
  static const Color primaryColor = Color(0xFF006e74);

  static const Color secondaryColor = Color(0xFF2A4150);

  static const Color customblack = Color.fromRGBO(28, 36, 44, 1);

  static const Color customgrey = Color(0xfff2f7f8);

  static Color labeltextgrey = Colors.grey[500]!;

  static const Color inColor = Color(0xFFEEEEEE);

  static const Color bgColor = Color(0xFFFBFCF8);

  static const Color borderColor = Color(0xFFFFFFFF);

  static Color get severityCritical => const Color(0xFFFF5E57);

  static Color get severityMajor => const Color(0xFFFFC048);

  static Color get severityMinor => const Color(0xFF56E6C1);


  //sizes

  //height
  static double abovecoldtruthheight = 50;

  static double abovecardheight = 40;

  //width

  //font realted
  static double authtitlesize = 25;

  static double titlefontsize = 20;

  static double bodytextsize = 14;

  static double formbuttonsize = 14;

  static double formbuttontextsize = 19;

  // static double formtextbuttonsize = 14;

  static double formtextsize = 16;

  static double formerrortextize = 12;

  static double modaltextsize = 16;

  static double listitemtextsize = 16;
}

typedef SDMap = Map<String, dynamic>;
