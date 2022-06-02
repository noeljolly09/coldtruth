import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../screens/alerts_screens/alerts_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/devices/devices_screen.dart';
import '../screens/incidents/incidents_screen.dart';
import '../utility/app_info.dart';
import 'drawer/drawer.dart';

class CustomNavigationBar extends StatefulWidget {
  final int pageIndex;
  const CustomNavigationBar({Key? key, required this.pageIndex})
      : super(key: key);

  @override
  State<CustomNavigationBar> createState() =>
      _CustomNavigationBarState(pageIndex);
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  _CustomNavigationBarState(this.selectedIndex);

  int selectedIndex = 0;

  String currentDate = DateFormat.MMMMd().format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());

  static const timestyle = TextStyle(fontSize: 10);

  final appbartitle = ["Home", "Notifications", "Incidents", "Devices"];

  final screens = [
    const DashboardPage(),
    const AlertsPage(),
    const IncidentsPage(),
    const DevicesPage(),
  ];

  void onTapBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAppName(),
        builder: (context, snapshot) {
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: AppBar(
              backgroundColor: AppConstants.primaryColor,
              title: Center(child: Text(appbartitle[selectedIndex])),
              actions: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        const Text(
                          "Updated on: ",
                          style: timestyle,
                        ),
                        Text(
                          currentDate,
                          style: timestyle,
                        ),
                        const Text(
                          ',',
                          style: timestyle,
                        ),
                        Text(
                          currentTime,
                          style: timestyle,
                        ),
                      ],
                    ))
              ],
            ),
            body: screens[selectedIndex],
            bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                gap: 2,
                iconSize: 24,
                activeColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: AppConstants.primaryColor,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: "Notifications",
                  ),
                  GButton(
                    icon: Icons.warning,
                    text: "Incidents",
                  ),
                  GButton(
                    icon: Icons.devices,
                    text: "Devices",
                  ),
                ],
                onTabChange: onTapBar,
              ),
            ),
          );
        });
  }
}
