import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:wiki/locator_init.dart';
import 'package:wiki/model/search_Model.dart';
import 'package:wiki/view/DetailsPage/detail_page_viewModel.dart';
import 'package:wiki/view/DetailsPage/details_page.dart';

import '../model/wiki_search_term_result.dart';
import '../service/local_storage_service.dart';

class SuggestionItem extends StatelessWidget {
  const SuggestionItem({Key? key, required this.page,required this.context}) : super(key: key);

  final Pages page;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
        return InkWell(
            onTap: ()  async{

             await  ref.read(detailsViewModelProvider.notifier).getWikipediaSummary(ref,page.pageid??0);

             ref.read(LocalServiceProvider).addItem(page);
              Navigator.push(context,  MaterialPageRoute (
                builder: (BuildContext context) => DetailsPage(pageId: page!.pageid??0,),
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
    /*
      Row(
        children: [
          Column(
            children: [
              Text(page.title.toString()),
              FittedBox(child: Text(page.terms?.description?.first.toString()??"",maxLines: 4,)),
            ],
          ),
          const Spacer(),
          if(page.thumbnail!=null) Expanded(
            child: CachedNetworkImage(
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
              imageUrl: page.thumbnail?.source??"",
            ),
          ),
          SizedBox(width: 20,)

        ],
      ),



    );

     */
  }
}
