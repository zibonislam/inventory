import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory/ApiCall/models/post_model.dart';
import 'package:inventory/ApiCall/pages/detail.dart';
import 'package:inventory/ApiCall/services/postService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Post>? postModel = [];

  void getData() async {
    postModel = (await PostService().getPosts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    // TODO: implement initState

    getData();
  }

  Widget getPostList(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Post"),
          actions: [],
        ),
        body: postModel == null || postModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                // child: Text("List size is :" + "${postModel?.length}"),
                child: ListView.builder(
                    itemCount: postModel!.length,
                    itemBuilder: (context, index) {
                      // return Text(postModel![index].title.toString());
                      return ListTile(
                        leading: Icon(Icons.motion_photos_auto),
                        title: Text(postModel![index].title.toString()),
                        subtitle: Text(postModel![index].title.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    Detail(post: postModel![index]),
                              ),
                              (route) => false,
                            );
                          },
                          icon: Icon(Icons.accessibility_new),
                        ),
                        isThreeLine: true,
                      );
                    }),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return getPostList(context);
  }
}
