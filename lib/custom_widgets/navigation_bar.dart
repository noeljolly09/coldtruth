import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../screens/events_screens/events_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/dashboard/notifier/dashboard_notifier.dart';
import '../screens/devices/devices_screen.dart';
import '../utility/app_info.dart';
import 'drawer/drawer.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  int selectedIndex = 0;

  String currentDate = DateFormat.MMMMd().format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());

  static const timestyle = TextStyle(fontSize: 10);

  final appbartitle = ["Home", "Events", "Settings"];

  final screens = [
    const DashboardPage(),
    const AlertsPage(),
    const DevicesPage(),
  ];

  void onTapBar(int index) {
    ref.read(navigationbarNotifier).updatedNavigtionIndex(value: index);
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationbarNotifier).selectionIndex;
    return FutureBuilder(
        future: getAppName(),
        builder: (context, snapshot) {
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: AppBar(
              backgroundColor: AppConstants.primaryColor,
              title: Center(child: Text(appbartitle[selectedIndex])),
              // leading: SvgPicture.asset('assets/svg/logo.svg'),
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
                    text: "Events",
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: "Settings",
                  ),
                ],
                onTabChange: onTapBar,
              ),
            ),
          );
        });
  }
}
