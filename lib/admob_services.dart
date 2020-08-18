import 'package:firebase_admob/firebase_admob.dart';

class AdmobServices {
  static BannerAd bannerAD;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    //testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>[
      'health',
      'fitness',
      'relaxing app',
      'breathing exercises',
    ],

    childDirected: false,
    nonPersonalizedAds: true,
  );

  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: 'ca-app-pub-2939046688987674/8682811437',
      size: AdSize.fullBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  static InterstitialAd interstitialAd;

  static InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-2939046688987674/5522311536',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterAd event $event");
      },
    );
  }

  void showInterAd() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-2939046688987674~8653416493');
    if (interstitialAd == null) {
      interstitialAd = createInterstitialAd()
        ..load()
        ..show();
    }
  }

  void showBanner() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-2939046688987674~8653416493');
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
