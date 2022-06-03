import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
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
                      percent: 80,
                      total: 100,
                      color: Colors.lightBlueAccent,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Normal",
                    ),
                    CustomProgressIndicator(
                      percent: 60,
                      total: 100,
                      color: Colors.pinkAccent,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Critical",
                    ),
                    CustomProgressIndicator(
                      percent: 30,
                      total: 100,
                      color: Colors.orangeAccent,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Warning",
                    ),
                    CustomProgressIndicator(
                      percent: 10,
                      total: 100,
                      color: Colors.grey,
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      qualityText: "Not Working",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: CustomSelectionBar(
                        circleSuffixIcon: false,
                        isConfigreceived: false,
                        isSvg: false,
                        svgAsset: "",
                        width: MediaQuery.of(context).size.width / 1.3,
                        list: _listOfScores,
                        hinttext: "Sort by criticality score",
                        searchhinttext: "Sort by criticality score",
                        sheetTitle: "Score",
                        controller: _scoreTextController,
                        searchController: _scoreSearchController,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
                  ],
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
                                      ? Colors.grey.shade300
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
