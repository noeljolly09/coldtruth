import 'package:flutter/material.dart';
import 'package:idec_face/custom_widgets/chart/line_chart.dart';
import 'package:idec_face/custom_widgets/navigation_bar.dart';

import '../../constants.dart';
import '../../custom_widgets/drawer/drawer.dart';
import '../../custom_widgets/ticket/detail_ticket_text.dart';
import '../../custom_widgets/ticket/ticket_text.dart';
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
            body: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const TicketText(
                          islabelrequired: true,
                          isSameAsLabelStyle: true,
                          label: "Ticket No :",
                          value: "1100224",
                          withlabelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        const TicketText(
                          islabelrequired: false,
                          label: "",
                          value: "10:00, 23March 2022",
                        ),
                        TicketText(
                          islabelrequired: true,
                          isSameAsLabelStyle: false,
                          label: "Active Time:",
                          value: "17 Min",
                          valueStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.greenAccent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              TicketText(
                                islabelrequired: false,
                                label: "",
                                value: "Beverages",
                              ),
                              Text(','),
                              TicketText(
                                islabelrequired: false,
                                label: "",
                                value: "Hudson Square",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const CustomLineChart(),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    DetailedTicketText(
                      color: Colors.grey.shade200,
                      label: "Asset ID:",
                      value: "HF567234",
                    ),
                    const DetailedTicketText(
                      label: "Type:",
                      value: "Horizontal Freezer",
                    ),
                    DetailedTicketText(
                      color: Colors.grey.shade200,
                      label: "Triggered By:",
                      value: "Group G1",
                    ),
                    const DetailedTicketText(
                      label: "Floor Supervisor:",
                      value: "Jeffery",
                    ),
                    DetailedTicketText(
                      color: Colors.grey.shade200,
                      label: "Alert Status:",
                      value: "Active",
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
