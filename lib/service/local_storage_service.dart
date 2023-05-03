

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wiki/model/wiki_search_term_result.dart';


final LocalServiceProvider = Provider((ref) => LocalService());
class LocalService {



  void addItem(Pages page)
  {
    var box = Hive.box('myBox');

    box.put(page.pageid,page.toJson().toString());



  }

  List<Pages> getAllItems()
  {

    var box = Hive.box('myBox');








    return [];

  }

}