

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wiki/model/wiki_search_term_result.dart';


final LocalServiceProvider = Provider((ref) => LocalService());
class LocalService {



  List<Pages> addItem(Pages page)
  {
    var box = Hive.box('myBox');



    box.put(page.pageid,jsonEncode(page));

   var values =box.values.toList();

    List<Pages> list=[];

    for(int i=0;i<values.length;i++)
      {

        Map<String,dynamic> map = jsonDecode(values[i]) as Map<String, dynamic>;



        list.add(Pages(
          extract: map["extract"],
          pageid: map["pageid"],
          ns:map["ns"],
          title: map["title"],
          index: map["index"],
            terms: map['terms'] != null ? new Terms.fromJson(map['terms']) : null
        ));


      }






    return list;

  }

  List<Pages> getAllItems()
  {

    var box = Hive.box('myBox');




    var values =box.values.toList();

    List<Pages> list=[];

    for(int i=0;i<values.length;i++)
    {

      Map<String,dynamic> map = jsonDecode(values[i]) as Map<String, dynamic>;


      list.add(Pages(
          pageid: map["pageid"],
          ns:map["ns"],
          title: map["title"],
          index: map["index"],
          terms: map['terms'] != null ? new Terms.fromJson(map['terms']) : null,

      ));


    }

    return list;
  }

}