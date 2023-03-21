import 'package:flutter/material.dart';
import 'package:inventory/ApiCall/models/product.dart';
import 'package:inventory/ApiCall/services/productService.dart';

class Detail extends StatelessWidget {
  final Product? product;

  const Detail({Key? key, this.product}) : super(key: key);

  Widget getProduct(context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 1.0),
            Text(
              "Id : " + product!.id.toString(),
              style: TextStyle(fontSize: 15, fontFamily: "bolt-semibold"),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 1.0), // give it width

            Text(
              product!.name.toString(),
              style: TextStyle(fontSize: 10, fontFamily: "bolt-semibold"),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 1.0), // give it width

            TextButton(
                onPressed: () async {
                  (await ProductApiService().delete(product!.id));
                  // print("Delete Call!");
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                child: Icon(Icons.delete)),
            TextButton(
                onPressed: () {
                  print("Update Call!");
                },
                child: Icon(Icons.update)),
          ],
          // Text(_postsModel![index].body.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // (userModel != null) ? userModel!.name : posts!.title.toString(),
          product!.name.toString(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/home", (route) => false);
              },
              icon: Icon(Icons.list_alt))
        ],
      ),
      body: getProduct(context),
    );
  }
}
