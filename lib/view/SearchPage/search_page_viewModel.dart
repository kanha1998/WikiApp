import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki/service/wikiService.dart';

import '../../model/wiki_search_term_result.dart';

final SearchPageViewModelProvider =
    StateNotifierProvider<SearchPageViewModel, WikiSearchTermResult>(
        (ref) => SearchPageViewModel());

class SearchPageViewModel extends StateNotifier<WikiSearchTermResult> {
  SearchPageViewModel() : super(WikiSearchTermResult());

  WikiSearchTermResult searchTermResult = WikiSearchTermResult();

  Future<WikiSearchTermResult> getSearchTerm(WidgetRef ref, String vale) async {
    searchTermResult = await ref.read(wikiServiceProvider).getWikiSearch(vale);
    state = searchTermResult;
    state.query?.pages?.sort((a, b) {
      int index1 = a.index ?? 0;
      int index2 = b.index ?? 0;
      return (index1 - index2);
    });
    return searchTermResult;
  }
}


/*
https://en.wikipedia.org/w/api.php?action=query&format=json&pageids=9845&prop=extracts|description&origin=*
 */