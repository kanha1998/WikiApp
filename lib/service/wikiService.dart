import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wiki/model/wiki_search_term_result.dart';

import '../model/wiki_summary_response.dart';

final wikiServiceProvider = Provider((ref) => WikiServiceImpl());

abstract class WikiService {
  Future getWikiSearch(String t);
}

class WikiServiceImpl extends WikiService {

  Future<WikiSearchTermResult> getWikiSearch(String title) async {
    final dio = Dio();
    dio
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': '*/*'
      };
    const baseUrl = "https://en.wikipedia.org/w/api.php";

    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "query",
          "format": "json",
          "prop": "pageimages|pageterms",
          "generator": "prefixsearch",
          "redirects": "1",
          "formatversion": "2",
          "piprop": "thumbnail",
          "pithumbsize": "50",
          "pilimit": "10",
          "wbptterms": "description",
          "gpssearch": title,
          "gpslimit": "20",

          "origin": "*",
        },
      );

      final result = WikiSearchTermResult.fromJson(response.data);
      return result;
    }
    catch (e) {
      return WikiSearchTermResult();
    }
  }

    Future<WikipediaSummaryData> searchSummaryWithPageId(
        {required int pageId}) async {

      final dio = Dio();
      dio
        ..options.headers = {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': '*/*'
        };
      const baseUrl = "https://en.wikipedia.org/w/api.php";

      try {
        final response = await dio.get(baseUrl,
        queryParameters: {
        "format": "json",
          "action": "query",
        "origin": "*",
        "pageids": pageId,
        "prop": "extracts|description"
        });


        final result=WikipediaSummaryData.fromJson(response.data["query"]["pages"]["$pageId"]);

        return result;
      }
      catch(e)
      {

         return WikipediaSummaryData();
      }
  }
}
