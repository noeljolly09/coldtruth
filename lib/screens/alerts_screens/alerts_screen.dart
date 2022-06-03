import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idec_face/screens/alerts_screens/detailed_alert_screen.dart';

import '../../constants.dart';
import '../../custom_widgets/custom_selection.dart';
import '../../custom_widgets/ticket/ticket_text.dart';

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
  final List<SelectedListItem> _listofStatus = [
    SelectedListItem(false, "Active"),
    SelectedListItem(false, "Inactive"),
    SelectedListItem(false, "Acknowledged"),
    SelectedListItem(false, "In Process"),
    SelectedListItem(false, ""),
    SelectedListItem(false, ""),
  ];
  final TextEditingController _storetextController = TextEditingController();
  final TextEditingController _statustextController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  bool isSwitched = false;

  var textValue = 'Inactive';

  void toggleSwitch(bool? value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Active';
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
                CustomSelectionBar(
                  isConfigreceived: false,
                  circleSuffixIcon: false,
                  isSvg: false,
                  svgAsset: "",
                  width: MediaQuery.of(context).size.width / 1.2,
                  list: _listOfStores,
                  hinttext: "All Store",
                  searchhinttext: "Search Store",
                  sheetTitle: "Stores",
                  controller: _storetextController,
                  searchController: _searchController,
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            textValue,
                            style: const TextStyle(
                                fontSize: 20,
                                color: AppConstants.secondaryColor),
                          ),
                          Checkbox(value: isSwitched, onChanged: toggleSwitch),
                        ],
                      ),
                      CustomSelectionBar(
                        isConfigreceived: false,
                        isSvg: false,
                        circleSuffixIcon: false,
                        svgAsset: "",
                        list: _listofStatus,
                        width: MediaQuery.of(context).size.width / 2,
                        controller: _statustextController,
                        searchController: _statusController,
                        hinttext: "Status",
                        searchhinttext: "Status",
                        sheetTitle: "Status",
                      ),
                    ],
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
                        itemCount: 50,
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
                                    alignment: Alignment.centerRight,
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

                                confirmDismiss: (DismissDirection direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    return showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Delete"),
                                        content: const Text(
                                            "Are you sure to delete"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop(false);
                                              },
                                              child: const Text('Cancel')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop(true);
                                              },
                                              child: const Text('Delete'))
                                        ],
                                      ),
                                    );
                                  } else {
                                    return showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Update"),
                                        content: const Text(
                                            "Are you sure to Update"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop(false);
                                              },
                                              child: const Text('Cancel')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop(false);
                                              },
                                              child: const Text('Update'))
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: Card(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.arrow_left,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const TicketText(
                                              islabelrequired: true,
                                              isSameAsLabelStyle: true,
                                              label: "Ticket No :",
                                              value: "1100224",
                                              withlabelStyle: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
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
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.6,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.greenAccent),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                        const Icon(Icons.arrow_right),
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
          ],
        ),
      ),
    );
  }
}
