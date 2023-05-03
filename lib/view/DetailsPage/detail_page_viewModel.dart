

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki/model/wiki_summary_response.dart';
import 'package:wiki/service/wikiService.dart';





final detailsViewModelProvider = StateNotifierProvider<DetailsPageViewModel,WikipediaSummaryData>((ref) => DetailsPageViewModel());
class DetailsPageViewModel extends StateNotifier<WikipediaSummaryData>
{
  DetailsPageViewModel():super(WikipediaSummaryData());

  WikipediaSummaryData wikipediaSummaryData=WikipediaSummaryData();

  Future<WikipediaSummaryData> getWikipediaSummary(WidgetRef ref,int pageId) async
  {

    wikipediaSummaryData= await ref.read(wikiServiceProvider).searchSummaryWithPageId(pageId: pageId);
    state =wikipediaSummaryData;
    return wikipediaSummaryData;
  }
}