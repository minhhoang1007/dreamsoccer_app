import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListStepDetail extends StatefulWidget {
  String title;
  String namefile;
  ListStepDetail({Key key, this.title, this.namefile}) : super(key: key);

  @override
  _ListStepDetailState createState() => _ListStepDetailState();
}

class _ListStepDetailState extends State<ListStepDetail> {
  WebViewController _controller;
  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString(widget.namefile);
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(widget.title, style: TextStyle(color: Colors.white))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
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
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.25,
            //   child: Card(
            //     child: Image.asset(""),
            //   ),
            // ),
            // Container(
            //   child: Card(
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Center(
            //           child: Text("",
            //               style: TextStyle(fontWeight: FontWeight.bold)),
            //         ),
            //         Divider(
            //           color: Colors.grey,
            //         ),
            //         Center(
            //           child: Text(""),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
