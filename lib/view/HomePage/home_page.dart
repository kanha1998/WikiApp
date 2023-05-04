

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wiki/widgets/history_suggestion_item.dart';

import '../../model/wiki_search_term_result.dart';
import '../../widgets/debouncer.dart';
import '../../widgets/suggestion_item.dart';
import 'home_page_viewModel.dart';


final homesearchTextEditing = TextEditingController();

final _debouncer = Debouncer(milliseconds: 500);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final data = ref.watch(HomePageViewModelProvider.notifier).recentSearched;
      print(data.toList().toString());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: (){
               // print("er");
              },
              child: TextField(
                controller: homesearchTextEditing,
                  onChanged: (val) async {
                  context.go("/search");
                  homesearchTextEditing.clear();

                },
                decoration: InputDecoration(
                    hintText: "Search...",
                    suffixIcon: InkWell(
                      child: const Icon(Icons.search, color: Colors.black),
                      onTap: () {

                      },
                    )),
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length ,
                itemBuilder: (context, index) {
                  return HistorySuggestionItem(page: data[index] ,context: context,);
                }),
          )



        ],
      ),

    );
  });
  }
}
