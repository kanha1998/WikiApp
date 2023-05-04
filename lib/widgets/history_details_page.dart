

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HistoryDetailsPage extends StatelessWidget {
  const HistoryDetailsPage({Key? key,required this.data}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: InAppWebView(
          initialData: InAppWebViewInitialData(data: data??""),
          initialSettings: InAppWebViewSettings(
            supportZoom: false,
            javaScriptEnabled: true,
            disableHorizontalScroll: false,
            disableVerticalScroll: false,
            defaultFontSize: 14,
          ),
        ));
  }
}
