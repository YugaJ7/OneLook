import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/supplement_model.dart';

class SupplementRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addSupplement(String userId, SupplementModel supplement) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('supplements')
        .add(supplement.toMap());
  }
}
