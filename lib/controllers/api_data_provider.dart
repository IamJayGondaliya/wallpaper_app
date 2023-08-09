import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/controllers/helpers/api_helper.dart';
import 'package:wallpaper_app/models/post_model.dart';

class ApiController extends ChangeNotifier {
  Posts? post;
  // String
  List data = [];

  ApiController() {
    search();
  }

  Future<void> getData() async {
    post = await ApiHelper.apiHelper.getSingleResponse();
    notifyListeners();
  }

  search({String val = "nature"}) async {
    data = await ApiHelper.apiHelper.getWallpapers(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
