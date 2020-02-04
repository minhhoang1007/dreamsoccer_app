import 'package:admob_flutter/admob_flutter.dart';
import 'package:dreamsoccer_app/screen/config/ads.dart';
import 'package:dreamsoccer_app/screen/drawer/DrawerScreen.dart';
import 'package:dreamsoccer_app/screen/home/ListStepScreen.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  bool isLoad = false;
  @override
  void initState() {
    bannerSize = AdmobBannerSize.MEDIUM_RECTANGLE;
    interstitialAd = AdmobInterstitial(
      adUnitId: interUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) {
          isLoad = false;
          interstitialAd.load();
        }
        handleEvent(event, args, 'Interstitial');
      },
    );
    //interstitialAd.load();
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

  Future<void> _shareText() async {
    try {
      Share.text('ID Product: ', 'My app', 'text/plain');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }),
        title: Text(
          "Guide for dream league 2020",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                    height: height * 0.25,
                    width: width * 0.8,
                    child: Image.asset("assets/images/bgbanner.jpg",
                        fit: BoxFit.fill),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // setState(() {
                      //   isLoad = true;
                      // });
                      interstitialAd.load();
                      if (await interstitialAd.isLoaded) {
                        interstitialAd.show();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListStepScreen()));
                      } else {
                        showSnackBar("Reward ad is still loading...");
                      }
                    },
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text("START",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _shareText();
                    },
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text("SHARE",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.white,
                    alignment: Alignment.bottomCenter,
                    child: AdmobBanner(
                      adUnitId: bannerId,
                      adSize: bannerSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isLoad
              ? Positioned(
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Container(
                  height: 0,
                ),
        ],
      ),
    );
  }
}
