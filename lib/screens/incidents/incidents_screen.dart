import 'package:flutter/material.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({Key? key}) : super(key: key);

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(child: Text("Settings Page")),
    );
  }
}
