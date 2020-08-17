import 'package:firebase_admob/firebase_admob.dart';

class AdmobServices {
  static BannerAd bannerAD;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    //testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.fullBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  void showBanner() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    if (bannerAD == null) {
      bannerAD = createBannerAd()
        ..load()
        ..show();
    }
  }

  void hideBanner() async {
    await bannerAD.dispose();
    bannerAD = null;
  }
}
