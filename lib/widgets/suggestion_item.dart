import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:wiki/locator_init.dart';
import 'package:wiki/model/search_Model.dart';
import 'package:wiki/model/wiki_summary_response.dart';
import 'package:wiki/view/DetailsPage/detail_page_viewModel.dart';
import 'package:wiki/view/DetailsPage/details_page.dart';
import 'package:wiki/view/SearchPage/search_page_viewModel.dart';

import '../model/wiki_search_term_result.dart';
import '../service/local_storage_service.dart';
import '../view/HomePage/home_page_viewModel.dart';
import '../view/SearchPage/search_page.dart';

class SuggestionItem extends StatelessWidget {
  const SuggestionItem({Key? key, required this.page,required this.context}) : super(key: key);

  final Pages page;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
        return InkWell(
            onTap: ()  async{

            WikipediaSummaryData summary=  await  ref.read(detailsViewModelProvider.notifier).getWikipediaSummary(ref,page.pageid??0);

              page.extract=summary.extract;
             print(page.toJson().toString());
             ref.read(HomePageViewModelProvider.notifier).addRecentItem(ref, page);
             ref.read(SearchPageViewModelProvider.notifier).clearSearch(ref);

              Navigator.push(context,  MaterialPageRoute (
                builder: (BuildContext context) => DetailsPage(pageId: page!.pageid??0,),
              ));

             searchTextEditing.clear();



            },
            child: ListTile(
              trailing: (page.thumbnail != null)
                  ? CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      imageUrl: page.thumbnail?.source ?? "",
                    )
                  : const SizedBox(),
              title: Text(page.title.toString()?? ""),
              subtitle: Text(page.terms?.description?.first.toString() ?? ""),
            ));
      }
    );

  }
}
