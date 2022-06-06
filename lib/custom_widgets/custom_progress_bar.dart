import 'package:flutter/material.dart';
import 'package:idec_face/constants.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // isAlertStatusLoading
        //     ? CupertinoActivityIndicator(
        //         radius: 10,
        //       ):
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppConstants.severityCritical,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 30,
                    child: const Center(
                      child: Text(
                        '30',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppConstants.severityMajor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 30,
                        child: const Center(
                            child: Text(
                          '40',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppConstants.severityMinor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 30,
                        child: const Center(
                          child: Text(
                            '80',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
