import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:idec_face/screens/events_screens/incidents/incidents_screen.dart';

import '../../constants.dart';
import '../../custom_widgets/custom_progress_bar.dart';
import '../../custom_widgets/custom_selection.dart';
import '../../custom_widgets/ticket/ticket_text.dart';
import '../../dialogs/info_dialog/dialog_with_timer.dart';
import 'alerts/detailed_alert_screen.dart';

class AlertsPage extends ConsumerStatefulWidget {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<AlertsPage> {
  final List<SelectedListItem> _listOfStores = [
    SelectedListItem(true, "Abels"),
    SelectedListItem(false, "Ace cafe"),
    SelectedListItem(false, "Baking is fun"),
    SelectedListItem(false, "Big Bun Cafe"),
    SelectedListItem(false, "fort Shire"),
    SelectedListItem(false, "Homers"),
    SelectedListItem(false, "Hudson Square"),
    SelectedListItem(false, "Palm Avenue"),
  ];

  final TextEditingController _storetextController = TextEditingController();

  final TextEditingController _searchController = TextEditingController();

  bool isSwitched = false;

  var textValue = 'Inactive';

  void toggleSwitch(bool? value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = '  Active';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Inactive';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text("Data to be filtered"),
                      ),
                    );
                  });
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            ),
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: AppConstants.primaryColor,
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/alerts.svg',
                              height: 20,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Alerts",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/incident.svg',
                              height: 20,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Incidents",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // first tab bar view widget
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              color: Colors.grey.shade200,
                              child: Column(
                                children: [
                                  const CustomProgressBar(),
                                  const SizedBox(height: 10),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppConstants
                                                          .severityCritical,
                                                    ),
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.0),
                                                    child: Text(
                                                      'Critical',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppConstants
                                                          .severityMajor,
                                                    ),
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.0),
                                                    child: Text(
                                                      'Major',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppConstants
                                                          .severityMinor,
                                                    ),
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.0),
                                                    child: Text(
                                                      'Minor',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          child: FlutterSwitch(
                                              showOnOff: true,
                                              height: 30,
                                              width: 110,
                                              activeText: "Active",
                                              inactiveColor:
                                                  Colors.grey.shade400,
                                              inactiveTextColor: Colors.white,
                                              activeColor:
                                                  AppConstants.primaryColor,
                                              inactiveText: "Inactive",
                                              activeTextColor: Colors.white,
                                              value: isSwitched,
                                              onToggle: toggleSwitch),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: CustomSelectionBar(
                                isConfigreceived: false,
                                isSortIconNeeded: false,
                                circleSuffixIcon: false,
                                isSvg: false,
                                svgAsset: "",
                                width: MediaQuery.of(context).size.width,
                                list: _listOfStores,
                                hinttext: "All Store",
                                searchhinttext: "Search Store",
                                sheetTitle: "All Store",
                                controller: _storetextController,
                                searchController: _searchController,
                              ),
                            ),
                            Expanded(
                              child: Scrollbar(
                                thickness: 10,
                                interactive: true,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    // itemCount:_addCard,
                                    // itemCount: items.length,
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return SingleChildScrollView(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DetailedAlertScreen(),
                                                ));
                                          },
                                          child: Dismissible(
                                            // key: ValueKey<int>(items[index]),
                                            key: ValueKey(index),
                                            background: Container(
                                              color: Colors.redAccent,
                                              child: const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 40,
                                                ),
                                              ),
                                            ),
                                            secondaryBackground: Container(
                                              color: Colors.greenAccent,
                                              child: const Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(
                                                  Icons.check,
                                                  size: 40,
                                                ),
                                              ),
                                            ),

                                            // onDismissed: (DismissDirection direction) {
                                            //   if (direction == DismissDirection.startToEnd) {
                                            //     items.removeAt(index);
                                            //   }
                                            // },

                                            confirmDismiss:
                                                (DismissDirection direction) {
                                              if (direction ==
                                                  DismissDirection.startToEnd) {
                                                return showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) =>
                                                      InfoDialogWithTimer(
                                                    title: "Delete",
                                                    message:
                                                        "Are you sure to delete?",
                                                    isTimerActivated: true,
                                                    bttnText1: "Delete",
                                                    bttnText2: "Cancel",
                                                    isCancelButtonVisible: true,
                                                    onPressedBttn1: () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                    onPressedBttn2: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) =>
                                                      InfoDialogWithTimer(
                                                    title: "Acknowledge",
                                                    message:
                                                        "Are you sure to Acknowledge?",
                                                    isTimerActivated: true,
                                                    bttnText1: "Ok",
                                                    bttnText2: "Cancel",
                                                    isCancelButtonVisible: true,
                                                    onPressedBttn1: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                    onPressedBttn2: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                            child: Card(
                                              margin: const EdgeInsets.all(1),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5.5,
                                                color: Colors.white,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Icon(
                                                      Icons.arrow_left,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const TicketText(
                                                          islabelrequired: true,
                                                          isSameAsLabelStyle:
                                                              true,
                                                          label: "Ticket No :",
                                                          value: "1100224",
                                                          withlabelStyle:
                                                              TextStyle(
                                                                  fontSize: 23,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const TicketText(
                                                          islabelrequired:
                                                              false,
                                                          label: "",
                                                          value:
                                                              "10:00, 23March 2022",
                                                        ),
                                                        TicketText(
                                                          islabelrequired: true,
                                                          isSameAsLabelStyle:
                                                              false,
                                                          isIconNeeded: true,
                                                          icon:
                                                              SvgPicture.asset(
                                                            'assets/svg/clock.svg',
                                                            height: 20,
                                                          ),
                                                          label:
                                                              " Active Since:",
                                                          value: "17 Min",
                                                          valueStyle: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        Container(
                                                          height: 35,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.4,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18),
                                                                  color: (index %
                                                                              2 ==
                                                                          0)
                                                                      ? AppConstants
                                                                          .severityMinor
                                                                      : (index % 3 ==
                                                                              0)
                                                                          ? AppConstants
                                                                              .severityMajor
                                                                          : AppConstants
                                                                              .severityCritical),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const [
                                                              TicketText(
                                                                islabelrequired:
                                                                    false,
                                                                label: "",
                                                                valueStyle:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            19),
                                                                value:
                                                                    "Beverages",
                                                              ),
                                                              Text(
                                                                ',',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        19),
                                                              ),
                                                              TicketText(
                                                                islabelrequired:
                                                                    false,
                                                                label: "",
                                                                valueStyle:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            19),
                                                                value:
                                                                    "Hudson Square",
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Icon(
                                                        Icons.arrow_right),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),

                        // second tab bar viiew widget
                        const IncidentsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
