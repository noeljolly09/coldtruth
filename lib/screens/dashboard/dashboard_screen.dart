import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import '../../custom_widgets/custom_selection.dart';
import '../../custom_widgets/progress_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
  final List<SelectedListItem> _listOfScores = [
    SelectedListItem(true, "1"),
    SelectedListItem(false, "2"),
    SelectedListItem(false, "3"),
    SelectedListItem(false, "4"),
    SelectedListItem(false, "5"),
    SelectedListItem(false, "6"),
  ];
  int touchedIndex = -1;

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _scoreTextController = TextEditingController();
  final TextEditingController _storeSearchController = TextEditingController();
  final TextEditingController _scoreSearchController = TextEditingController();
  var percent = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomSelectionBar(
                    circleSuffixIcon: false,
                    isSvg: false,
                    svgAsset: "",
                    width: MediaQuery.of(context).size.width,
                    list: _listOfStores,
                    hinttext: "All Store",
                    searchhinttext: "Search Store",
                    sheetTitle: "Stores",
                    controller: _textController,
                    searchController: _storeSearchController,
                    isConfigreceived: false,
                  ),
                ),
                const SizedBox(height: 10),

                Column(
                  children: [
                    CustomProgressIndicator(
                      percent: 10,
                      total: 100,
                      color: Colors.lightBlueAccent,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Normal",
                    ),
                    CustomProgressIndicator(
                      percent: 30,
                      total: 100,
                      color: Colors.pinkAccent,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Critical",
                    ),
                    CustomProgressIndicator(
                      percent: 60,
                      total: 100,
                      color: Colors.orangeAccent,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Warning",
                    ),
                    CustomProgressIndicator(
                      percent: 80,
                      total: 100,
                      color: Colors.grey,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Not Working",
                    ),
                  ],
                ),

                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 const CustomNavigationBar(pageIndex: 1)));
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.all(5),
                //     padding: const EdgeInsets.all(5),
                //     color: Colors.white,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: <Widget>[
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width / 2,
                //           height: MediaQuery.of(context).size.width / 2,
                //           child: PieChart(
                //             PieChartData(
                //                 pieTouchData: PieTouchData(touchCallback:
                //                     (FlTouchEvent event, pieTouchResponse) {
                //                   setState(() {
                //                     if (!event.isInterestedForInteractions ||
                //                         pieTouchResponse == null ||
                //                         pieTouchResponse.touchedSection ==
                //                             null) {
                //                       touchedIndex = -1;
                //                       return;
                //                     }
                //                     touchedIndex = pieTouchResponse
                //                         .touchedSection!.touchedSectionIndex;
                //                   });
                //                 }),
                //                 borderData: FlBorderData(
                //                   show: false,
                //                 ),
                //                 sectionsSpace: 0,
                //                 centerSpaceRadius: 30,
                //                 sections: showingSections(touchedIndex)),
                //           ),
                //         ),
                //         Column(
                //           mainAxisSize: MainAxisSize.max,
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const <Widget>[
                //             Indicator(
                //               numbertext: "100",
                //               size: 20,
                //               fontsize: 20,
                //               color: Color(0xff2ae729),
                //               text: 'Normal :',
                //             ),
                //             SizedBox(height: 4),
                //             Indicator(
                //               numbertext: "100",
                //               size: 20,
                //               fontsize: 20,
                //               color: Color(0xffe6a320),
                //               text: 'Warning :',
                //             ),
                //             SizedBox(height: 4),
                //             Indicator(
                //               numbertext: "100",
                //               size: 20,
                //               color: Color(0xff8b0000),
                //               fontsize: 20,
                //               text: 'Faulty :',
                //             ),
                //             SizedBox(height: 18),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomSelectionBar(
                    circleSuffixIcon: false,
                    isConfigreceived: false,
                    isSvg: false,
                    svgAsset: "",
                    width: MediaQuery.of(context).size.width,
                    list: _listOfScores,
                    hinttext: "Sort by criticality score",
                    searchhinttext: "Sort by criticality score",
                    sheetTitle: "Score",
                    controller: _scoreTextController,
                    searchController: _scoreSearchController,
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    thickness: 5,
                    interactive: true,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: InkWell(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  color: (index % 2 == 0)
                                      ? Colors.grey.shade400
                                      : Colors.white,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text('Hudson Square'),
                                          Text('5.5')
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
