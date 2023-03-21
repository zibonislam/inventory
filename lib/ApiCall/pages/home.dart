import 'package:flutter/material.dart';
import 'package:inventory/ApiCall/models/product.dart';
import 'package:inventory/ApiCall/pages/create.dart';
import 'package:inventory/ApiCall/pages/detail.dart';
import 'package:inventory/ApiCall/services/productService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Product>? _productModel = [];

  void _getData() async {
    // _userModel = (await ApiService().getUsers())!;
    // _postsModel = (await ApiService().getPosts())!;
    _productModel = (await ProductApiService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Widget _getProductList(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example for Post'),
        actions: [
          IconButton(
              onPressed: () {
                // goBack(context);
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => FormApp(),
                  ),
                  (route) => false,
                );
              },
              icon: Icon(Icons.create))
        ],
      ),
      body: _productModel == null || _productModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                itemCount: _productModel!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(_productModel![index].name.toString()),
                    subtitle: Text(_productModel![index].email.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                Detail(product: _productModel![index]),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getProductList(context);
  }
}

// goBack(BuildContext context){
//   Navigator.pop(context);
// }
