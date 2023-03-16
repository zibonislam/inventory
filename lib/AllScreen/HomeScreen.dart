import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHome extends StatelessWidget {
  // const MyHome({Key? key}) : super(key: key);

  static String idScreen = "MyHomeScreen";

  final TextEditingController taskTextEditingController =
      TextEditingController();

  _buildList(QuerySnapshot qs) {
    return ListView.builder(
        itemCount: qs.docs.length,
        itemBuilder: (context, index) {
          final DocumentSnapshot map = qs.docs[index];

          return ListTile(
            title: Text(map["title"]),
          );
        });
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: taskTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Enter Task Name",
                    hintStyle: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 229, 232, 229),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  // _addTask();
                  FirebaseFirestore.instance
                      .collection("food")
                      .add({"title": taskTextEditingController.text});
                  taskTextEditingController.text = "";
                  print("Values : " + taskTextEditingController.text);
                },
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("food").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LinearProgressIndicator();
              } else {
                return Expanded(
                  child: _buildList(snapshot.data!),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen Bar"),
      ),
      body: _buildBody(context),
      // body: Text("Test"),
    );
  }
}
