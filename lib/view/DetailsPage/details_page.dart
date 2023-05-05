
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:wiki/view/DetailsPage/detail_page_viewModel.dart';

late InAppWebViewController controller;
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, this.pageId}) : super(key: key);
  final int? pageId;

  @override
  Widget build(BuildContext context) {

    return Consumer(builder: (context, ref, child)
    {
      final data = ref.watch(detailsViewModelProvider).extract;
      return Scaffold(
        appBar: AppBar(
          title: Text("Wikipedia")
        ),
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
    });
  }
}




    //return WebViewWidget(controller: controller);




/*

    return InAppWebView(
      initialUrlRequest:
      URLRequest(url: WebUri("https://en.wikipedia.org/?curid=$pageId")),
      initialSettings: InAppWebViewSettings(
        supportZoom: false,
        javaScriptEnabled: true,
        disableHorizontalScroll: false,
        disableVerticalScroll: true,
        defaultFontSize: 14,
      ),
      onWebViewCreated: (controller) {
      //  webViewController = controller;
      },
        onLoadStart: (webview,url)
        {
          controller=webview;
        },


      onLoadStop: (webViewController,url) async{
        var html = await controller.evaluateJavascript(
            source: "window.document.body.innerText");
      webViewController.getHtml().then((value) => print(value));
        print(html);
       print(await controller.getHtml().then((value) => print(value)));
        print(url);
        webViewController.saveWebArchive(filePath: "test");
      });




 */





