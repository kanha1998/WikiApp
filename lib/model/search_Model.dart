import 'package:wiki/model/wiki_search_term_result.dart';

class SearchModel {
  static SearchModel? _instance;

  SearchModel();

  static SearchModel getInstance() {
    return _instance ?? SearchModel();
  }

  List<Pages>? searchList;
}
