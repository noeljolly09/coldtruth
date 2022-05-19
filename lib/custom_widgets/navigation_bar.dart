import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/alerts_screens/alerts_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/devices/devices_screen.dart';
import '../screens/incidents/incidents_screen.dart';
import '../utility/app_info.dart';
import 'drawer/drawer.dart';

class CustomNavigationBar extends StatefulWidget {
  final int pageIndex;
  const CustomNavigationBar({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() =>
      _CustomNavigationBarState(pageIndex);
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  _CustomNavigationBarState(this.selectedIndex);

  int selectedIndex = 0;

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
              title: Text("${snapshot.data}"),
            ),
            body: screens[selectedIndex],
            bottomNavigationBar: SizedBox(
              height: 60,
              child: FancyBottomNavigation(
                tabs: [
                  TabData(iconData: Icons.home, title: ""),
                  TabData(iconData: Icons.notifications_active, title: ""),
                  TabData(iconData: Icons.warning, title: ""),
                  TabData(iconData: Icons.devices, title: ""),
                ],
                onTabChangedListener: onTapBar,
                barBackgroundColor: Colors.white,
                inactiveIconColor: AppConstants.customblack,
                activeIconColor: Colors.white,
                circleColor: AppConstants.primaryColor,
                initialSelection: selectedIndex,
              ),
            ),
          );
        });
  }
}
