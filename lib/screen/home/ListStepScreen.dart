import 'package:dreamsoccer_app/screen/config/ads.dart';
import 'package:dreamsoccer_app/screen/drawer/DrawerScreen.dart';
import 'package:dreamsoccer_app/screen/home/ListStepDetail.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class ListStepScreen extends StatefulWidget {
  ListStepScreen({Key key}) : super(key: key);

  @override
  _ListStepScreenState createState() => _ListStepScreenState();
}

class _ListStepScreenState extends State<ListStepScreen> {
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  void initState() {
    bannerSize = AdmobBannerSize.LARGE_BANNER;
    interstitialAd = AdmobInterstitial(
      adUnitId: interUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
    super.initState();
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        showSnackBar('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        showSnackBar('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        showSnackBar('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        showSnackBar('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        break;
      default:
    }
  }

  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(milliseconds: 1500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Guide for dream league 2020",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                if (await interstitialAd.isLoaded) {
                  interstitialAd.show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListStepDetail(
                                title: "STEP 1-- About Dream League Games",
                                namefile: "files/step1.html",
                              )));
                } else {
                  showSnackBar("Reward ad is still loading...");
                }
              },
              child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text("STEP 1-- About Dream League Games",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (await interstitialAd.isLoaded) {
                  interstitialAd.show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListStepDetail(
                                title: "STEP 2-- About Dream League Games",
                                namefile: "files/step2.html",
                              )));
                } else {
                  showSnackBar("Reward ad is still loading...");
                }
              },
              child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text("STEP 2-- Dream League",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (await interstitialAd.isLoaded) {
                  interstitialAd.show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListStepDetail(
                                title: "STEP 3-- About Dream League Games",
                                namefile: "files/step3.html",
                              )));
                } else {
                  showSnackBar("Reward ad is still loading...");
                }
              },
              child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text("STEP 3-- Dream League",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (await interstitialAd.isLoaded) {
                  interstitialAd.show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListStepDetail(
                                title: "STEP 4-- About Dream League Games",
                                namefile: "files/step4.html",
                              )));
                } else {
                  showSnackBar("Reward ad is still loading...");
                }
              },
              child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text("STEP 4-- Dream League",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (await interstitialAd.isLoaded) {
                  interstitialAd.show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListStepDetail(
                                title: "STEP 5-- About Dream League Games",
                                namefile: "files/step5.html",
                              )));
                } else {
                  showSnackBar("Reward ad is still loading...");
                }
              },
              child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text("STEP 5-- Dream League",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              alignment: Alignment.bottomCenter,
              child: AdmobBanner(
                adUnitId: bannerId,
                adSize: bannerSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
