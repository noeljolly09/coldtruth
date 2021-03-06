// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomSelectionBar extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController searchController;
  final String? searchhinttext;
  final String? hinttext;
  final double width;
  final bool isSvg;
  final bool circleSuffixIcon;
  final String svgAsset;
  final String? sheetTitle;
  final String? Function(String?)? validator;
  final List<SelectedListItem> list;

  const CustomSelectionBar({
    Key? key,
    required this.controller,
    required this.searchController,
    this.searchhinttext,
    this.hinttext,
    required this.width,
    required this.isSvg,
    required this.circleSuffixIcon,
    required this.svgAsset,
    this.sheetTitle,
    this.validator,
    required this.list,
  }) : super(key: key);

  @override
  State<CustomSelectionBar> createState() => _CustomSelectionBarState();
}

class _CustomSelectionBarState extends State<CustomSelectionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onTap: () {
          FocusScope.of(context).unfocus();
          onTextFieldTap();
        },
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15, bottom: 10),
          hintText: widget.hinttext,
          hintStyle: TextStyle(
              fontSize: AppConstants.formtextsize, color: Colors.black),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 25, maxWidth: 30),
          prefixIcon: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: widget.isSvg == true
                  ? SvgPicture.asset(
                      widget.svgAsset,
                      color: AppConstants.customblack,
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                    )
                  : null),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 25, maxWidth: 30),
          suffixIcon: widget.circleSuffixIcon == true
              ? const Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  color: AppConstants.primaryColor,
                )
              : const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                  color: AppConstants.customblack,
                ),
          fillColor: Colors.black12,
          border: widget.circleSuffixIcon == true
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  void onTextFieldTap() {
    DropDownState(
      DropDown(
        searchHintText: widget.searchhinttext,
        bottomSheetTitle: widget.sheetTitle,
        searchBackgroundColor: Colors.black12,
        dataList: widget.list,
        enableMultipleSelection: false,
        searchController: widget.searchController,
        selectedItem: (String selected) {
          widget.controller.text = selected;
        },
      ),
    ).showModal(context);
  }
}
