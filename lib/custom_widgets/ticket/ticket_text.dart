// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TicketText extends StatelessWidget {
  final String label;
  final bool islabelrequired;
  final String value;
  const TicketText({
    Key? key,
    required this.label,
    required this.islabelrequired,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          islabelrequired == true
              ? Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      ":",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 2),
                  ],
                )
              : const Text(""),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
