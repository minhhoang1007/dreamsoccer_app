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
                builder: (context) => DrawerDetail(
                      title: title,
                      namefile: namefile,
                    )));
        break;
      case AdmobAdEvent.failedToLoad:
        isLoad = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DrawerDetail(
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
    return Stack(
      children: <Widget>[
        Drawer(
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
                onTap: () {
                  getAd("Training", "files/framewebview1.html");
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
                trailing:
                    Text("Click more", style: TextStyle(color: Colors.grey)),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  getAd("Transfer Player", "files/framewebview2.html");
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
                trailing:
                    Text("Click more", style: TextStyle(color: Colors.grey)),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  getAd("Formation", "files/framewebview3.html");
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
                trailing:
                    Text("Click more", style: TextStyle(color: Colors.grey)),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  getAd("Coins", "files/framewebview4.html");
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
                trailing:
                    Text("Click more", style: TextStyle(color: Colors.grey)),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  getAd("Stadium", "files/framewebview5.html");
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
                trailing:
                    Text("Click more", style: TextStyle(color: Colors.grey)),
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
    );
  }
}
