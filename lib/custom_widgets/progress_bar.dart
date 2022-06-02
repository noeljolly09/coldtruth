// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double? height;
  final double? width;
  final int percent;
  final String qualityText;
  final int total;
  final Color color;

  const CustomProgressIndicator({
    Key? key,
    this.height,
    this.width,
    required this.percent,
    required this.qualityText,
    required this.total,
    required this.color,
  }) : super(key: key);

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(10),
      child: LiquidLinearProgressIndicator(
        value: widget.percent / widget.total,
        valueColor: AlwaysStoppedAnimation(widget.color),
        backgroundColor: Colors.white,
        borderColor: widget.color,
        borderWidth: 2.0,
        borderRadius: 10.0,
        direction: Axis.horizontal,
        center: Text(
          widget.qualityText + " " + widget.percent.toString(),
          style: const TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
