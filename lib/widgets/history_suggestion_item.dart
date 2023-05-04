
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiki/widgets/history_details_page.dart';

import '../model/wiki_search_term_result.dart';

class HistorySuggestionItem extends StatelessWidget {
  const HistorySuggestionItem({Key? key,required this.context,required this.page}) : super(key: key);


  final Pages page;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return InkWell(
          onTap: ()  async{


            Navigator.push(context,  MaterialPageRoute (
              builder: (BuildContext context) => HistoryDetailsPage(data: page.extract??""),
            ));


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
