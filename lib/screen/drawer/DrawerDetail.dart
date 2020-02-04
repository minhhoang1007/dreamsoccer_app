import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DrawerDetail extends StatefulWidget {
  String title;
  String namefile;
  DrawerDetail({Key key, this.title, this.namefile}) : super(key: key);

  @override
  _DrawerDetailState createState() => _DrawerDetailState();
}

class _DrawerDetailState extends State<DrawerDetail> {
  WebViewController _controller;
  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString(widget.namefile);
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: height * 0.5,
            width: double.infinity,
            child: Center(
              child: WebView(
                initialUrl: '',
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                  _loadHtmlFromAssets();
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
