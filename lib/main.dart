import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:wiki/locator_init.dart';
import 'package:wiki/view/SearchPage/search_page.dart';





Box? box;


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  box = await Hive.openBox('myBox');
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wiki App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  SearchPageView(
          )),
    );
  }
}
