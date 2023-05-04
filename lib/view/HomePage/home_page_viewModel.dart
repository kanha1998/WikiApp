


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki/model/wiki_search_term_result.dart';

import '../../service/local_storage_service.dart';


final HomePageViewModelProvider =
StateNotifierProvider<HomePageViewModel, List<Pages>>(
        (ref) => HomePageViewModel());
class HomePageViewModel extends StateNotifier<List<Pages>>
{
  HomePageViewModel():super([]);

  List<Pages> recentSearched=[];

  List<Pages> getRecentSearches(WidgetRef ref)
  {
    recentSearched= ref.read(LocalServiceProvider).getAllItems();
    state=recentSearched;
    return recentSearched;
  }
  List<Pages> addRecentItem(WidgetRef ref,Pages page)
  {

   recentSearched= ref.read(LocalServiceProvider).addItem(page);
   state =recentSearched;
   return recentSearched;
  }



}



