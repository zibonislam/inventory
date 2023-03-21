import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory/ApiCall/constants.dart';
import 'package:inventory/ApiCall/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/main.dart';

class ProductApiService {
  Future<List<Product>?> getProducts() async {
    try {
      var url =
          Uri.parse(ApiConstants.productBaseUrl + ApiConstants.productEndpoint);
      final storage = const FlutterSecureStorage();
      var value = await storage.read(key: 'token');
      print(value);

      var header = headers;
      header['Authorization'] = 'Bearer $value';

      var response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        List<Product> model = productFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> delete(int? id) async {
    try {
      var url = Uri.parse(ApiConstants.productBaseUrl +
          ApiConstants.productEndpoint +
          "/delete/" +
          "${id}");

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

  Future<Product?> createproduct(Product product) async {
    var url = Uri.parse(
        ApiConstants.productBaseUrl + ApiConstants.productEndpoint + "/save");
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product));
    if (response.statusCode == 200) {
      Product post = Product.fromJson(jsonDecode(response.body));
      return post;
    } else {
      throw Exception("Failed to load a case");
    }
  }

  Future<Product?> updateProduct(Product product) async {
    var url = Uri.parse(
        ApiConstants.productBaseUrl + ApiConstants.productEndpoint + "/save");
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product));

    if (response.statusCode == 200) {
      Product post = Product.fromJson(jsonDecode(response.body));
      return post;
    } else {
      throw Exception("Failed to load a case");
    }
  }
}
