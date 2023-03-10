
import 'package:cloud_firestore/cloud_firestore.dart';

class QueryService{
  getQueryMuscle(String type){
    return FirebaseFirestore.instance
        .collection('Muscles')
        .where('type', isEqualTo: type)
        .get();
  }
}