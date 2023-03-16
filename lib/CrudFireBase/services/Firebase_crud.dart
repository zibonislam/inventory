import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/CrudFireBase/models/Response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection("Employee");

class FirebaseCrud {
  static Future<Response> addEmployee({
    required String taskname,
    required String taskdetail,
    required String status,
  }) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "taskname": taskname,
      "task_detail": taskdetail,
      "status": status,
    };
    var result = await documentReference.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Successful";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }
}
