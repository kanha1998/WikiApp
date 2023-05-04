import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:wiki/locator_init.dart';
import 'package:wiki/router.dart';
import 'package:wiki/view/HomePage/home_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Wiki App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          ),
    );
  }
}
