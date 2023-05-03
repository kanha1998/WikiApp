
import 'package:get_it/get_it.dart';
import 'package:wiki/model/search_Model.dart';
final locator = GetIt.instance;
final entity = GetIt.instance;

Future<void> setupLocator() async {


  locator.registerSingleton<SearchModel>(SearchModel.getInstance());


}
