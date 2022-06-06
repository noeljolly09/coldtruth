import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

Widget drawerItem(
    {required String svg,
    required String text,
    required bool isGreyedOut,
    void Function()? onTap}) {
  return ListTile(
    hoverColor: Colors.transparent,
    tileColor: isGreyedOut == true ? Colors.grey.shade200 : null,
    title: Row(
      children: <Widget>[
        SvgPicture.asset(
          svg,
          height: 30,
          color: AppConstants.customblack,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppConstants.modaltextsize),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
