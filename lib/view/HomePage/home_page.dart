

import 'package:flutter/material.dart';

import '../../widgets/debouncer.dart';


final _searchTextEditing = TextEditingController();

final _debouncer = Debouncer(milliseconds: 500);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              controller: _searchTextEditing,
              onChanged: (val) async {

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

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: data?.pages?.length ?? 0,
                itemBuilder: (context, index) {
                  return SuggestionItem(page: data?.pages?[index] ?? Pages(),context: context,);
                }),
          )

        ],
      ),

    );
  }
}
