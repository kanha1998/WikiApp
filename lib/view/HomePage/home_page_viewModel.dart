


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki/model/wiki_search_term_result.dart';

import '../../service/local_storage_service.dart';

class HomePageViewModel extends StateNotifier<List<Pages>>
{
  HomePageViewModel():super([]);

  List<Pages> recentSearched=[];

  List<Pages> getRecentSearches(WidgetRef ref)
  {
    recentSearched= ref.read(LocalServiceProvider).getAllItems();
    return recentSearched;
  }


}



