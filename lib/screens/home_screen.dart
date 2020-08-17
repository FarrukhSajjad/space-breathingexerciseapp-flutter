import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:space/admob_services.dart';
import 'package:space/constant.dart';
import 'package:space/data/breathing_data.dart';
import 'package:space/data/calm_data.dart';
import 'package:space/widgets/breathing_exrcise_type.dart';
import 'package:space/widgets/calm_type.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  final InAppReview _inAppReview = InAppReview.instance;

  final String _appStoreId = 'com.rookis.space';

  Future<void> _openStoreListing() =>
      _inAppReview.openStoreListing(appStoreId: _appStoreId);

  final ams = AdmobServices();

  BannerAd bannerAd;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.fullBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ams.showBanner();
  }

  @override
  void dispose() {
    super.dispose();
    ams.hideBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black54,
            onPressed: () {
              goBack(context);
            },
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: _openStoreListing,
              child: Icon(
                Icons.star_border,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'SPACE',
            style: GoogleFonts.amaticSc(
              color: Colors.black,
              fontSize: 40,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: kBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Breathing Exercises',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: BREATHINGDATA
                              .map((e) => BreathingExerciseType(
                                    image: e.image,
                                    name: e.name,
                                    time: e.duration,
                                    index: e.index,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Text(
                      'Calm you Thoughts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: CALMDATA
                              .map((e) => CalmType(
                                    image: e.image,
                                    name: e.name,
                                    time: e.duration,
                                    index: e.index,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    AdmobBanner(
                      adSize: AdmobBannerSize.FULL_BANNER,
                      adUnitId: ams.getBannerAdID(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
