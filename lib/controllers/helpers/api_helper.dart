import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/post_model.dart';

class ApiHelper {
  //Singleton class
  //  1) create private named constructor
  ApiHelper._();
  //  2) assign into static final object
  static final ApiHelper apiHelper = ApiHelper._();

  // Get Api response
  String api = "https://jsonplaceholder.typicode.com/posts";

  Future<List?> getWallpapers({String query = "nature"}) async {
    String wallpaperApi =
        "https://pixabay.com/api/?key=38341210-68d5a377852299073299c9228&q=$query&orientation=vertical&safesearch=true&category=wallpaper";
    http.Response response = await http.get(Uri.parse(wallpaperApi), headers: {});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print("=================================");
      print("DATA: ${data['hits']}");
      print("=================================");

      List allData = data['hits'];

      return allData;
    }
  }

  Future<Posts?> getSingleResponse() async {
    //1. get response
    http.Response response = await http.get(Uri.parse(api));

    //2. check status code
    if (response.statusCode == 200) {
      //3. parse(decode) response body
      Map data = jsonDecode(response.body);

      Posts post = Posts.fromMap(data: data);

      return post;
    }
  }

  Future<List<Posts>?> getMultipleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List allData = jsonDecode(response.body);

      List<Posts> allPosts = allData.map((e) => Posts.fromMap(data: e)).toList();

      return allPosts;
    }
  }
}
