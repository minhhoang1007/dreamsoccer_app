import 'package:dreamsoccer_app/screen/config/ads.dart';
import 'package:dreamsoccer_app/screen/home/ListStepDetail.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class ListStepScreen extends StatefulWidget {
  ListStepScreen({Key key}) : super(key: key);

  @override
  _ListStepScreenState createState() => _ListStepScreenState();
}

class _ListStepScreenState extends State<ListStepScreen> {
  AdmobInterstitial interstitialAd;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  bool isLoad = false;
  @override
  void initState() {
    super.initState();
  }

  void getAd(title, namefile) async {
    setState(() {
      isLoad = true;
    });
    interstitialAd = AdmobInterstitial(
      adUnitId: interUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        handleEvent(event, args, 'Interstitial', title, namefile);
      },
    );
    interstitialAd.load();
  }

  void handleEvent(AdmobAdEvent event, Map<String, dynamic> args, String adType,
      title, namefile) {
    switch (event) {
      case AdmobAdEvent.loaded:
        interstitialAd.show();
        break;
      case AdmobAdEvent.opened:
        break;
      case AdmobAdEvent.closed:
        isLoad = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListStepDetail(
                      title: title,
                      namefile: namefile,
                    )));
        break;
      case AdmobAdEvent.failedToLoad:
        isLoad = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListStepDetail(
                      title: title,
                      namefile: namefile,
                    )));
        break;
      case AdmobAdEvent.rewarded:
        break;
      default:
    }
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
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 1-- About Dream League Games",
                        "files/step1.html");
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 2-- Dream League", "files/step2.html");
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 3-- Dream League", "files/step3.html");
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 4-- Dream League", "files/step4.html");
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 5-- Dream League", "files/step5.html");
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
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
