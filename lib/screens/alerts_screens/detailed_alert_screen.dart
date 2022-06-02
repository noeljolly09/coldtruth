import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../custom_widgets/drawer/drawer.dart';
import '../../utility/app_info.dart';

class DetailedAlertScreen extends StatefulWidget {
  const DetailedAlertScreen({Key? key}) : super(key: key);

  @override
  State<DetailedAlertScreen> createState() => _DetailedAlertScreenState();
}

class _DetailedAlertScreenState extends State<DetailedAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAppName(),
        builder: (context, snapshot) {
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: AppBar(
              backgroundColor: AppConstants.primaryColor,
              title: Text("${snapshot.data}"),
            ),
            body: const Center(
              child: Text("Detailed Ticket"),
            ),
          );
        });
  }
}
