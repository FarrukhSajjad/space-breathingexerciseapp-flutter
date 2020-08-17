import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:space/data/calm_data.dart';
import 'package:space/dummy.dart';

import '../constant.dart';

class CalmScreen extends StatelessWidget {
  final String instruction;

  CalmScreen({
    this.instruction,
  });

  final InAppReview _inAppReview = InAppReview.instance;
  String _appStoreId = 'com.rookis.space';
  Future<void> _openStoreListing() =>
      _inAppReview.openStoreListing(appStoreId: _appStoreId);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final name = routeArgs['name'];
    final image = routeArgs['image'];
    final time = routeArgs['time'];
    final indexxx = routeArgs['indexX'];

    final int fIndex = int.parse(indexxx);

    final int tTime = int.parse(time);

    returnBottomSheet() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          " $name",
          style: GoogleFonts.acme(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: kBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            returnBottomSheet();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: _openStoreListing,
            child: Icon(
              Icons.star_border,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('$image'),
                radius: 125,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black38),
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: Center(child: Text('TIME $time Minutes')),
              ),
              SizedBox(
                height: 15,
              ),
              CalmSchedule(
                instruction: CALMINSTRUC[fIndex].instruction,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            color: Color(0xff757575),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: CircularCountDownTimer(
                                    onComplete: returnBottomSheet,
                                    isReverse: true,
                                    width: 200,
                                    height: 200,
                                    duration: tTime * 60 + 1,
                                    fillColor: Colors.red,
                                    color: Colors.grey),
                              ),
                            ),
                          ));
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width / 2 + 80,
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
