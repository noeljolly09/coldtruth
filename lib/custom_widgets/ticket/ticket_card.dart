import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:idec_face/custom_widgets/ticket/ticket_text.dart';

import '../../../constants.dart';
import '../../../custom_widgets/custom_selection.dart';
import '../../../custom_widgets/text.dart';

class CustomCardTicket extends StatefulWidget {
  const CustomCardTicket({Key? key}) : super(key: key);

  @override
  _CustomCardTicketState createState() => _CustomCardTicketState();
}

class _CustomCardTicketState extends State<CustomCardTicket> {
  final List<SelectedListItem> _listOfStores = [
    SelectedListItem(false, ""),
    SelectedListItem(false, ""),
    SelectedListItem(false, ""),
    SelectedListItem(false, ""),
    SelectedListItem(false, ""),
    SelectedListItem(false, ""),
  ];
  final TextEditingController _storetextController = TextEditingController();
  final TextEditingController _statustextController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  // var _addCard = 0;

  // void _incrementCard() {
  //   setState(() {
  //     _addCard++;
  //   });
  // }

  bool isSwitched = false;
  var textValue = 'UnActive';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Active';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Unactive';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.inColor,
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          title: const Text("ColdTruth"),
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              const Drawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCard,
        //   child: const Icon(Icons.add),
        // ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  child: const CustomTextWidget(
                      text: "Mr.MarshMello",
                      size: 30,
                      color: AppConstants.primaryColor),
                ),
                CustomSelectionBar(
                  isConfigreceived: false,
                  circleSuffixIcon: true,
                  isSvg: false,
                  svgAsset: "",
                  width: MediaQuery.of(context).size.width,
                  list: _listOfStores,
                  hinttext: "Search Stores",
                  searchhinttext: "Search Store",
                  sheetTitle: "Stores",
                  controller: _storetextController,
                  searchController: _searchController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          textValue,
                          style: const TextStyle(
                              fontSize: 20, color: AppConstants.secondaryColor),
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: AppConstants.secondaryColor,
                          activeTrackColor: AppConstants.primaryColor,
                          inactiveThumbColor: Colors.redAccent,
                          inactiveTrackColor: Colors.orange,
                        ),
                      ],
                    ),
                    CustomSelectionBar(
                      isConfigreceived: false,
                      isSvg: false,
                      circleSuffixIcon: true,
                      svgAsset: "",
                      list: _listOfStores,
                      width: MediaQuery.of(context).size.width / 2,
                      controller: _statustextController,
                      searchController: _statusController,
                      hinttext: "Status",
                      searchhinttext: "Status",
                      sheetTitle: "Status",
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // itemCount:_addCard,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: Text("${index + 1}",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          backgroundColor:
                                              AppConstants.primaryColor,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 4),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            TicketText(
                                              islabelrequired: true,
                                              label: "Ticket No.",
                                              value: "1100224",
                                            ),
                                            TicketText(
                                              islabelrequired: false,
                                              label: "",
                                              value: "10:00,23March 2022",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            TicketText(
                                              islabelrequired: true,
                                              label: "Active Time",
                                              value: "17 Min",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            TicketText(
                                              islabelrequired: false,
                                              label: "Area",
                                              value: "Beverages",
                                            ),
                                            TicketText(
                                              islabelrequired: false,
                                              label: "Store",
                                              value: "Hudson Square",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
