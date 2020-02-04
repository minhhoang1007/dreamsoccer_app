import 'package:admob_flutter/admob_flutter.dart';
import 'package:dreamsoccer_app/screen/config/ads.dart';
import 'package:dreamsoccer_app/screen/drawer/DrawerDetail.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  AdmobInterstitial interstitialAd;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  void initState() {
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
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "assets/images/Logo.jpg",
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Text("Guide: Dream Win League Soccer 2020",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              )),
          ListTile(
            onTap: () async {
              if (await interstitialAd.isLoaded) {
                interstitialAd.show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DrawerDetail(
                              title: "Training",
                              namefile: "files/framewebview1.html",
                            )));
              } else {
                showSnackBar("Reward ad is still loading...");
              }
            },
            leading: Image.asset(
              "assets/images/Logo.jpg",
              width: 60,
              height: 60,
            ),
            title: Text(
              "Training",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("Click more", style: TextStyle(color: Colors.grey)),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () async {
              if (await interstitialAd.isLoaded) {
                interstitialAd.show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DrawerDetail(
                              title: "Transfer Player",
                              namefile: "files/framewebview2.html",
                            )));
              } else {
                showSnackBar("Reward ad is still loading...");
              }
            },
            leading: Image.asset(
              "assets/images/Logo.jpg",
              width: 60,
              height: 60,
            ),
            title: Text(
              "Transfer Player",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("Click more", style: TextStyle(color: Colors.grey)),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () async {
              if (await interstitialAd.isLoaded) {
                interstitialAd.show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DrawerDetail(
                              title: "Formation",
                              namefile: "files/framewebview3.html",
                            )));
              } else {
                showSnackBar("Reward ad is still loading...");
              }
            },
            leading: Image.asset(
              "assets/images/Logo.jpg",
              width: 60,
              height: 60,
            ),
            title: Text(
              "Formation",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("Click more", style: TextStyle(color: Colors.grey)),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () async {
              if (await interstitialAd.isLoaded) {
                interstitialAd.show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DrawerDetail(
                              title: "Coins",
                              namefile: "files/framewebview4.html",
                            )));
              } else {
                showSnackBar("Reward ad is still loading...");
              }
            },
            leading: Image.asset(
              "assets/images/Logo.jpg",
              width: 60,
              height: 60,
            ),
            title: Text(
              "Coins",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("Click more", style: TextStyle(color: Colors.grey)),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () async {
              if (await interstitialAd.isLoaded) {
                interstitialAd.show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DrawerDetail(
                              title: "Stadium",
                              namefile: "files/framewebview5.html",
                            )));
              } else {
                showSnackBar("Reward ad is still loading...");
              }
            },
            leading: Image.asset(
              "assets/images/Logo.jpg",
              width: 60,
              height: 60,
            ),
            title: Text(
              "Stadium",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("Click more", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
