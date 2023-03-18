import 'dart:developer';

import 'package:inventory/ApiCall/constants.dart';
import 'package:inventory/ApiCall/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>?> getPosts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.postEndpoint);

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Post> model = postFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> delete(int? id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.postEndpoint + "/" + "${id}");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        print("case Deleted");
      } else {
        throw "Failed to Delte";
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
