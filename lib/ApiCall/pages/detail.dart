import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory/ApiCall/models/post_model.dart';
import 'package:inventory/ApiCall/services/postService.dart';

class Detail extends StatelessWidget {
  final Post? post;

  const Detail({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          post!.title.toString(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  post!.body.toString(),
                ),
                TextButton(
                  onPressed: () async {
                    await PostService().delete(post!.id);
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
