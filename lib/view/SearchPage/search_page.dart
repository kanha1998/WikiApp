import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:wiki/locator_init.dart';
import 'package:wiki/model/search_Model.dart';
import 'package:wiki/model/wiki_search_term_result.dart';
import 'package:wiki/widgets/suggestion_item.dart';

import '../../widgets/debouncer.dart';
import 'search_page_viewModel.dart';


final _searchTextEditing = TextEditingController();
final _debouncer = Debouncer(milliseconds: 500);

class SearchPageView extends StatelessWidget {
  const SearchPageView ({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final data = ref.watch(SearchPageViewModelProvider).query;
      //   final result = ref.watch(homeViewFutureProvider(ref));
      return Scaffold(
          body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextField(
            controller: _searchTextEditing,
            onChanged: (val) async {

              _debouncer.run(() async {
                await ref
                    .read(SearchPageViewModelProvider.notifier)
                    .getSearchTerm(ref, val);
              });
            },
            decoration: InputDecoration(
                hintText: "Search...",
                suffixIcon: InkWell(
                  child: const Icon(Icons.search, color: Colors.black),
                  onTap: () {},
                )),
          ),
        ),


        SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data?.pages?.length ?? 0,
              itemBuilder: (context, index) {
                return SuggestionItem(page: data?.pages?[index] ?? Pages(),context: context,);
              }),
        )
      ]));
    });
  }
}
